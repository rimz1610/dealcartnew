using DealCart.BLL.Interfaces;
using DealCart.DAL.Models;
using DealCart.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Net.Mail;

using System.Net;


using Microsoft.AspNetCore.Http;
using DealCart.BLL.ViewModels;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.IO.Pipelines;

namespace DealCart.Controllers
{
    public class CartController : Controller
    {


        public readonly IHttpContextAccessor _con;
        private readonly ICart _cart;
        private readonly IProduct _product;
        public CartController(ICart cart, IProduct product, IHttpContextAccessor contextAccessor)
        {
            _cart = cart;
            _product = product;
            _con = contextAccessor;

        }


      
        public IActionResult AddToBag(OrderVM o, int QuantityID , int ProductID )
        {

            List<CartVM> list = new List<CartVM>();
            List<OrderVM> order = _cart.CreateOrderSession(o);
            _con.HttpContext.Session.SetString("Order", JsonConvert.SerializeObject(order));
            list= _cart.AddToBag(QuantityID,ProductID,  list);
            _con.HttpContext.Session.SetString("Cart", JsonConvert.SerializeObject(list));
            return RedirectToAction("Cart","Home");
        }

        public IActionResult AddToCart(int QuantityID , int  ProductID)
        {

            List<CartVM> list;

            if (_con.HttpContext.Session.GetString("Cart") == null)
            {
                list = new List<CartVM>();
            }
            else
            {
                list = JsonConvert.DeserializeObject<List<CartVM>>(_con.HttpContext.Session.GetString("Cart"));
            }
            TempData["error"] = "Duplicate";
            list = _cart.AddToBag(QuantityID, ProductID, list);

            _con.HttpContext.Session.SetString("Cart", JsonConvert.SerializeObject(list));
            return RedirectToAction("Cart","Home");
        }

        public IActionResult CheckDuplicate(int QuantityID , int ProductID)
        {
            if (_con.HttpContext.Session.GetString("Cart") != null)
            {
                List<CartVM> list = JsonConvert.DeserializeObject<List<CartVM>>(_con.HttpContext.Session.GetString("Cart"));


                var result = _cart.CheckDuplicate(QuantityID, ProductID, list);
                if (result == true)
                {
                    TempData["error"] = "Duplicate";

                }

                return Json(result);

            }
            return Json(false);
         
        }
        public IActionResult RemoveFromBag(int rowNo)
        {
            List<CartVM> list = JsonConvert.DeserializeObject<List<CartVM>>(_con.HttpContext.Session.GetString("Cart"));


            list = _cart.RemoveFromBag(rowNo, list);

            _con.HttpContext.Session.SetString("Cart", JsonConvert.SerializeObject(list));
            return RedirectToAction("Cart", "Home");
        }

      

        public async Task<IActionResult> Order(int id)
        {
            var product= await _cart.DisplayProduct(id);
            //ViewBag.QuantityList = product.QuantityList;
            return View( product);
        }



        [HttpGet]
        public async Task<IActionResult> ValidateCartItem()
        {
            List<CartVM> cart = JsonConvert.DeserializeObject<List<CartVM>>(_con.HttpContext.Session.GetString("Cart"));
           
            if(cart!=null && cart.Count > 0)
            {
                foreach(var item in cart)
                {
                    (bool, List<string>) result = ValidateCartItemFromStock(item.ProductID, item.Quantity , item.Name);
                    if (result.Item1 == false)
                    {
                        return Json(new { status = result.Item1, messages = result.Item2 });
                    }
                  
                }
                return Json(new { status = true, messages = new List<string>() });

            }
            else
            {
                return Json(new { status = false, messages = new List<string>() });
            }
        }

        public (bool, List<string>) ValidateCartItemFromStock(int ProductId, int Quantity, string Name)
        {
            bool isValid = true;
            List<string> lstMessage = new List<string>();

            ValidateProduct result = _product.ValidateProduct(ProductId);
           
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

        public IActionResult CheckOut(string PaymentType)
        {

            //Validate Cart

            List<OrderVM> list = JsonConvert.DeserializeObject<List<OrderVM>>(_con.HttpContext.Session.GetString("Order"));
            OrderVM o= list.FirstOrDefault();
            o.PaymentType = PaymentType;
            list.RemoveAt(0);
            list.Add(o);
            _con.HttpContext.Session.SetString("Order", JsonConvert.SerializeObject(list));


            if (PaymentType == "Cash on Delivery")
            {
                return RedirectToAction("OrderBooked");
            }
            else
            {
                float amount= JsonConvert.DeserializeObject<float>(_con.HttpContext.Session.GetString("TotalAmount"));

                return Redirect("https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=fahidmughal6@gmail.com&item_name=DealCart&return=https://localhost:7295/Cart/OrderBooked&amount=" + float.Parse(amount.ToString()) * 0.27);
            }
 
        }

        public IActionResult OrderBooked()
        {
            List<OrderVM> list = JsonConvert.DeserializeObject<List<OrderVM>>(_con.HttpContext.Session.GetString("Order"));
            var total = JsonConvert.DeserializeObject<float>(_con.HttpContext.Session.GetString("TotalAmount"));
            List<CartVM> cart= JsonConvert.DeserializeObject<List<CartVM>>(_con.HttpContext.Session.GetString("Cart"));
            if(list!=null && cart != null)
            {
                _cart.BookedOrder(list, total, cart);
            }
          
            return View();

        }



        public IActionResult CloseOrder()
        {
            _con.HttpContext.Session.Remove("Order");
            _con.HttpContext.Session.Remove("Cart");
            _con.HttpContext.Session.Remove("TotalAmount");
            TempData["success"] = "Thank You for Order";
            return RedirectToAction("Index","Home");
        }





    }
}