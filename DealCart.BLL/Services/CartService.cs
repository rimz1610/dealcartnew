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
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Services
{
    public class CartService : ICart

    {
        DealCartContext db;
        readonly IOrder _order;
        public CartService(DealCartContext _db, IOrder order)
        {
            db = _db;
            _order = order;
        }

        public List<OrderVM> CreateOrderSession(OrderVM o)
        {
            Random random = new Random();
            o.OrderDate = System.DateTime.Now;
            o.PaymentType = "";
            o.Status = "UnPaid";
            o.OrderType = "Sale";
            o.ID = 0;
            o.ShippingDate = o.OrderDate.AddDays(5);
            o.TrackingNumber = Guid.NewGuid().ToString() + random.Next(1000, 9999);
            List<OrderVM> list = new List<OrderVM>();
            list.Add(o);
            
            return list;
        }

        public bool CheckDuplicate(int QuantityID, int ProductID, List<CartVM> list)
        {
            var product = db.tblProducts.Where(p => p.ID == ProductID).FirstOrDefault();
            var pq = db.tblQuantities.Where(q => q.ID == QuantityID).FirstOrDefault();

            bool isProductExist = false;
            foreach (var item in list)
            {
                if (ProductID == item.ProductID && pq.Quantity == item.Quantity)
                {
                    isProductExist = true;
                    return true;
                }
               
            }
            return false;

        }


        public async Task<ProductDetailVM> DisplayProduct(int id)
        {
            var product = await db.tblProducts.Include(p => p.tblProductImages).Where(p => p.ID == id && p.Status.Trim()!="Inactive").Select(p => new ProductDetailVM
            {
                Name = p.Name,
                Description = p.Description,
                ID = p.ID,
                ShortDescription = p.ShortDescription,
                Category = p.Category.Name,
                VAT = (p.IsDiscount == false) ? p.RealPrice + p.VAT : p.DiscountPrice + p.VAT,
                Discount = p.DiscountPercent + "%",
                ShippingFee=p.ShippingCharges,
                IsShippingFree=p.IsShippingFree,
                CategoryID=p.CategoryID,
                CreatedDate=p.CreatedDate,
                Inventory=p.Inventory,              
                IsDiscount = p.IsDiscount,
                RealPrice = p.RealPrice,
                DiscountPrice=p.DiscountPrice,
                DefaultImage= (p.tblProductImages.Count > 0 && p.tblProductImages != null) ? p.tblProductImages.Where(s => s.SortOrder == 1).Select(s => s.ImagePath).FirstOrDefault() : null,
                Url = "/Cart/Order?id=" + p.ID,
                Status =p.Status.Trim(),
                ProductImages= p.tblProductImages.Select(s=> new ImagesVM
                {
                    ImageUrl=s.ImagePath,
                    SortOrder=s.SortOrder,
                }).ToList(),
                SalePrice = (p.IsDiscount == false) ? p.RealPrice : p.DiscountPrice,
                MaximumQuantity = p.MaximumQuantity,
                MinimumQuantity = p.MinumQuantity,
            
            }).FirstOrDefaultAsync();
            if (product != null)
            {
                product.QuantityLists = GetQuantityList(product.ID, product.MinimumQuantity, product.MaximumQuantity);
                product.QuantityList = product.QuantityLists.Select(i => new SelectListItem
                {
                    Text = i.Display,
                    Value = i.QuantityID.ToString()
                });
                product.Sold = db.tblOrderDetails.Where(p => p.ID == product.ID).Count();
                return product;
            }
            else
            {
                return null;
            }
          
           


        }


        public  List<QuantityList> GetQuantityList(int productID,int minimum ,  int maximum){

            var list = new List<QuantityList>();
           var quantities = db.tblQuantities.Where(q => q.ProductID == productID).ToList();

            foreach( var item in quantities)
            {
                list.Add(new QuantityList
                    {
                    SalePrice= item.Price,
                    Quantity=item.Quantity,
                    Display=item.Quantity +" - "+item.Price+" AED",
                    QuantityID= item.ID
                     }
                    );
                   
            }
            return list;
         }


         public async Task<string> GenerateReferenceNumber()
        {
            string newReferenceNumber = "DC-";
            int ReferenceNumber = await _order.GetOrderNumber();
            string Reference = Convert.ToString(ReferenceNumber + 1);
            newReferenceNumber += Reference.PadLeft(6, '0');
            return newReferenceNumber;
        }

        public bool BookedOrder(List<OrderVM> orderl, float total, List<CartVM> cart)
        {
            try {
                string newReferenceNumber = "DC-";
                int ReferenceNo = 0;
                tblOrder oldorder =  db.tblOrders.OrderByDescending(i => i.ID).FirstOrDefault();
                if (oldorder != null && !string.IsNullOrEmpty(oldorder.OrderNo))
                {
                    string[] subs = oldorder.OrderNo.Split(' ', '-');
                    ReferenceNo = Convert.ToInt32(subs[1]);
                }
                string Reference = Convert.ToString(ReferenceNo + 1);
                newReferenceNumber += Reference.PadLeft(6, '0');
                OrderVM o = orderl.FirstOrDefault();
                tblOrder order = new tblOrder()
                {
                    OrderName = o.OrderName,
                    OrderEmail = o.OrderEmail,
                    PaymentType = o.PaymentType,
                    OrderAddress = o.OrderAddress,
                    OrderContact = o.OrderContact,
                    OrderDate = o.OrderDate,
                    TotalAmount = total,
                    OrderType = o.OrderType,
                    Emirates = o.Emirates,
                    ID = o.ID,
                    Remarks = string.Empty,
                    PaidAmount=0,
                   
                //PaymentDate = o.PaymentDate,
                ShippingDate = o.ShippingDate,
                Status = o.Status,
                TrackingNumber = o.TrackingNumber,

            };
                order.OrderNo = newReferenceNumber;
           
                db.tblOrders.Add(order);
                db.SaveChanges();
                bool result = AddOrderDetails(order.ID, cart);
                return result;
            }
            catch(Exception ex)
            {
                return false;
            }
         
        }

        public bool AddOrderDetails(int OrderID, List<CartVM> cart)
        {
            try
            {
                if (cart != null)
                {

                    foreach (var item in cart)
                    {
                        tblOrderDetail orderDetail = new tblOrderDetail()
                        {
                            OrderID = OrderID,
                            ProductID = item.ProductID,
                            SalePrice = item.SalePrice,
                            Quantity = item.Quantity,
                            

                        };
                        db.tblOrderDetails.Add(orderDetail);
                        db.SaveChanges();

                    }
                    return true;
                }
                else
                {
                    return false;
                }
               
            }
            catch(Exception ex) {

                return false;
            }

          


        }
     
        
        
        public List<CartVM> AddToBag( int QuantityID, int ProductID, List<CartVM> list)
        {
            var product = db.tblProducts.Include(p=>p.tblProductImages).Where(p => p.ID == ProductID).FirstOrDefault();
            var pq = db.tblQuantities.Where(q => q.ID == QuantityID).FirstOrDefault();
            if(product != null)
            {
                bool isProductExist = false;
                foreach (var item in list)
                {
                    if (ProductID == item.ProductID && pq.Quantity == item.Quantity)
                    {
                        //Dupliocate Items with same quantity not alllow
                        isProductExist = true;
                        //item.Quantity = item.Quantity + pq.Quantity;                
                        //item.SalePrice = item.SalePrice + pq.Price;

                    }
                }
                if (isProductExist == false)
                {
                    list.Add(new CartVM
                    {
                        ImageUrl = (product.tblProductImages != null) ? product.tblProductImages.Where(p => p.SortOrder == 1).Select(p => p.ImagePath).FirstOrDefault():"",

                        Description = product.ShortDescription,
                        ProductID = product.ID,
                        Name = product.Name,
                        QuantityPrice = pq.Quantity + " - " + pq.Price + " AED",
                        ShippingCharges= (product.IsShippingFree == false ? product.ShippingCharges.Value : 0),
                        SalePrice = pq.Price ,
                        Quantity = pq.Quantity,
                        VAT = product.VAT,
                    }
                    );


                }
            }
           

            return list;
        }
        public List<CartVM> RemoveFromBag(int RowNo, List<CartVM> list)
        {
            list.RemoveAt(RowNo);
            return list;
        }

     

    }
}

