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
        tblAdmin GetAdminByUserName(string UserName);
        bool DeleteAdmin(int id,  string wwwRootPath);

       bool UpdatePassword(int id, string password);

        public bool VerifyUserName(string UserName);

	}
}
