using Enviri.PO.WebUI;
using Microsoft.EntityFrameworkCore;
using Enviri.SharedLibrary.PORespositories;
using System;
using Enviri.SharedLibrary.Models;

namespace Enviri.PO.WebUI.Implementations
{
    public class PORepository : IPORepository
    {
        private readonly POContext _pOContext;
        public PORepository(POContext pOContext)
        {
            this._pOContext = pOContext;
        }
        async Task<PurchaseOrder> IPORepository.AddProductAsync(PurchaseOrder model)
        {
            if (model is null) return null!;
            //var chk = await appDbContext.Products.Where(_ => _.Name.ToLower().Equals(model.Name.ToLower())).FirstOrDefaultAsync();
            //if (chk is not null) return null!;
            var newDataAdded=_pOContext.PurchaseOrders.Add(model).Entity;
            await _pOContext.SaveChangesAsync();
            return newDataAdded;
        }

  

     
        public async Task<List<PurchaseOrder>> GetAllProductsAsync() => await _pOContext.PurchaseOrders.ToListAsync();
     async   Task<PurchaseOrder> IPORepository.GetProductByIdAsync(int Id)
        {
            var product = await _pOContext.PurchaseOrders.FirstOrDefaultAsync(_ => _.Id == Id);
            if(product is null) return null!;
            return product;
        }

       async Task<PurchaseOrder> IPORepository.UpdateProductAsync(PurchaseOrder model)
        {
            var product = await _pOContext.PurchaseOrders.FirstOrDefaultAsync(_ => _.Id == model.Id);
            if (product is null) return null!;
          
            await _pOContext.SaveChangesAsync();
            return await _pOContext.PurchaseOrders.FirstOrDefaultAsync(_ => _.Id == model.Id)!;
        }

       async  Task<PurchaseOrder> IPORepository.DeleteProductAsync(int Id)
        {
            var product = await _pOContext.PurchaseOrders.FirstOrDefaultAsync(_ => _.Id == Id);
            if (product is null) return null!;
            _pOContext.PurchaseOrders.Remove(product);
            await _pOContext.SaveChangesAsync();
            return product;
        }
    }
}
