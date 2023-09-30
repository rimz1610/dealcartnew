using DealCart.DAL.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Interfaces
{
    public interface ICompany 
    {
        List<tblCompany> GetCompanies();
        tblCompany GetCompanyById(int? id);

        public void AddUpdateCompany(tblCompany obj, string wwwRootPath, IFormFile? file);

        public bool DeleteCompany(int Id, string wwwRootPath);

	}
}
