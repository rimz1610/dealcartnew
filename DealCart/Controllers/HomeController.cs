using DealCart.BLL.Interfaces;
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
using DealCart.BLL.ViewModels;

namespace DealCart.Controllers
{
    public class HomeController : Controller
    {

        public readonly IHttpContextAccessor _con;
        private readonly IHome _home;
        public HomeController(IHome home, IHttpContextAccessor con)
        {
            _home = home;
            _con = con;
        }

        public async Task<IActionResult> Index()
        {
           
            var products= await _home.GetHomeItems();
            return View(products);
        }

      
        public async Task<IActionResult> AllProducts(int? catId)
        {
            if(catId != null)
            {
                ViewBag.SelectCategory = catId;
            }
            else
            {
                ViewBag.SelectCategory = 0;
            }  
            var products = await _home.GetAllProductItems(catId);
            return View(products);
        }


        public async Task<IActionResult> SearchProducts(string searchString)
        {          
           
            ViewBag.GetSearch = searchString;    
            var products = await _home.GetSearchItems(searchString);
            return View(products);
        }


        public IActionResult Cart()
        {
          
            
                return View();
            


        }




        public IActionResult IndexAdmin()
        {
            return View();
        }

      

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}