using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.ViewModels
{
    public class AddProductModel
    {

        public int ID { get; set; }

        [Required]
        [StringLength(150, ErrorMessage = "Input exceed maximum length")]
        public string Name { get; set; }

        public string ShortDescription { get; set; }

        public string Description { get; set; }

        public float VAT { get; set; }

        public float RealPrice { get; set; } = 0;
        public float? DiscountPrice { get; set; } = 0.0f;
        public int CategoryID { get; set; }

        public bool IsDiscount { get; set; } = true;
        public int DiscountPercent { get; set; } = 0;



        [Range(1, 100, ErrorMessage = "Please enter a value between 1 and 100")]

        public int MinumQuantity { get; set; } = 1;

        [Range(1, 100, ErrorMessage = "Please enter a value between 1 and 100")]

        public int MaximumQuantity { get; set; } = 10;


        public int Inventory { get; set; }

        public string Status { get; set; }

        public bool IsShippingFree { get; set; } = false;

        public float? ShippingFee { get; set; }


        public int QuantityDataCount { get; set; } = 0;

        public string JsonQuantityData { get; set; }

        public List<ProductQuantity> ProductQuantities { get; set; }

    }

}
