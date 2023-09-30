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
	public class tblDeal
	{
		[Key]
		public int ID { get; set; }

        [Display(Name = "1stProduct")]
        public int ProductID1 { get; set; }
		[ForeignKey("ProductID1")]
		[ValidateNever]
		public tblProduct Product1 { get; set; }

        [Display(Name = "2ndProduct")]
        public int ProductID2 { get; set; }
		[ForeignKey("ProductID2")]
		[ValidateNever]
		public tblProduct Product2 { get; set; }
		[Range(1, 10, ErrorMessage = "Please enter a value between 1 and 10")]

		public int Product1Quantity { get; set; }
		[Range(1, 10, ErrorMessage = "Please enter a value between 1 and 10")]
		public int Product2Quantity { get; set; }

		public double TotalPrice { get; set; }

        [ValidateNever]
        public string ImageUrl { get; set; }
    }
}
