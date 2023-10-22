using DealCart.BLL.Interfaces;
using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;
using System.Xml.Linq;
using Microsoft.Data.SqlClient;
using System.Data;

namespace DealCart.BLL.Services
{
    public class ProductService : IProduct
    {

        DealCartContext db;

        public ProductService(DealCartContext _db)
        {
            db = _db;
        }


        public bool DeleteProduct(int Id, string wwwRootPath)
        {
            var product = db.tblProducts.Include(p=>p.tblProductImages).Include(q=>q.tblQuantities).Where(p => p.ID == Id).FirstOrDefault();
            if (product != null)
            {
                try
                {

                    //var oldImagePath = Path.Combine(wwwRootPath, product.ImageUrl.TrimStart('\\'));
                    foreach(var item in product.tblProductImages)
                    {
                        var oldImagePath = Path.Combine(wwwRootPath, @"\Store\ProductImages", item.ImagePath);
                        if (System.IO.File.Exists(oldImagePath))
                        {
                            System.IO.File.Delete(oldImagePath);
                        }

                    }
                    //if (System.IO.File.Exists(oldImagePath))
                    //{
                    //    System.IO.File.Delete(oldImagePath);
                    //}
                    //List<tblQuantity> list = db.tblQuantities.Where(q => q.ProductID == product.ID).ToList();
                    //db.tblQuantities.RemoveRange(list);
                    //db.SaveChanges();
                    db.tblProducts.Remove(product);
                    db.SaveChanges();
                    return true;
                }
                catch(Exception ex)
                {
                    return false;
                }
              
            }
            else
            {
                return false;
            }
           

        }


        public bool DeleteImage(int Id, string wwwRootPath)
        {
            var productImage = db.tblProductImages.Where(p => p.ID == Id).FirstOrDefault();
            if (productImage != null)
            {
                try
                {
                        var oldImagePath = Path.Combine(wwwRootPath, @"\Store\ProductImages", productImage.ImagePath);
                        if (System.IO.File.Exists(oldImagePath))
                        {
                            System.IO.File.Delete(oldImagePath);
                        }                
                  
                    db.tblProductImages.Remove(productImage);
                    db.SaveChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }

            }
            else
            {
                return false;
            }


        }



        public List<tblProduct> GetCategoryProducts(int categoryID)
        {
            var products = db.tblProducts.Where(p => p.CategoryID == categoryID).ToList();
            return products;
        }

        public tblProduct GetProductById(int? id)
        {
            var product = db.tblProducts.Where(p => p.ID == id && p.Status.Trim() != "Inactive").FirstOrDefault();
            return product;
        }

      
       
        public ProductUpsertModel FillProductModel (int Id)
        {
            var product = db.tblProducts.Include(p=>p.tblProductImages).Where(p => p.ID == Id).FirstOrDefault();
            if (product == null)
            {
                return new ProductUpsertModel();
            }
            else
            {
                ProductUpsertModel model = new ProductUpsertModel()
                {
                    CategoryID = product.CategoryID,
                    ProductQuantities = GetProductQuantity(product.ID),
                    QuantityDataCount=0,
                    Description= product.Description,
                    DiscountPercent= product.DiscountPercent,
                    Status=product.Status,
                    DiscountPrice= product.DiscountPrice,
                    
                    Inventory=product.Inventory,
                    ShippingFee=product.ShippingCharges,
                    IsShippingFree= product.IsShippingFree,
                    ProductImages= new List<ProductImage>(),
                    ID = product.ID,
                    IsDiscount= product.IsDiscount,
                    RealPrice= product.RealPrice,
                    MaximumQuantity=product.MaximumQuantity,
                    MinumQuantity=product.MinumQuantity,
                    Name=product.Name,
                    ShortDescription=product.ShortDescription,
                    VAT=product.VAT,
                    
                   
            };
                foreach(var item in product.tblProductImages)
                {
                    ProductImage productImage = new ProductImage()
                    {
                        ImageID = item.ID,
                        ImageUrl =  item.ImagePath,
                        ProductID = item.ProductID,
                        SortOrder = item.SortOrder,
                    };
                    model.ProductImages.Add(productImage);

                }
                model.QuantityDataCount= (model.ProductQuantities!=null)? model.ProductQuantities.Count(): 0;
                return model;

            }


        }
        
        public string SaveProductImage (string ImageUrl , string wwwRootPath, IFormFile? file)

