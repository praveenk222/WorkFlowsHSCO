using Enviri.SharedLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Enviri.SharedLibrary.PORespositories
{
    public interface IVendorRepository
    {
        Task<PostResult> AddVendorAsync(TblVendor model);
        Task<TblVendor> UpdateVendorAsync(TblVendor model);
        Task<TblVendor> DeleteVendorAsync(int Id);
        Task<List<TblVendor>> GetAllVendorsAsync();
        Task<TblVendor> GetVendorByIdAsync(int Id);
    }
}
