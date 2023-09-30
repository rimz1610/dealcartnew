using DealCart.BLL.Interfaces;
using DealCart.DAL.Models;
using Microsoft.AspNetCore.Mvc;

namespace DealCart.Controllers
{
    public class CompanyController : Controller
    {
        public readonly IHttpContextAccessor _con;
        private readonly ICompany _company;
        private readonly IWebHostEnvironment _hostEnvironment;
        public CompanyController(ICompany company, IWebHostEnvironment hostEnvironment, IHttpContextAccessor con)
        {
            _company = company;
            _hostEnvironment = hostEnvironment;
            _con = con; 
        }
        public IActionResult Index()
        {

            if (_con.HttpContext.Session.GetString("UserName") != null)
            {
                var comapnyList = _company.GetCompanies();
                return View(comapnyList);
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
                return View(new tblCompany());
            }
            else
            {
                var company=_company.GetCompanyById(id);
                return View(company);

                //update company
            }


        }

        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Upsert(tblCompany obj, IFormFile? file)
        {

            if (ModelState.IsValid)
            {
                string wwwRootPath = _hostEnvironment.WebRootPath;
                _company.AddUpdateCompany(obj, wwwRootPath, file);
                TempData["success"] = (obj.ID==0)?"Company created successfully": "Company updated successfully";
                return RedirectToAction("Index");
            }
            return View(obj);
        }


		//GET
		public IActionResult Delete(int Id)
		{

			string wwwRootPath = _hostEnvironment.WebRootPath;
			bool response = _company.DeleteCompany(Id, wwwRootPath);
			return Ok(response);
		}
	}
}

