using DealCart.BLL.ViewModels;
using DealCart.DAL.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Interfaces
{
    public interface IProduct
    {
        List<ProductView> GetProducts();
        List<tblProduct> GetCategoryProducts(int categoryID);
        tblProduct GetProductById(int? id);

        ProductUpsertModel FillProductModel(int Id);
       List<ProductQuantity> GetProductQuantity(int id);

        public bool AddEditProduct(ProductUpsertModel model);
        bool DeleteProduct(int Id, string wwwRootPath);

        bool DeleteImage(int Id, string wwwRootPath);
        string SaveProductImage(string ImageUrl, string wwwRootPath, IFormFile? file);
        ProductView GetProductById(int id);
        int GetHighestImageSortOrder(int? id);

        ValidateProduct ValidateProduct(int ProductId);
        bool UpdateImageSortOrder(int id, int sortOrder);
        int GetQuantityById(int id, int pId);
    }
}
