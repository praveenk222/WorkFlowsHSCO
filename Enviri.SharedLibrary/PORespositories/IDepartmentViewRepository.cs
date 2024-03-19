using Enviri.SharedLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Enviri.SharedLibrary.PORespositories
{
    public interface IDepartmentViewRepository
    {
        Task<DepartmentsView> AddDepartmentAsync(DepartmentsView model);
        Task<DepartmentsView> UpdateDepartmentAsync(DepartmentsView model);
        Task<DepartmentsView> DeleteDepartmentAsync(int Id);
        Task<List<DepartmentsView>> GetAllDepartmentsAsync();
        Task<DepartmentsView> GetDepartmentByIdAsync(int Id);
    }
}
