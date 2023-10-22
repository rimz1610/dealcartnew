using DealCart.BLL.Interfaces;
using DealCart.DAL.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Services
{
    public class CompanyService : ICompany
    {
        DealCartContext db;

        public CompanyService(DealCartContext _db)
        {
            db = _db;
        }

        public void AddUpdateCompany(tblCompany obj, string wwwRootPath, IFormFile? file)
        {
            if (file != null)
            {
                string fileName = Guid.NewGuid().ToString();
                var uploads = Path.Combine(wwwRootPath, @"Store\CompanyLogos");
                var extension = Path.GetExtension(file.FileName);

                if (obj.Logo != null)
                {
                    var oldImagePath = Path.Combine(wwwRootPath, @"Store\CompanyLogos", obj.Logo);
                    if (System.IO.File.Exists(oldImagePath))
                    {
                        System.IO.File.Delete(oldImagePath);
                    }
                }

                using (var fileStreams = new FileStream(Path.Combine(uploads, fileName + extension), FileMode.Create))
                {
                    file.CopyTo(fileStreams);
                }
                obj.Logo =  fileName + extension;

            }
            if (obj.ID == 0)
            {
                db.tblCompanies.Add(obj);
            }
            else
            {
                db.tblCompanies.Update(obj);
            }
            db.SaveChanges();
        }

        public bool DeleteCompany(int Id, string wwwRootPath)
        {
			var company = db.tblCompanies.Where(a => a.ID == Id).FirstOrDefault();
			if (company != null)
			{
                try
                {
                    var oldImagePath = Path.Combine(wwwRootPath, @"Store\CompanyLogos", company.Logo);
                    if (System.IO.File.Exists(oldImagePath))
                    {
                        System.IO.File.Delete(oldImagePath);
                    }
                    db.tblCompanies.Remove(company);
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



        public List<tblCompany> GetCompanies()
        {
            return db.tblCompanies.OrderByDescending(c => c.ID).ToList();
        }


        public tblCompany GetCompanyById(int? id)
        {

            var company = db.tblCompanies.Where(a => a.ID == id).FirstOrDefault();
            if (company != null)
            {
                return company;
            }
            return null;

        }

      

    }
}

