using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.ViewModels
{
   public class StockModel
    {

        public int Id { get; set; }

        public string Name { get; set; }

        public string ImageUrl { get; set; }

        public int Total { get; set; }

        public int Sale { get; set; }

        public int Remaining { get; set; }

    }
}
