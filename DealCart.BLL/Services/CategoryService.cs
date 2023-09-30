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
    public class CategoryService : ICategory
    {
        DealCartContext db;

        public CategoryService(DealCartContext _db)
        {
            db = _db;
        }
        

        public bool DeleteCategory(int id)
        {
            tblCategory category = db.tblCategories.Where(c => c.ID == id).FirstOrDefault();

          if (category != null)
            {
                try
                {
                    db.tblCategories.Remove(category);
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

        public List<tblCategory> GetCategories()
        {
            return db.tblCategories.OrderByDescending(c => c.ID).ToList();
        }


        public tblCategory GetCategoryById(int id)
        {

            var category = db.tblCategories.Where(c => c.ID == id).FirstOrDefault();
            if (category != null)
            {
                return category;
            }
            return null;

        }


        public void AddEditCategory(tblCategory category)
        {
           
            if (category.ID == 0)
            {
                category.CreatedDate= DateTime.Now;
                db.tblCategories.Add(category);
            }
            else
            {
                category.UpdatedDate = DateTime.Now;
                db.tblCategories.Update(category);
            }
            db.SaveChanges();
        }
     
      
    }
}

