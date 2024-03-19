using Enviri.PO.WebUI;
using Enviri.SharedLibrary.Models;
using Enviri.SharedLibrary.PORespositories;
using Microsoft.EntityFrameworkCore;
using System;

namespace Enviri.PO.WebUI.Implementations
{
    public class DepartmentRepository : IDepartmentRepository
    {
        private readonly POContext _pOContext;
        public DepartmentRepository(POContext pOContext)
        {
            this._pOContext = pOContext;
        }
      
        async Task<PostResult> IDepartmentRepository.AddDepartmentAsync(TblDepartment model)
        {
            try
            {
                var newDataAdded = _pOContext.PostResults.FromSqlRaw("usp_SaveDepartment {0},{1},{2},{3},{4},{5},{6}", model.Id, model.Name, model.IsDeleted, model.CreatedOn, model.CreatedBy, model.ModifiedBy, model.ModifiedOn);
                return (PostResult)newDataAdded;
            }
            catch (Exception ex)
            {

                throw ex;
            }
          
        }

       async Task<TblDepartment> IDepartmentRepository.UpdateDepartmentAsync(TblDepartment model)
        {

            if (model.Id <= 0)
            {
                // Handle case for new department
                _pOContext.TblDepartments.Add(model);
            }
            else
            {
                // Handle case for existing department update
                _pOContext.TblDepartments.Update(model);
            }

            await _pOContext.SaveChangesAsync();
            return model;
        }

      async  Task<TblDepartment> IDepartmentRepository.DeleteDepartmentAsync(int Id)
        {
            var product = await _pOContext.TblDepartments.FirstOrDefaultAsync(_ => _.Id == Id);
            if (product is null) return null!;
            _pOContext.TblDepartments.Remove(product);
            await _pOContext.SaveChangesAsync();
            return product;
        }

        async Task<List<TblDepartment>> IDepartmentRepository.GetAllDepartmentsAsync()
        {
            //var product = await _pOContext.TblDepartments.ToListAsync();
            var product = await _pOContext.TblDepartments.FromSqlRaw("DepartmentsListAll").ToListAsync();
            return product;
        }

       async Task<TblDepartment> IDepartmentRepository.GetDepartmentByIdAsync(int Id)
        {
            var product = await _pOContext.TblDepartments.FromSqlRaw("DepartmentsViewSingleById").FirstOrDefaultAsync();
            if (product is null) return null!;
            return product;
        }

        Task<IEnumerable<string>> IDepartmentRepository.checkName()
        {
            return (Task<IEnumerable<string>>)_pOContext.TblDepartments.Select(u => u.Name.ToLower());
        }
    }
}
