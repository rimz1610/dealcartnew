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
    public class tblOrder
    {
       

        [Key]
        public int ID { get; set; }
        [Required]
        public DateTime OrderDate { get; set; } = DateTime.Now;
        public DateTime ShippingDate { get; set; }
        public float TotalAmount { get; set; }
        public float? PaidAmount { get; set; }

        public string OrderType { get; set; }

        public string OrderNo { get; set; }
        public string PaymentType { get; set; }

        [Required]      
        public string OrderName { get; set; }

        [Required]     
        public string OrderEmail { get; set; }

        [Required]
        //mobile number k liye +971 512345678
        public string OrderContact { get; set; }   
        public string OrderAddress { get; set; }

        public string Emirates { get; set; }
        public string Status { get; set; }     
          
        public string Remarks { get; set; }
       public string? TrackingNumber { get; set; }
      //  public DateTime PaymentDate { get; set; }

        [InverseProperty(nameof(tblOrderDetail.Order))]
        public ICollection<tblOrderDetail> tblOrderDetails { get; set; } = new HashSet<tblOrderDetail>();

        [InverseProperty(nameof(tblOrderPayment.Order))]
        public ICollection<tblOrderPayment> tblOrderPayments { get; set; } = new HashSet<tblOrderPayment>();
    }
}
