using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Enviri.PO.WebUI;
using Enviri.PO.WebUI.Implementations;
using Enviri.SharedLibrary.PORespositories;
using Enviri.SharedLibrary.Models;

namespace Enviri.PO.WebUI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GeneralLedgersController : ControllerBase
    {
        private readonly IGeneralLedgerRepository _glRepository;

        public GeneralLedgersController(IGeneralLedgerRepository glRepository)
        {
            _glRepository = glRepository;
        }

        // GET: api/TblGeneralLedgers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblGeneralLedger>>> GetTblGeneralLedgers()
        {
            return await _glRepository.GetAllGeneralLedgersAsync();
        }

        // GET: api/TblGeneralLedgers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblGeneralLedger>> GetTblGeneralLedger(int id)
        {
            var data= await _glRepository.GetGeneralLedgerByIdAsync(id);

            if (data == null)
            {
                return NotFound();
            }

            return data;
        }

        // PUT: api/TblGeneralLedgers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTblGeneralLedger(int id, TblGeneralLedger tblGeneralLedger)
        {
           

            try
            {
                
            }
            catch (DbUpdateConcurrencyException)
            {
               
            }

            return NoContent();
        }

        // POST: api/TblGeneralLedgers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult> PostTblGeneralLedger(TblGeneralLedger tblGeneralLedger)
        {
            try
            {
                var data = await _glRepository.AddGeneralLedgerAsync(tblGeneralLedger);
                return Ok(data); // Assuming AddGeneralLedgerAsync returns the new entity
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }


        }

        // DELETE: api/TblGeneralLedgers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTblGeneralLedger(int id)
        {
         var data=  _glRepository.DeleteGeneralLedgerAsync(id);  

            return Ok(data);
        }

        private Task<bool> TblGeneralLedgerExists(int id)
        {
            return _glRepository.TblGeneralLedgerExists(id);
        }
    }
}
