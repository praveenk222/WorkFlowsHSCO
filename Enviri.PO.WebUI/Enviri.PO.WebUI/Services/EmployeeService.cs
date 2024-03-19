using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using Enviri.PO.WebUI.Components.Pages;
using Enviri.PO.WebUI;
using Microsoft.AspNetCore.HttpLogging;
using Microsoft.EntityFrameworkCore;
using Enviri.SharedLibrary.Models;

namespace Enviri.PO.WebUI.Services
{
    public class EmployeeService
    {
        private readonly POContext _poContext;
        #region Constructor
        public EmployeeService(POContext pocontext)
        {
            _poContext=pocontext;

        }
        #endregion
        public async Task<List<TblWorkFlowNew>> GetAllWOrkflows()
        {
            var query = from wf in _poContext.TblWorkFlows
                        join dept in _poContext.TblDepartments on wf.DepartmentId equals dept.Id
                        select new TblWorkFlowNew()
                        {
                            WorkFlowName=wf.WorkFlowName,
                           
                            DeaprtmentName = dept.Name
                        };

           
            return query.ToList();
        }
        public async Task<List<TblWorkFlowMember>> GetAllWOrkflowMembers()
        {
            return await _poContext.TblWorkFlowMembers.ToListAsync();
        }
    }
}
