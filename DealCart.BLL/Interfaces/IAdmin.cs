using DealCart.DAL.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Interfaces
{
    public interface IAdmin 
    {
        List<tblAdmin> GetAdmins();
        tblAdmin GetAdminById(int? id);
        public int GetLoginUser(string UserName, string Password);
        public void AddUpdateAdmin(tblAdmin obj, string wwwRootPath, IFormFile? file);

        public bool DeleteAdmin(int id,  string wwwRootPath);

        public bool VerifyUserName(string UserName);

	}
}
