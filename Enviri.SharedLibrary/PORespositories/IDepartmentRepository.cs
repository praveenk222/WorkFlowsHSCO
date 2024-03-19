using Enviri.SharedLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Enviri.SharedLibrary.PORespositories
{
    public interface IDepartmentRepository
    {
        Task<PostResult> AddDepartmentAsync(TblDepartment model);
        Task<TblDepartment> UpdateDepartmentAsync(TblDepartment model);
        Task<TblDepartment> DeleteDepartmentAsync(int Id);
        Task<List<TblDepartment>> GetAllDepartmentsAsync();
        Task<TblDepartment> GetDepartmentByIdAsync(int Id);
        Task<IEnumerable<string>> checkName();

    }
}
