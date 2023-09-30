 using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Interfaces
{
    public interface IOrder 
    {

        BookingOrderVM GetOrderDetails(int orderID);
        bool EditOrderDetails(OrderEditViewModel obj);

        Task<int> GetOrderNumber();

        Task<tblOrder> GetAllOrderDetailsById(int Id);

        Task<tblOrder> GetPartialPaymentDetail(int Id);
        List<OrderViewModel> SearchOrders(string SearchPaymentMethod,  string SearchPaymentStatus);

        Task<tblOrder> GetAllOrderDetailsByNo(string orderNo);

        Task<List<OrderViewModel>> GetAllOrders();

        Task<bool> SaveManualPayment(OrderPartialPaymentModel model);

        Task<bool> CancelOrder(int orderId);
        List<OrderDetailModel> GetOrderItemsDetails(int Id);
    }
}
