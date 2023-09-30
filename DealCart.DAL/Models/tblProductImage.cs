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
    public class tblProductImage
    {
        [Key]
        public int ID { get; set; }

     
        public int ProductID { get; set; }
        [ForeignKey("ProductID")]
        [ValidateNever]
        public tblProduct Product { get; set; }
        public int SortOrder { get; set; }

        [ValidateNever]
        public string ImagePath { get; set; }

     


    }
}
