using DealCart.BLL.Interfaces;
using DealCart.BLL.Services;
using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using System.Net;

namespace DealCart.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProduct _product;
        private readonly ICategory _category;
        private readonly IWebHostEnvironment _hostEnvironment;
        public readonly IHttpContextAccessor _con;

        public ProductController(IProduct product, ICategory category, IWebHostEnvironment hostEnvironment, IHttpContextAccessor contextAccessor)
        {
            _product = product;
            _category = category;   
            _hostEnvironment = hostEnvironment;
            _con = contextAccessor;
        }

        public IActionResult Index()
        {
            if (_con.HttpContext.Session.GetString("UserName") != null)

            {
                var products = _product.GetProducts();
                return View(products);
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }
        }

    
        public IActionResult Upsert(int? id)
        {
           

            ViewBag.CategoryList = _category.GetCategories().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.ID.ToString()
            });
            if (id == null || id == 0)
            {
                //create product
              
                return View(new ProductUpsertModel());
            }
            else
            {
                var product = _product.FillProductModel(id.Value);


                return View(product);

                //update product
            }


        }


       
        
        
        
        [HttpPost]
      
        public IActionResult Upsert(ProductUpsertModel model)
        {

            try
            {
                   string wwwRootPath = _hostEnvironment.WebRootPath;

                if (!string.IsNullOrEmpty(model.SortOrders))
                {
                    List<SortOrder> oldimages = JsonConvert.DeserializeObject<List<SortOrder>>(model.SortOrders);
                    try
                    {
                       foreach(var item in oldimages)
                        {
                            bool update = _product.UpdateImageSortOrder(item.Id, item.Order);
                        }
                    }
                    catch (Exception e) { }

                }
                List<ProductImage> fileDetails = new List<ProductImage>();
                    for (int i = 0; i < Request.Form.Files.Count; i++)
                    {
                        var file = Request.Form.Files[i];

                        if (file != null && file.Length > 0)
                        {
                            var fileName = Path.GetFileName(file.FileName);

                            var filePath = _product.SaveProductImage(file.FileName, wwwRootPath, file);
                            var order = _product.GetHighestImageSortOrder(model.ID);
                            ProductImage fileDetail = new ProductImage()
                            {
                                ImageUrl = filePath,
                                SortOrder = order + i+ 1
                            };
                            fileDetails.Add(fileDetail);

                        }

                    }
                    model.ProductImages= fileDetails;

               
                    //Convert json string to List
                    if (!string.IsNullOrEmpty(model.JsonQuantityData))
                    {
                        List<ProductQuantity> quantityitems = JsonConvert.DeserializeObject<List<ProductQuantity>>(model.JsonQuantityData);
                        try
                        {
                            model.ProductQuantities = quantityitems;
                            model.QuantityDataCount = quantityitems.Count;
                        }
                        catch (Exception e) { }

                    }

                    bool result = _product.AddEditProduct(model);
                    if (result == true)
                    {
                        TempData["success"] = (model.ID == 0) ? "Product created successfully" : "Product updated successfully";
                    }



                

            }
            catch (Exception e)
            {
                _ = e.Message;
            }
                return RedirectToAction("Index");


        }


        public IActionResult Delete(int Id)
        {
            string wwwRootPath = _hostEnvironment.WebRootPath;
            bool response = _product.DeleteProduct(Id, wwwRootPath);
            return Ok(response);
        }


        public IActionResult GetDiscountPrice(int Percent, float Price)
        {

            var DSPRICE = (float)((Percent * Price) / 100);

            float DiscountPrice = DSPRICE;
            int round = (int)Math.Round(DSPRICE, MidpointRounding.AwayFromZero);
            DiscountPrice = Price-round;
           
            return Ok(DiscountPrice);
        }

        [HttpPost]
        public JsonResult DeleteFile(int? id)
        {
            if (id==0 || id==null)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json(new { Result = "Error" });
            }
            try
            {
                string wwwRootPath = _hostEnvironment.WebRootPath;
                bool response = _product.DeleteImage(id.Value, wwwRootPath);
                return Json(new { Result = (response==true)? "OK" : "Unable to delete" });
            }
            catch (Exception ex)
            {
                return Json(new { Result = "ERROR", Message = ex.Message });
            }
        }


        public IActionResult Detail(int id)
        {
            var product = _product.GetProductById(id);
            return View(product);

        }

        [HttpPost]
        public async Task<IActionResult> ValidateProductStock(int ProductId, int QuantityId, string Name)
        {

            (bool, List<string>) result = ValidateProductFromStock(ProductId, QuantityId, Name);
            return Json(new { status = result.Item1, messages = result.Item2 });
        }

        public (bool, List<string>) ValidateProductFromStock(int ProductId, int QuantityId, string Name)
        {
            bool isValid = true;
            List<string> lstMessage = new List<string>();

            ValidateProduct result = _product.ValidateProduct(ProductId);
            int Quantity = _product.GetQuantityById(QuantityId, ProductId);
            if (result != null)
            {
                if (result.RemainingProduct <= -1 || result.RemainingProduct == 0)
                {
                    isValid = false;
                    lstMessage.Add($"{Name} is Out of Stock.");
                }
                else if (result.RemainingProduct > 0 && Quantity > result.RemainingProduct)
                {
                    isValid = false;

                    lstMessage.Add($"Currently {result.RemainingProduct} {Name} are available in stock.");
                }
            }
            return (isValid, lstMessage);
        }

    }
}
