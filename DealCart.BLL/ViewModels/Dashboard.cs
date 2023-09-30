using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.ViewModels
{
    public class Dashboard
    {

     public int TotalProducts { get; set; }

        public float TotalRevenue { get; set; }

        public int TotalOrders { get; set; }

        public int TotalSaleProducts { get; set; }
    }
}
