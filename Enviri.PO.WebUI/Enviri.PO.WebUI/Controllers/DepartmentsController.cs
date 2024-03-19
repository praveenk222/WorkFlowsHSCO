using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Enviri.PO.WebUI;
using Enviri.SharedLibrary.PORespositories;
using Enviri.PO.WebUI.Implementations;
using Enviri.SharedLibrary.Models;

namespace Enviri.PO.WebUI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DepartmentsController : ControllerBase
    {
        private readonly IDepartmentRepository _departmentRepository;
        public DepartmentsController(IDepartmentRepository departmentRepository)
        {
            _departmentRepository = departmentRepository;
        }

        // GET: api/Departments
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblDepartment>>> GetTblDepartments()
        {
            var product = await _departmentRepository.GetAllDepartmentsAsync();
            return Ok(product);
        }

        // GET: api/Departments/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblDepartment>> GetTblDepartment(int id)
        {
            var product = await _departmentRepository.GetDepartmentByIdAsync(id);
            return Ok(product);
        }

        // PUT: api/Departments/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblDepartment(int id, TblDepartment tblDepartment)
        {
            var product = await _departmentRepository.AddDepartmentAsync(tblDepartment);
            return Ok(product);
        }

        // POST: api/Departments
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TblDepartment>> PostTblDepartment(TblDepartment tblDepartment)
        {
            var product = await _departmentRepository.UpdateDepartmentAsync(tblDepartment);
            return Ok(product);
        }

        // DELETE: api/Departments/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> checkTblDepartment(int id)
        {
            var product = await _departmentRepository.DeleteDepartmentAsync(id);
            return Ok(product);
        }
        [HttpGet("checkname")]
        public async Task<IActionResult> DeleteTblDepartment(int id)
        {
            var product = await _departmentRepository.DeleteDepartmentAsync(id);
            return Ok(product);
        }
    }
}
