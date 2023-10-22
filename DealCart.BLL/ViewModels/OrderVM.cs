using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.ViewModels
{
    public class OrderVM
    {
        public int ID { get; set; }

       
        public DateTime OrderDate { get; set; } = DateTime.Now;
        public DateTime ShippingDate { get; set; }
        public float TotalAmount { get; set; }
        public string OrderType { get; set; }
        public string PaymentType { get; set; }

      
        public string OrderName { get; set; }

       
        public string OrderEmail { get; set; }

       
        //mobile number k liye +971 512345678
        public string OrderContact { get; set; }
        public string OrderAddress { get; set; }

        public string Emirates { get; set; }
        public string Status { get; set; }

        public string? TrackingNumber { get; set; }
        public DateTime PaymentDate { get; set; }
    }


    public class ContactModel
    {

        public string name { get; set; }
        public string email { get; set; }
        public string contact { get; set; }
        public string address { get; set; }

        public string emirates { get; set; }
    }
}
