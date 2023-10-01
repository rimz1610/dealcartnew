using DealCart.BLL.Interfaces;
using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using System.Data;

namespace DealCart.Controllers
{
    public class AdminController : Controller
    {
        private readonly IAdmin _admin;
        private readonly IHome _home;
        private readonly IWebHostEnvironment _hostEnvironment;
        public readonly IHttpContextAccessor _con;
        public AdminController( IHome home,   IAdmin admin, IWebHostEnvironment hostEnvironment, IHttpContextAccessor contextAccessor)
        {
            _admin = admin;
            _home = home;
            _con=contextAccessor;
            _hostEnvironment = hostEnvironment;
        }

        public IActionResult Login()
        {
            HttpContext.Session.SetString("UserName", "");
            HttpContext.Session.SetString("Role", "");
            return View();
        }

        [HttpPost]

        public async Task<IActionResult> Login(string UserName, string Password)
        {
            int result = _admin.GetLoginUser(UserName, Password);
            if (result == 1)
            {
               
                ViewBag.Message = "Incorrect email or password";
                return View();
            }
            else
            {

                HttpContext.Session.SetString("UserName", UserName);
                HttpContext.Session.SetString("Role", "Admin");

               // TempData["success"] = "Login successfully";
                return RedirectToAction("Dashboard", "Admin");
            }

        }
       
        public IActionResult Index()
        {

            if (_con.HttpContext.Session.GetString("UserName") != null)

            {

                var adminList = _admin.GetAdmins();

                return View(adminList);
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }

        }

        public IActionResult Dashboard()
        {
            if (_con.HttpContext.Session.GetString("UserName") != null)

            {
                Dashboard dashboard = new Dashboard()
                {
                    TotalProducts = _home.GetProductCount(),
                    TotalOrders = _home.TotalOrders(),
                    TotalRevenue = _home.TotalRevenue(),
                    TotalSaleProducts = _home.TotalSaleProducts(),
                };
                return View(dashboard);
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }


        }

        //GET

        public IActionResult Upsert(int? id)
        {


            if (id == null || id == 0)
            {
                //create product
                //ViewBag.CategoryList = CategoryList;
                //ViewData["CoverTypeList"] = CoverTypeList;             
                return View(new tblAdmin());
            }
            else
            {
                var admin = _admin.GetAdminById(id);
                return View(admin);

                //update product
            }


        }

        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Upsert(tblAdmin obj, IFormFile? file)
        {

            if (ModelState.IsValid)
            {
                string wwwRootPath = _hostEnvironment.WebRootPath;
                _admin.AddUpdateAdmin(obj, wwwRootPath, file);
                TempData["success"] = "Admin created successfully";
                return RedirectToAction("Index");
            }
            return View(obj);
        }
       
        public IActionResult Delete(int Id)
		{
            string wwwRootPath = _hostEnvironment.WebRootPath;
            bool response = _admin.DeleteAdmin(Id, wwwRootPath);
			return Ok(response);
		}
		
		public JsonResult CheckUserNameduplicate(string UserName)
		{
			bool message = _admin.VerifyUserName(UserName);
			return Json(message);
		}

        public IActionResult Logout()
        {
           
            HttpContext.Session.SetString("UserName", "");
            HttpContext.Session.SetString("Role", "");
            return RedirectToAction("Login");
        }

    }
}

