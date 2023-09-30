using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.ViewModels
{
    public class OrderViewModel
    {
        public int Id { get; set; }
        public string OrderNumber { get; set; }
        public float? OrderAmount { get; set; }
        public string OrderDate { get; set; }
        public string PaymentMethod { get; set; }
        public float? PaidAmount { get; set; }
        public string Remarks { get; set; }
        public string Status { get; set; }
      
       
        public string OrderType { get; set; }
   

        public string Name { get; set; }
     
        public string Email { get; set; }
        public string Phone { get; set; }

        public string Emirates { get; set; }
        public string Address { get; set; }
        public string TrackingNumber { get; set; }

   


    }


    public class BookingOrderVM
    {

        public OrderViewModel Order { get; set; }

        public List<OrderDetailModel> OrderItems { get; set; }

    }
    public class OrderDetailModel
    {
        public int Id { get; set; }

        public string Name { get; set; }
        public string ShortDescription { get; set; }

        public int Quantity { get; set; }
        public float? Amount { get; set; }
    }


    public class OrderPartialPaymentModel
    {
        public int OrderId { get; set; }
        public string PaymentType { get; set; }
       
        public float PaidAmount { get; set; }
     
        public DateTime PaidDate { get; set; }
        public string Status { get; set; }
     

    }

    public class OrderEditViewModel
    {
        public long Id { get; set; }
    
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Emirates { get; set; }

        public string Address { get; set; }
        public string OrderNo { get; set; }
    }
}
