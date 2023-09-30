using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.ViewModels
{
    public class CartVM
    {
        public int ProductID { get; set; }

        public string Name { get; set; }

        public string ImageUrl { get; set; }

        public string Description { get; set; }

        public float? SalePrice { get; set; }

        public int Quantity { get; set; }

        public float VAT { get; set; }

        public float ShippingCharges { get; set; }

        public string QuantityPrice { get; set; }
    }
}
