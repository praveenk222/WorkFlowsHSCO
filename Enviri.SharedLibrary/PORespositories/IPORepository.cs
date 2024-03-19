using Enviri.SharedLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Enviri.SharedLibrary.PORespositories
{
    public interface IPORepository
    {
        Task<PurchaseOrder> AddProductAsync(PurchaseOrder model);
        Task<PurchaseOrder> UpdateProductAsync(PurchaseOrder model);
        Task<PurchaseOrder> DeleteProductAsync(int Id);
        Task<List<PurchaseOrder>> GetAllProductsAsync();
        Task<PurchaseOrder> GetProductByIdAsync(int Id);
    }
}
