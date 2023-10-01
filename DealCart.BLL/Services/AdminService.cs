using DealCart.BLL.Interfaces;
using DealCart.DAL.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Services
{
    public class AdminService : IAdmin
    {
        DealCartContext db;

        public AdminService(DealCartContext _db)
        {
            db = _db;
        }
        public int GetLoginUser(string UserName, string Password)
        {
            var user = db.tblAdmins.Where(u => u.UserName == UserName && u.Password == Password).FirstOrDefault();

            if (user != null)
            {
                return 1;

            }
            return 0;
        }

        public void AddUpdateAdmin(tblAdmin obj, string wwwRootPath, IFormFile? file)
        {
            if (file != null)
            {
                string fileName = Guid.NewGuid().ToString();
                var uploads = Path.Combine(wwwRootPath, @"Images");
                var extension = Path.GetExtension(file.FileName);

                if (obj.ImageURL != null)
                {
                    var oldImagePath = Path.Combine(wwwRootPath, obj.ImageURL.TrimStart('\\'));
                    if (System.IO.File.Exists(oldImagePath))
                    {
                        System.IO.File.Delete(oldImagePath);
                    }
                }

                using (var fileStreams = new FileStream(Path.Combine(uploads, fileName + extension), FileMode.Create))
                {
                    file.CopyTo(fileStreams);
                }
                obj.ImageURL = @"\Images\" + fileName + extension;

            }
            if (obj.ID == 0)
            {
                db.tblAdmins.Add(obj);
            }
            else
            {
                db.tblAdmins.Update(obj);
            }
            db.SaveChanges();
        }

		public bool DeleteAdmin(int id, string wwwRootPath)
        {

            var admin = db.tblAdmins.FirstOrDefault(a => a.ID == id);
			
			if (admin!=null)
			{
                try
                {
                    var oldImagePath = Path.Combine(wwwRootPath, admin.ImageURL.TrimStart('\\'));
                    if (System.IO.File.Exists(oldImagePath))
                    {
                        System.IO.File.Delete(oldImagePath);
                    }
                    db.tblAdmins.Remove(admin);
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

        public bool UpdatePassword(int id , string password)
        {
            var admin = db.tblAdmins.FirstOrDefault(a => a.ID == id);

            if (admin != null)
            {
                try
                {
                    admin.Password = password;
                    db.tblAdmins.Update(admin);
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

        public bool VerifyUserName(string UserName)
        {
			var data = db.tblAdmins.Where(x => x.UserName == UserName).FirstOrDefault();
			if (data != null)
			{
				return false;
			}
			else
			{
				return true;
			}
		}

		public List<tblAdmin> GetAdmins()
        {
            return db.tblAdmins.OrderByDescending(a => a.ID).ToList();
        }

        public tblAdmin GetAdminByUserName(string UserName)
        {
            return db.tblAdmins.Where(u=>u.UserName==UserName).FirstOrDefault();
        }


        public tblAdmin GetAdminById(int? id)
        {

            var admin = db.tblAdmins.Where(a => a.ID == id).FirstOrDefault();
            if (admin != null)
            {
                return admin;
            }
            return null;

        }

       

    }
}

