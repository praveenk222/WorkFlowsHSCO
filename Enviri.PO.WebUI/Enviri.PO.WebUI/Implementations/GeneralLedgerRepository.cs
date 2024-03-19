using Enviri.PO.WebUI;
using Microsoft.EntityFrameworkCore;
using Enviri.SharedLibrary.PORespositories;
using Enviri.SharedLibrary.Models;

namespace Enviri.PO.WebUI.Implementations
{
    public class GeneralLedgerRepository : IGeneralLedgerRepository
    {
        private readonly POContext _pOContext;
        public GeneralLedgerRepository(POContext pOContext)
        {
            this._pOContext = pOContext;
        }
       async Task<TblGeneralLedger> IGeneralLedgerRepository.AddGeneralLedgerAsync(TblGeneralLedger model)
        {
            _pOContext.TblGeneralLedgers.Add(model);
            await _pOContext.SaveChangesAsync();
            return model;
        }

       async Task<TblGeneralLedger> IGeneralLedgerRepository.DeleteGeneralLedgerAsync(int Id)
        {
            var tblGeneralLedger = await _pOContext.TblGeneralLedgers.FindAsync(Id);
            if (tblGeneralLedger == null) return null!;
            _pOContext.TblGeneralLedgers.Remove(tblGeneralLedger);
            await _pOContext.SaveChangesAsync();
            return tblGeneralLedger;
        }

       async Task<List<TblGeneralLedger>> IGeneralLedgerRepository.GetAllGeneralLedgersAsync()
        {
            var data = await _pOContext.TblGeneralLedgers.ToListAsync();
            return data;
        }

       async Task<TblGeneralLedger> IGeneralLedgerRepository.GetGeneralLedgerByIdAsync(int Id)
        {
            var tblGeneralLedger = await _pOContext.TblGeneralLedgers.FindAsync(Id);
            if (tblGeneralLedger is null) return null!;
            return tblGeneralLedger;
        }

        async Task<bool> IGeneralLedgerRepository.TblGeneralLedgerExists(int id)
        {
            bool result = await _pOContext.TblGeneralLedgers.AnyAsync(e => e.Id == id);


          return result;
        }

        Task<TblGeneralLedger> IGeneralLedgerRepository.UpdateGeneralLedgerAsync(TblGeneralLedger model)
        {
            throw new NotImplementedException();
        }
    }
}
