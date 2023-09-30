using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Interfaces
{
    public interface IHome 
    {

        public int GetProductCount();

        public float TotalRevenue();

        public int TotalOrders();

        public int TotalSaleProducts();
        public Task<List<HomeItemsVM>> GetHomeItems();

        public Task<List<HomeItemsVM>> GetSearchItems(string searchString);

        public Task<ProductsItemsVM> GetAllProductItems( int? catId);
    }
}
