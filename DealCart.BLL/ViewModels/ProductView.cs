using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.ViewModels
{
    public class ProductView
    {
        public int ID { get; set; }
        public string Name { get; set; }
		public float? SalePrice { get; set; } //Product current price either it is REAL or discount price

        public float? DiscountPrice { get; set; }
		public float RealPrice { get; set; } 

        public string Image { get; set; } //Default image
        public List<ImagesVM> Images { get; set; }
        public string Category { get; set; }
     
        public string Status { get; set; }
        public string Discount { get; set; }

        public string Url { get; set; }
         
        public bool IsShippingFree { get; set; }
        public string ShortDescription { get; set; }

        public string Description { get; set; }

        public float? ShippingCharges { get; set; }



    }

    public class ValidateProduct
    {
        public long RemainingProduct { get; set; }


    }
}