        {
            try
            {

                if (file != null)
                {


                    string fileName = Guid.NewGuid().ToString();
                    var uploads = Path.Combine(wwwRootPath, @"Store\ProductImages");
                    var extension = Path.GetExtension(file.FileName);

                    if (ImageUrl != null)
                    {
                        var oldImagePath = Path.Combine(wwwRootPath, @"Store\ProductImages", ImageUrl);
                        if (System.IO.File.Exists(oldImagePath))
                        {
                            System.IO.File.Delete(oldImagePath);
                        }
                    }

                    using (var fileStreams = new FileStream(Path.Combine(uploads, fileName + extension), FileMode.Create))
                    {
                        file.CopyTo(fileStreams);
                    }
                    ImageUrl = fileName + extension;


                }
                return ImageUrl;
            }
            catch(Exception ex)
            {
                return string.Empty;
            }
        }


        public bool AddEditProduct(ProductUpsertModel model)
        {
            tblProduct product = new tblProduct();

            try
            {
                product.ID = model.ID;
                product.Name=model.Name;
                product.Description = model.Description;
                product.ShortDescription = model.ShortDescription;
                product.RealPrice = (int)Math.Round(model.RealPrice, 0);
                product.IsDiscount = model.IsDiscount;
                product.DiscountPercent = model.DiscountPercent;
                product.DiscountPrice = 0;
                if (product.IsDiscount == true)
                {
                    var DSPRICE = (float)((model.DiscountPercent * (model.RealPrice)) / 100);

                    model.DiscountPrice = DSPRICE;
                    int round = (int)Math.Round(DSPRICE, MidpointRounding.AwayFromZero);
                    model.DiscountPrice = model.RealPrice-round;              
                    product.DiscountPrice =  model.DiscountPrice;
                }
 
              
                product.VAT = model.VAT;
                product.MinumQuantity=model.MinumQuantity;
                product.MaximumQuantity = model.MaximumQuantity;
                product.Inventory = model.Inventory;
                product.ShippingCharges = 0;
                product.IsShippingFree = model.IsShippingFree;
                if(model.IsShippingFree== false)                {
                    product.ShippingCharges = model.ShippingFee;
                }
                product.Status = model.Status.Trim();
            
                product.CategoryID = model.CategoryID;
              
               
                if (product.ID == 0)
                {
                    db.tblProducts.Add(product);
                   

                }
                else if (product.ID > 0)
                {
                    db.Entry(product).State = EntityState.Modified;

                }
                db.SaveChanges();

                if (product.ID > 0)
                { 
                    List<tblQuantity> deletelist = db.tblQuantities.Where(p => p.ProductID == product.ID).ToList();
                    if (deletelist != null && deletelist.Count > 0)
                    {
                        db.RemoveRange(deletelist);                     
                        db.SaveChanges();
                    }
                }

                //add all high teas
                List<ProductQuantity> addQuantities = model.ProductQuantities.ToList();
             
                if (addQuantities != null && addQuantities.Count > 0)
                {

                    foreach (var item in addQuantities)
                    {
                        tblQuantity quantity = new tblQuantity();
                        if (item.Quantity <= product.MaximumQuantity && item.Quantity >= product.MinumQuantity)
                        {
                            if (item.Quantity == 1)
                            {
                                if (product.IsDiscount == true)
                                {
                                    quantity.Price = (float)product.DiscountPrice;
                                }
                                else
                                {
                                    quantity.Price = product.RealPrice;
                                }
                            }
                            else
                            {
                                quantity.Price = item.Price;
                            }
                            quantity.Price = (int)Math.Round(quantity.Price, MidpointRounding.AwayFromZero);
                            quantity.ProductID = product.ID;
                            quantity.Quantity = item.Quantity;                       
                            db.tblQuantities.Add(quantity);
                            db.SaveChanges();
                        }

                    }                 
                  
                }


                List<ProductImage> addImages = model.ProductImages.ToList();
                if(addImages !=null && addImages.Count > 0)
                {
                    foreach (var item in addImages)
                    {
                        tblProductImage pimage = new tblProductImage()
                        {
                            ProductID = product.ID,
                            ImagePath = item.ImageUrl,
                            SortOrder = item.SortOrder,

                        };
                        db.tblProductImages.Add(pimage);
                        db.SaveChanges();                       

                    }

                }
               

                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }


        }

      

