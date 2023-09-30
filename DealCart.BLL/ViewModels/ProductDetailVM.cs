using DealCart.DAL.Models;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace DealCart.BLL.ViewModels
{
    public class ProductDetailVM
    {
        public int ID { get; set; }

        public string Name { get; set; }

        public string ShortDescription { get; set; }

        public string Description { get; set; }


       
        public string DefaultImage { get; set; }

        public string Url { get; set; }
        public float? VAT { get; set; }

     

        public float RealPrice { get; set; }

        public float? SalePrice { get; set; }

        public int Sold { get; set; }
        public float? DiscountPrice { get; set; } 

        public string Category  { get; set; }

      

        public int CategoryID { get; set; }

        public int Inventory { get; set; }

        public string Status { get; set; }

        public bool IsShippingFree { get; set; } = false;

        public float? ShippingFee { get; set; }

        public List<ImagesVM> ProductImages { get; set; }
      
        public bool IsDiscount { get; set; } 
        public string Discount { get; set; } 

       public int MinimumQuantity { get; set; } 

      
        public int MaximumQuantity { get; set; } 

        public DateTime CreatedDate { get; set; } 

        public DateTime UpdatedDate { get; set; }

        public List<QuantityList> QuantityLists { get; set; }

        [ValidateNever]
        public IEnumerable<SelectListItem> QuantityList { get; set; }
    }


    public class QuantityList
    {
      
        public int QuantityID { get; set; }

        public string Display { get; set; }


        public int Quantity { get; set; }
        public float SalePrice { get; set; }
    }
}
