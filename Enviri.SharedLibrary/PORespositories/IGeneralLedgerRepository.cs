using Enviri.SharedLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Enviri.SharedLibrary.PORespositories
{
    public interface IGeneralLedgerRepository
    {
        Task<TblGeneralLedger> AddGeneralLedgerAsync(TblGeneralLedger model);
        Task<TblGeneralLedger> UpdateGeneralLedgerAsync(TblGeneralLedger model);
        Task<TblGeneralLedger> DeleteGeneralLedgerAsync(int Id);
        Task<List<TblGeneralLedger>> GetAllGeneralLedgersAsync();
        Task<TblGeneralLedger> GetGeneralLedgerByIdAsync(int Id);

        Task<bool> TblGeneralLedgerExists(int id);
    } 
}
