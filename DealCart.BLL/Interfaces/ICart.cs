 using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Interfaces
{
    public interface ICart 
    {
      
        public List<QuantityList> GetQuantityList(int productID, int minimum, int maximum);

        public List<CartVM> AddToBag( int QuantityID, int ProductID, List<CartVM> list);

        public bool CheckDuplicate(int QuantityID, int ProductID, List<CartVM> list);

        public List<CartVM> RemoveFromBag(int rowNo, List<CartVM> list);
        public List<OrderVM> CreateOrderSession(OrderVM o);

        public Task<ProductDetailVM> DisplayProduct(int id);

        public bool BookedOrder(List<OrderVM> orderl, float total, List<CartVM> cart);

        public bool AddOrderDetails(int OrderID ,  List<CartVM> cart);


    }
}
