using Enviri.PO.WebUI;
using Microsoft.AspNetCore.Mvc;
using Enviri.SharedLibrary.PORespositories;
using Enviri.SharedLibrary.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Enviri.PO.WebUI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VendorMasterController : ControllerBase
    {
        private readonly IVendorRepository _vendorRepository;
        public VendorMasterController(IVendorRepository vendorRepository)
        {
            _vendorRepository = vendorRepository;
        }
        // GET: api/VendorMaster
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblVendor>>> GetVendors()
        {
            return Ok(await _vendorRepository.GetAllVendorsAsync());
        }

        // GET api/VendorMaster/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblVendor>> GetVendor(int id)
        {
            return Ok(await _vendorRepository.GetVendorByIdAsync(id));
        }

        // POST api/VendorMaster
        [HttpPost]
        public async Task<ActionResult> PostVendor(TblVendor model)
        {
            try
            {
                var data = await _vendorRepository.UpdateVendorAsync(model);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return StatusCode(400, ex.Message);
            }

        }

        // PUT api/VendorMaster
        [HttpPut("{id}")]
        public async Task<ActionResult<TblVendor>> PutVendor(TblVendor model)
        {
            var data = await _vendorRepository.UpdateVendorAsync(model);
            return Ok(data);
        }

        // DELETE api/VendorMaster/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<TblVendor>> Delete(int id)
        {
            var data = await _vendorRepository.DeleteVendorAsync(id);
            return Ok(data);
        }
    }
}
