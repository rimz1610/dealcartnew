using Microsoft.AspNetCore.Mvc;
using DealCart.BLL.Interfaces;
using DealCart.DAL.Models;
using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Authorization;
using System.Data;
using DealCart.BLL.ViewModels;
using System.Collections.Generic;

namespace DealCart.Controllers
{
    public class CategoryController : Controller
    {

        public readonly IHttpContextAccessor _con;
        private readonly ICategory _category;
        public CategoryController(ICategory category, IHttpContextAccessor contextAccessor)
        {
            _category = category;
            _con = contextAccessor;

        }
     
        public IActionResult Index()
        {
            if (_con.HttpContext.Session.GetString("UserName") != null)
         
            {
                var objCategoryList = _category.GetCategories();
                return View(objCategoryList);
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }
         
        }


        public IActionResult Upsert(int? id)
        {


            if (id == null || id == 0)
            {

                return View(new tblCategory());
            }
            else
            {
                var categoryFromDb = _category.GetCategoryById(id.Value);

                return View(categoryFromDb);

                
            }


        }

        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Upsert(tblCategory obj)
        {

            if (ModelState.IsValid)
            {

                _category.AddEditCategory(obj);

                TempData["success"] =(obj.ID==0)? "Category created successfully" : "Category updated successfully";
                return RedirectToAction("Index");
            }

            return View(obj);
        }


        public IActionResult Delete(int Id)
        {

            bool response = _category.DeleteCategory(Id);
            return Ok(response);
        }
    }
}
    

