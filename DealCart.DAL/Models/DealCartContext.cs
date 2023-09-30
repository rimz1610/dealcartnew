using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.DAL.Models
{
   public class DealCartContext : DbContext
    {
        public DealCartContext(DbContextOptions<DealCartContext> options) : base(options)
        {

         
        }


        public DbSet<tblCategory> tblCategories { get; set; }
        public DbSet<tblProduct> tblProducts { get; set; }
        public DbSet<tblProductImage> tblProductImages { get; set; }
        public DbSet<tblCompany> tblCompanies { get; set; }
        public DbSet<tblOrder> tblOrders { get; set; }

        public DbSet<tblOrderPayment> tblOrderPayments { get; set; }
        public DbSet<tblOrderDetail> tblOrderDetails { get; set; }
        public DbSet<tblAdmin> tblAdmins { get; set; }
        public DbSet<tblQuantity> tblQuantities { get; set; }
        //public DbSet<tblDeal> tblDeals { get; set; }
        public  DbSet<ElmahError> ElmahError { get; set; }


      
    }
}
