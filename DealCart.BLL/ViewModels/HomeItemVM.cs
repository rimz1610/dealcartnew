using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.ViewModels
{
    public class HomeItemsVM
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public string ShortDescription { get; set; }
        public float? SalePrice { get; set; }
        public string Discount{ get; set; } = "0%" ;
        public float? DiscountPrice { get; set; }

        public float? VAT { get; set; }
        public float RealPrice { get; set; } 
		public string Image { get; set; }
        public string Category { get; set; }
        public bool IsShippingFree { get; set; } = false;

        public float? ShippingCharges { get; set; }
      //  public bool IsOffer { get; set; } = false;
        public bool IsDiscount { get; set; } = false;

        public string Status { get; set; }
        public int Inventory { get; set; }


    }

    public class ImagesVM
    {
        public string ImageUrl { get; set; }

        public int SortOrder { get; set; }
    }

    public class CategoryItemsVM
    {
        public int ID { get; set; }

        public string Name { get; set; }

    }
        public class ProductsItemsVM
    {
       public List<HomeItemsVM> Items { get; set; }

      public List<CategoryItemsVM> Categories { get; set; }

    }


}
