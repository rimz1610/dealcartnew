using DealCart.BLL.Interfaces;
using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Services
{
    public class ReportService : IReport
    {

        DealCartContext db;

        public ReportService(DealCartContext _db)
        {
            db = _db;
        }


        public List<StockModel> GetSpecificStats(int catId)
        {
            List<StockModel> Items =  db.tblProducts.Where(p => p.CategoryID == catId).Select(p => new StockModel
            {
                Name = p.Name,
                Id = p.ID,
                Total = p.Inventory,
                Sale = 0,
                Remaining=p.Inventory,
              
            }).ToList();
            if(Items.Count > 0  &&Items!=null) {

                foreach (StockModel item in Items)
                {

                    var OrderItems = db.tblOrderDetails.Where(o => o.Order.Status != null && o.Order.Status.Trim() != "Cancelled" && o.ProductID == item.Id).ToList();
                    var productImage = db.tblProductImages.Where(p => p.ProductID== item.Id && p.SortOrder == 1).Select(p=>p.ImagePath).FirstOrDefault();
                    if (OrderItems != null && OrderItems.Count > 0)
                    {
                        var Total = OrderItems.Sum(s => s.Quantity.Value);
                        item.Sale = Total;
                        item.Remaining = item.Total - item.Sale;
                    }
                    if (productImage != null)
                    {
                        item.ImageUrl = productImage;
                    }

                }

            }

            return Items;

        }
    }
}
