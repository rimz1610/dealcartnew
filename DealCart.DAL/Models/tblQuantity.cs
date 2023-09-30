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
	public class tblQuantity
	{
		[Key]
		public int ID { get; set; }

		public int ProductID { get; set; }
		[ForeignKey("ProductID")]
		[ValidateNever]
		public tblProduct Product { get; set; }
		
		[Range(1, 100, ErrorMessage = "Please enter a value between 1 and 10")]
		public int Quantity { get; set; }

		public float Price { get; set; }
	}
}
