using DealCart.BLL.Interfaces;
using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Services
{
    public class HomeService : IHome

    {
        DealCartContext db;
        IWebHostEnvironment hostEnvironment;
        public HomeService(DealCartContext _db, IWebHostEnvironment _hostEnvironment)
        {
            db = _db;
            hostEnvironment = _hostEnvironment;
        }

        public async Task<List<HomeItemsVM>> GetHomeItems()
        {

            var imgsrc = hostEnvironment.WebRootPath;
              var products=await  db.tblProducts.Include(p=>p.tblProductImages).Where(p => p.Status.Trim()=="Active").Select(p=> new HomeItemsVM
              {
                  Name=p.Name,
                  Description=p.Description,
                  ID=p.ID,
                  ShortDescription=p.ShortDescription,
                  Category=p.Category.Name,
                  VAT= (p.IsDiscount == false) ? p.RealPrice+p.VAT : p.DiscountPrice + p.VAT,
                  Discount=p.DiscountPercent+"%",
                  DiscountPrice=p.DiscountPrice, 
                  IsShippingFree=p.IsShippingFree,
                  ShippingCharges=p.ShippingCharges,
                  Inventory = p.Inventory,
                  Status=p.Status.TrimStart(),
                  Image = p.tblProductImages.Where(s => s.SortOrder == 1).Select(s => s.ImagePath).FirstOrDefault(),
                  IsDiscount =p.IsDiscount,
                 RealPrice=p.RealPrice,
                 SalePrice= (p.IsDiscount == false) ? p.RealPrice : p.DiscountPrice                
              }).Take(20).ToListAsync();
            

           
            return products;

        }



        public async Task<List<HomeItemsVM>> GetSearchItems(string searchString)
        {
            List <HomeItemsVM> Items = await db.tblProducts.Include(p => p.tblProductImages).Where(p => p.Status.Trim() == "Active" && p.Name.Contains(searchString)).Select(p => new HomeItemsVM
            {
                Name = p.Name,
                Description = p.Description,
                ID = p.ID,
                ShortDescription = p.ShortDescription,
                Category = p.Category.Name,
                VAT = (p.IsDiscount == false) ? p.RealPrice + p.VAT : p.DiscountPrice + p.VAT,
                Discount = p.DiscountPercent + "%",
                DiscountPrice = p.DiscountPrice,
                Inventory = p.Inventory,
                Status = p.Status.Trim(),
                Image = p.tblProductImages.Where(s => s.SortOrder == 1).Select(s => s.ImagePath).FirstOrDefault(),
                IsShippingFree = p.IsShippingFree,
                ShippingCharges = p.ShippingCharges,
                IsDiscount = p.IsDiscount,
                RealPrice = p.RealPrice,
                SalePrice = (p.IsDiscount == false) ? p.RealPrice : p.DiscountPrice
            }).ToListAsync();

            return Items;

        }


        public int GetProductCount()
        {
            int count = db.tblProducts.Count();
            return count;
        }

        public float TotalRevenue()
        {
            var Orders = db.tblOrders.Where(o => o.Status != null && o.Status.Trim() != "Cancelled").ToList();
            if (Orders != null)
            {
                var Total = Orders.Sum(o => o.PaidAmount.Value);
                return Total;
            }
            else{
                return 0;
            }
           

        }

        public int TotalOrders()
        {
            var Orders = db.tblOrders.Where(o => o.Status != null && o.Status.Trim() != "Cancelled").ToList();
            if (Orders != null)
            {
                var Total = Orders.Count();
                return Total;
            }
            else
            {
                return 0;
            }

        }

        public int TotalSaleProducts()
        {
            var OrderItems = db.tblOrderDetails.Where(o => o.Order.Status != null && o.Order.Status.Trim() != "Cancelled").ToList();
            if (OrderItems != null)
            {
                var Total = OrderItems.Sum(s=>s.Quantity.Value);
                return Total;
            }
            else
            {
                return 0;
            }
        }
        public async Task<ProductsItemsVM> GetAllProductItems( int? catId)
        {
            ProductsItemsVM allItems = new ProductsItemsVM();
            allItems.Categories = db.tblCategories.Select(C => new CategoryItemsVM
            {
                ID = C.ID,
                Name = C.Name
            }).ToList();

            if (catId == 0 || catId == null)
            {
                allItems.Items = await db.tblProducts.Include(p=>p.tblProductImages).Where(p => p.Status.Trim()=="Active").Select(p => new HomeItemsVM
                {
                    Name = p.Name,
                    Description = p.Description,
                    ID = p.ID,
                    ShortDescription = p.ShortDescription,
                    Category = p.Category.Name,
                    VAT = (p.IsDiscount == false) ? p.RealPrice + p.VAT : p.DiscountPrice + p.VAT,
                    Discount = p.DiscountPercent + "%",
                    DiscountPrice = p.DiscountPrice,
                    Inventory=p.Inventory,
                    Status=p.Status.Trim(),
                    Image=p.tblProductImages.Where(s=>s.SortOrder==1).Select(s=>s.ImagePath).FirstOrDefault(),
                    IsShippingFree= p.IsShippingFree,
                    ShippingCharges = p.ShippingCharges,
                    IsDiscount = p.IsDiscount,
                    RealPrice = p.RealPrice,
                    SalePrice = (p.IsDiscount == false) ? p.RealPrice : p.DiscountPrice
                }).ToListAsync();


             }
            else
            {
                allItems.Items = await db.tblProducts.Include(p=>p.tblProductImages).Where(p => p.Status.Trim()=="Active" && p.CategoryID == catId).Select(p => new HomeItemsVM
                {
                    Name = p.Name,
                    Description = p.Description,
                    ID = p.ID,
                    ShortDescription = p.ShortDescription,
                    Category = p.Category.Name,
                    VAT = (p.IsDiscount == false) ? p.RealPrice + p.VAT : p.DiscountPrice + p.VAT,
                    Discount = p.DiscountPercent + "%",
                    DiscountPrice = p.DiscountPrice,
                    Inventory = p.Inventory,
                    Status=p.Status.Trim(),
                    Image = p.tblProductImages.Where(s => s.SortOrder == 1).Select(s => s.ImagePath).FirstOrDefault(),
                    IsShippingFree = p.IsShippingFree,
                    ShippingCharges = p.ShippingCharges,
                    IsDiscount = p.IsDiscount,
                    RealPrice = p.RealPrice,
                    SalePrice = (p.IsDiscount == false) ? p.RealPrice : p.DiscountPrice
                }).ToListAsync();


            }

          
            return allItems;

        }

       
    }
}
