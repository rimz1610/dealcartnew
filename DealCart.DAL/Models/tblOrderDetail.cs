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
    public class tblOrderDetail
    {
        [Key]
        public int ID { get; set; }

        public int OrderID { get; set; }
        [ForeignKey("OrderID")]
        [ValidateNever]
        public tblOrder Order { get; set; }
        public int ProductID { get; set; }
        [ForeignKey("ProductID")]
        [ValidateNever]
        public tblProduct Product { get; set; }
        public float? SalePrice { get; set; }

        public int? Quantity { get; set; }

      
    }
}
