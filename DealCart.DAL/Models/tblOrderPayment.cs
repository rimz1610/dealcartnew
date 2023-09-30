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
    public class tblOrderPayment
    {
        [Key]
        public int ID { get; set; }

        public int OrderID { get; set; }
        [ForeignKey("OrderID")]
        [ValidateNever]
        public tblOrder Order { get; set; }
        public string PaymentType { get; set; }
        public string CreditCard { get; set; }
        public float OrderAmount { get; set; }
        public float? PaidAmount { get; set; }
        public string TxnRef { get; set; }
        public DateTime? PaidDate { get; set; }
        public string Status { get; set; }
     
      
    }
}
