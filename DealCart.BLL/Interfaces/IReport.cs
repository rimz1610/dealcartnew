 using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Interfaces
{
    public interface IReport 
    {

        List<StockModel> GetSpecificStats(int catId);

    }
}
