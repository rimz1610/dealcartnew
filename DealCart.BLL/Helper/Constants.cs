using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Helper
{
    public static class Constants
    {
        public static string AmountFormat = "{0:$#,##0.00; -$#,##0.00;}";
        public static string AmountFormatWithoutSign = "{0:#,##0.00; -#,##0.00;}";

        //TourBooking Status
        public static string Active = "Active";
        public static string Inactive = "Inactive";
        public static string OutofStock = "OutOfStock";
    }
}
