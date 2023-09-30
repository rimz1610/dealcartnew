using DealCart.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Interfaces
{
   public interface ICategory
    {
        List<tblCategory> GetCategories();
        tblCategory GetCategoryById(int id);

        void AddEditCategory(tblCategory category);
        bool DeleteCategory(int id);
    }
}
