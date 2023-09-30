using DealCart.BLL.Interfaces;
using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using LinqKit;
using System.Threading.Tasks;
using static Microsoft.AspNetCore.Razor.Language.TagHelperMetadata;

namespace DealCart.BLL.Services
{
    public class OrderService : IOrder

    {
        DealCartContext db;
        public OrderService(DealCartContext _db)
        {
            db = _db;
        }


        public BookingOrderVM GetOrderDetails(int orderID)
        {

#pragma warning disable CS8600 // Converting null literal or possible null value to non-nullable type.
            OrderViewModel order = db.tblOrders.Where(b => b.ID == orderID).Select(b => new OrderViewModel
            {
                Id = b.ID,
                Name = b.OrderName,
                OrderType = b.OrderType,
                OrderAmount = b.TotalAmount,
                OrderDate = b.OrderDate.ToString("dd/MM/yyyy hh:mm tt"),
                PaidAmount = b.PaidAmount,
                Email = b.OrderEmail,
                PaymentMethod = b.PaymentType,
                Phone = b.OrderContact,
                Address = b.OrderAddress,
                Emirates = b.Emirates,
                OrderNumber = b.OrderNo,
                Remarks = b.Remarks,
                Status = b.Status.Trim(),
                TrackingNumber = b.TrackingNumber ?? ""

            }).FirstOrDefault();
#pragma warning restore CS8600 // Converting null literal or possible null value to non-nullable type.



            if (order != null)
            {

                List<OrderDetailModel> list = GetOrderItemsDetails(orderID);

                BookingOrderVM model = new BookingOrderVM()
                {
                    Order = order,
                    OrderItems = list


                };
                return model;
            }
            return null;

        }

        public List<OrderDetailModel> GetOrderItemsDetails(int orderId)
        {
            List<tblOrderDetail> orderDetails = db.tblOrderDetails.Include(t => t.Product).Where(o => o.OrderID == orderId).ToList();
            List<OrderDetailModel> list = new List<OrderDetailModel>();
            if (orderDetails.Count > 0 && orderDetails!=null)
            {
                foreach (var item in orderDetails)
                {
                    OrderDetailModel b = new OrderDetailModel()
                    {
                        Amount = item.SalePrice,
                        Id = item.ID,
                        Name = item.Product.Name,
                        
                        Quantity = item.Quantity.Value,
                        ShortDescription = item.Product.ShortDescription
                    };

                    list.Add(b);
                }
            }

            return list;

        }

