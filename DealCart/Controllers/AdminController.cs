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
using static Microsoft.AspNetCore.Razor.Language.TagHelperMetadata;
using System.Configuration;
using DealCart.Helper;
using DealCart.BLL.Helper;

namespace DealCart.Controllers
{
    public class AdminController : Controller
    {
        private readonly IAdmin _admin;
        private readonly IHome _home;
        private readonly IWebHostEnvironment _hostEnvironment;
        public readonly IHttpContextAccessor _con;
        public readonly IConfiguration _configuration;
        public AdminController( IHome home,   IAdmin admin, IConfiguration configuration, IWebHostEnvironment hostEnvironment, IHttpContextAccessor contextAccessor)
        {
            _admin = admin;
            _home = home;
            _con=contextAccessor;
            _configuration = configuration;
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
                HttpContext.Session.SetString("UserName", UserName);
                HttpContext.Session.SetString("Role", "Admin");

                // TempData["success"] = "Login successfully";
                return RedirectToAction("Dashboard", "Admin");
               
            }
            else
            {
                ViewBag.Message = "Incorrect email or password";
                return View();

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


        public IActionResult ForgotPassword()
        {
            return View();
        }
      
        [HttpPost]
        public IActionResult ForgotPassword(string  UserName)
        {
            string baseUrl = $"{_con.HttpContext.Request.Scheme}://{_con.HttpContext.Request.Host}";
            var user = _admin.GetAdminByUserName(UserName);
            try
            {
                var token = Helper.Common.Encryption(user.ID.ToString());              
                string subject = "Change Password";
                string body = "<p>Hi " + user.FirstName + " " + user.LastName + ",</p><p>Please <a href='" + baseUrl + "/Admin/ResetPassword?email=" + user.Email + "&code=" + token + "'>click here</a> to reset your password.<p>Thanks</p>";
                int EmailResponse = EmailSender.EmailSend(_configuration, subject, user.Email, body);
                ViewBag.Message = EmailResponse == 1 ? "Please check your inbox" : "Please check your username";
                return View();
            }
            catch (System.Exception)
            {
                ViewBag.Message = "Something went wrong";
                return View();
            }
        }
        public ActionResult ResetPassword(string email, string code)
        {
            ViewBag.EncryptId = code;
            ViewBag.Email = email;
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public JsonResult ChangePassword(string Id, string NewPassword)
        {
            string decryptId = Helper.Common.Decryption(Id);
            if (decryptId != null)
            {
                var result = _admin.UpdatePassword(Convert.ToInt32(decryptId), NewPassword);
                return Json(result);
            }
            else
            {
                return Json(false);
            }
           
            
        }

      


    }
}

