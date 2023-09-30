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

using Newtonsoft.Json;
using Microsoft.AspNetCore.Http;
using DealCart.BLL.Services;

namespace DealCart.Controllers
{
    public class  ReportController : Controller
    {

        
       public readonly IHttpContextAccessor _con;
        private readonly IReport _report;
        private readonly ICategory _category;
        public ReportController(IReport report, ICategory category, IHttpContextAccessor contextAccessor)
        {
            _report = report;
            _category = category;
            _con = contextAccessor;
           
        }


        public IActionResult Index()
        {

            return View();
        }


        public async Task<IActionResult> StockStats()
        {
            if (_con.HttpContext.Session.GetString("UserName") != null)

            {
                ViewBag.Categories = _category.GetCategories();
                return View();
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }



        [HttpPost]
        public IActionResult SelectedCategoryStats(int catId)
        {

            ViewBag.Categories = _category.GetCategories();
            var result =  _report.GetSpecificStats(catId);
            return PartialView("_StockStatsList", result);



        }




    }
}