        public bool EditOrderDetails(OrderEditViewModel obj)
        {
            if (obj != null)
            {


                tblOrder order = db.tblOrders.Where(b => b.ID == obj.Id).FirstOrDefault();

                order.OrderName = obj.Name;
                order.OrderEmail = obj.Email;
                order.OrderContact = obj.Phone;
                order.OrderAddress = obj.Address;
                order.Emirates = obj.Emirates;

                _ = db.tblOrders.Update(order);
                _ = db.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public async Task<int> GetOrderNumber()
        {
            try
            {
                int Reference = 0;
                tblOrder order = await db.tblOrders.OrderByDescending(i => i.ID).FirstOrDefaultAsync();
                if (order != null && !string.IsNullOrEmpty(order.OrderNo))
                {
                    string[] subs = order.OrderNo.Split(' ', '-');
                    Reference = Convert.ToInt32(subs[1]);
                }
                return Reference;
            }
            catch(Exception ex)
            {
                string message = ex.Message;
                return 0;
            }
          
        }

        public async Task<tblOrder> GetAllOrderDetailsById(int Id)
        {
            var order = await db.tblOrders.Where(i => i.ID == Id)
               .Include(i => i.tblOrderDetails).ThenInclude(i => i.Product).ThenInclude(i => i.tblQuantities)
                .Include(i => i.tblOrderDetails).ThenInclude(i => i.Product).ThenInclude(I => I.tblProductImages)
               .Include(i => i.tblOrderPayments)


               .AsNoTracking().FirstOrDefaultAsync();
            if (order != null)
            {
                return order;
            }
            else
            {
                return null;
            }
        }

        public async Task<tblOrder> GetPartialPaymentDetail(int Id)
        {
            tblOrder order = new tblOrder();
            try
            {

#pragma warning disable CS8600 // Converting null literal or possible null value to non-nullable type.
                order = await db.tblOrders
                    .Where(s => s.ID == Id)
                    .Include(s => s.tblOrderPayments)
                    .AsNoTracking()
                    .FirstOrDefaultAsync();
#pragma warning restore CS8600 // Converting null literal or possible null value to non-nullable type.

                order = order ?? new tblOrder();
            }
            catch (Exception)
            {
                //TODO
            }
            return order;
        }

        public List<OrderViewModel> SearchOrders(string SearchPaymentMethod, string SearchPaymentStatus)
        {
            Expression<Func<tblOrder, bool>> expression = PredicateBuilder.True<tblOrder>();
            List<OrderViewModel> lstOrders = new List<OrderViewModel>();
            if (!string.IsNullOrEmpty(SearchPaymentMethod))
            {
                expression = PredicateBuilder.And<tblOrder>(expression, (tblOrder c) => c.PaymentType == SearchPaymentMethod);
            }


            if (!string.IsNullOrEmpty(SearchPaymentStatus))
            {
                if (SearchPaymentStatus == "UnPaid")
                {
                    expression = PredicateBuilder.And<tblOrder>(expression, (tblOrder c) => c.Status == null);
                }
                else
                {
                    expression = PredicateBuilder.And<tblOrder>(expression, (tblOrder c) => (c.Status != null && c.Status.Contains(SearchPaymentStatus)));
                }
            }

            if (string.IsNullOrEmpty(SearchPaymentMethod) && string.IsNullOrEmpty(SearchPaymentStatus))
            {
                lstOrders = db.tblOrders.OrderByDescending(b => b.ID).Select(b => new OrderViewModel
                {
                    Id = b.ID,
                    Name = b.OrderName,
                    OrderType = b.OrderType,
                    OrderAmount = b.TotalAmount,
                    OrderDate = b.OrderDate.ToString("dd/MM/yyyy hh:mm tt"),
                    PaidAmount = b.PaidAmount,
                    Email = b.OrderEmail,
                    PaymentMethod = b.PaymentType,
                    Phone = b.OrderContact,
                    Address = b.OrderAddress,
                    Emirates = b.Emirates,

                    OrderNumber = b.OrderNo,
                    Remarks = b.Remarks,
                    Status = b.Status.Trim(),
                    TrackingNumber = b.TrackingNumber ?? ""
                }).ToList();
            }
            else
            {

                List<tblOrder> tblOrderss = db.tblOrders.Where((c => c.Status != null && c.Status.Contains(SearchPaymentStatus))).ToList();
                lstOrders = db.tblOrders.Where<tblOrder>(expression.Compile()).Select(b => new OrderViewModel
                {
                    Id = b.ID,
                    Name = b.OrderName,
                    OrderType = b.OrderType,
                    OrderAmount = b.TotalAmount,
                    OrderDate = b.OrderDate.ToString("dd/MM/yyyy hh:mm tt"),
                    PaidAmount = b.PaidAmount,
                    Email = b.OrderEmail,
                    PaymentMethod = b.PaymentType,
                    Phone = b.OrderContact,
                    Address = b.OrderAddress,
                    Emirates = b.Emirates,

                    OrderNumber = b.OrderNo,
                    Remarks = b.Remarks,
                    Status = b.Status.Trim(),
                    TrackingNumber = b.TrackingNumber ?? ""
                }).ToList();
            }


            return lstOrders;
        }

        public async Task<tblOrder> GetAllOrderDetailsByNo(string orderNo)
        {
            var order = await db.tblOrders.Where(i => i.OrderNo == orderNo)
             .Include(i => i.tblOrderDetails).ThenInclude(i => i.Product).ThenInclude(i => i.tblQuantities)
              .Include(i => i.tblOrderDetails).ThenInclude(i => i.Product).ThenInclude(I => I.tblProductImages)
             .Include(i => i.tblOrderPayments)


             .AsNoTracking().FirstOrDefaultAsync();
            if (order != null)
            {
                return order;
            }
            else
            {
                return null;
            }
        }

        public async Task<List<OrderViewModel>> GetAllOrders()
        {
            List<OrderViewModel> list = await db.tblOrders
                 .OrderByDescending(b => b.ID)
               .Select(b => new OrderViewModel
               {
                   Id = b.ID,
                   Name = b.OrderName,
                   OrderType = b.OrderType,
                   OrderAmount = b.TotalAmount,
                   OrderDate = b.OrderDate.ToString("dd/MM/yyyy hh:mm tt"),
                   PaidAmount = b.PaidAmount,
                   Email = b.OrderEmail,
                   PaymentMethod = b.PaymentType,
                   Phone = b.OrderContact,
                   Address = b.OrderAddress,
                   Emirates = b.Emirates,

                   OrderNumber = b.OrderNo,
                   Remarks = b.Remarks,
                   Status = b.Status.Trim(),
                   TrackingNumber = b.TrackingNumber ?? ""

               }).ToListAsync();


            return list;
        }

        public async Task<bool> SaveManualPayment(OrderPartialPaymentModel model)
        {
            try
            {
                tblOrder order = await db.tblOrders.FirstOrDefaultAsync(s => s.ID == model.OrderId);

                _ = await db.tblOrderPayments.AddAsync(new tblOrderPayment
                {
                    OrderID = model.OrderId,
                    OrderAmount = order.TotalAmount,
                    PaymentType = model.PaymentType,
                    PaidAmount = model.PaidAmount,
                    
                    TxnRef = Guid.NewGuid().ToString(),
                    Status = model.Status,
                    CreditCard=string.Empty,
                    
                    PaidDate = model.PaidDate,
                });

                order.PaidAmount = model.PaidAmount;
                if (order.Status == null && model.PaidAmount > 0)
                {
                    order.Status = "Paid";
                }
                db.Entry(order).State = EntityState.Modified;
                int result = await db.SaveChangesAsync();
                return result > 0;
            }
            catch (Exception ex)
            {
            }
            return false;
        }

        public async Task<bool> CancelOrder(int orderId)
        {
            using (var transaction = await db.Database.BeginTransactionAsync())
            {
                try
                {
                    var order = await db.tblOrders

                        .FirstOrDefaultAsync(s => s.ID == orderId);
                    if (order != null)
                    {
                        order.Status = "Cancelled";
                        db.Update(order);
                        await db.SaveChangesAsync();
                        await transaction.CommitAsync();
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch (Exception ex)
                {
                    var msg = ex.Message;
                    await transaction.RollbackAsync();
                    //TODO
                    return false;
                }
            }
        }


    }
}