        public List<ProductQuantity> GetProductQuantity(int id)
        {
            var productquantities = db.tblQuantities.Where(p => p.ProductID == id && p.Product.Status.Trim()!="Inactive")
                .Select(q => new ProductQuantity()
                {
                    Price = q.Price,
                    QuantityID = q.ID,
                    Quantity = q.Quantity,
                    ProductID = q.ProductID
                }).ToList();
         
            return productquantities;
        }

        public int GetQuantityById(int id , int pId)
        {
           return db.tblQuantities.Where(q => q.ID == id && q.ProductID == pId).Select(s => s.Quantity ).FirstOrDefault();
        }

        public int GetHighestImageSortOrder(int? id)
        {
            if(id==null || id == 0)
            {
                return 0;
            }
            else
            {
                int? maxSortOrder = db.tblProductImages
                             .Where(p => p.ProductID == id.Value)
                             .Max(s => (int?)s.SortOrder); // Cast to int? to handle nullable values

                return maxSortOrder ?? 0;
            }        
        }

        public bool UpdateImageSortOrder(int id , int sortOrder)
        {
            try
            {
                var image = db.tblProductImages.Where(p => p.ID == id).FirstOrDefault();
                if (image != null)
                {
                    image.SortOrder = sortOrder;
                    db.Entry(image).State = EntityState.Modified;
                    return db.SaveChanges() > 0;
                }
                return false;
               
            }
            catch(Exception ex) {
                return false;
            
            }
          

        }


        public ValidateProduct ValidateProduct(int ProductId)
        {

            ValidateProduct result = new ValidateProduct();
            result.RemainingProduct = 0;
            try
            {
               
                var product = db.tblProducts.Where(p => p.ID == ProductId && p.Status.Trim()!= "Inactive").FirstOrDefault();
                if (product != null)
                {
                    int MaxItem = product.Inventory;
                    int BookedItem = db.tblOrderDetails.Include(o => o.Order).Where(o => o.Order.Status != null && o.Order.Status == "Active" && o.ProductID == product.ID).Sum(s => s.Quantity.Value);
                    result.RemainingProduct = MaxItem - BookedItem;
                }
                // result = context.Set<ValidateProduct>().FromSqlRaw<ValidateProduct>("ValidateProduct {0}", Param).AsEnumerable().FirstOrDefault();
                return result;
            }

            catch (Exception ex)
            {
                string message = ex.Message;
                return new ValidateProduct()
                {
                    RemainingProduct = -1,

                };
            }


        }




        public List<ProductView> GetProducts()
        {
            return db.tblProducts.Include(p=>p.tblProductImages).OrderByDescending(p => p.ID).Where(p =>  p.Status.Trim() != "Inactive").Select(p => new ProductView()
            {
                ID = p.ID,
              
                SalePrice = ((p.IsDiscount == false)?p.RealPrice: p.DiscountPrice),
                Discount = p.DiscountPercent.ToString() + "%",
                DiscountPrice = p.DiscountPrice,
                RealPrice = p.RealPrice,
                Status=p.Status.Trim(),
                Image = (p.tblProductImages.Count>0 && p.tblProductImages!=null)?p.tblProductImages.Where(s=>s.SortOrder==1).Select(s=>s.ImagePath).FirstOrDefault(): null,
                Category = p.Category.Name,
                
                Name = p.Name

            }).ToList();
        }

        public ProductView GetProductById(int id)
        {
            var product = db.tblProducts.Include(p => p.tblProductImages).Where(p => p.ID == id && p.Status.Trim() != "Inactive")
            .Select(p => new ProductView()    
            {
                ID = p.ID,
                SalePrice = ((p.IsDiscount == false) ? p.RealPrice : p.DiscountPrice),
                Discount = p.DiscountPercent.ToString() + "%",
                DiscountPrice = p.DiscountPrice,
                RealPrice = p.RealPrice,
                IsShippingFree=p.IsShippingFree,
                Image = (p.tblProductImages.Count > 0 && p.tblProductImages != null) ? p.tblProductImages.Where(s => s.SortOrder == 1).Select(s => s.ImagePath).FirstOrDefault() : null,
                Description = p.Description,
                ShippingCharges = p.ShippingCharges,
                ShortDescription = p.ShortDescription,
                Url="/Product/Detail"+p.ID,
                Category = p.Category.Name,
                Status=p.Status.Trim(),
                Name = p.Name,
         
                Images= p.tblProductImages.Select(s=> new ImagesVM
                {
                    ImageUrl=s.ImagePath,
                    SortOrder=s.SortOrder
                   

                }).ToList()

            }).FirstOrDefault();

            return product;
            
           
        }


     

    }
}
    

