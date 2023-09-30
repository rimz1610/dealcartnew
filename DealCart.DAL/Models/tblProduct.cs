using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.DAL.Models
{
   public class tblProduct
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        [StringLength(300)]
        public string ShortDescription { get; set; }
        [StringLength(500)]
        public string Description { get; set; }


        [Required]
		[Range(1, 1000)]

		public float VAT { get; set; }

		[Required]
        [Range(1, 100000)]

        public float RealPrice { get; set; }

     
        [Range(1, 100000)]
        [ValidateNever]

        public float? DiscountPrice { get; set; } = 0.0f;


		//[ValidateNever]
  //      public string ImageUrl { get; set; }

        [Required]
        [Display(Name = "Category")]
        public int CategoryID { get; set; }
        [ForeignKey("CategoryID")]
        [ValidateNever]
        public tblCategory Category { get; set; }
     //   public bool IsAvailable { get; set; } = true;
      //  public bool IsOffer { get; set; } = false;
        public bool IsDiscount { get; set; } = true;
        public int DiscountPercent { get; set; } = 0;

        [Range(1, 100, ErrorMessage = "Please enter a value between 1 and 100")]

        public int MinumQuantity { get; set; } = 1;

		[Range(1, 100, ErrorMessage = "Please enter a value between 1 and 100")]

		public int MaximumQuantity { get; set; } = 10;


        public int Inventory { get; set; }

        [Required]
        public string Status { get; set; } = "Active";

        public bool IsShippingFree { get; set; } = false;
        public float? ShippingCharges { get; set; }


        public DateTime CreatedDate { get; set; } = DateTime.Now;

        public DateTime UpdatedDate { get; set; }

        [InverseProperty(nameof(tblOrderDetail.Product))]
        public ICollection<tblOrderDetail> tblOrderDetails { get; set; } = new HashSet<tblOrderDetail>();

        [InverseProperty(nameof(tblProductImage.Product))]
        public ICollection<tblProductImage> tblProductImages { get; set; } = new HashSet<tblProductImage>();

        [InverseProperty(nameof(tblQuantity.Product))]
        public ICollection<tblQuantity> tblQuantities { get; set; } = new HashSet<tblQuantity>();


    }
}
