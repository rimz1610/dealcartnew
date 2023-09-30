using DealCart.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.ViewModels
{
    public class ShopVM
    {
        public List<CategoryVM> Categories { get; set; }
        public List<tblProduct> Products { get; set; }

        public Pager Pager { get; set; }
    }
}
