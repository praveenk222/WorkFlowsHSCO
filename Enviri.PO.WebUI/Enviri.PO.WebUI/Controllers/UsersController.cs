using Enviri.PO.WebUI;
using Microsoft.AspNetCore.Mvc;
using Enviri.SharedLibrary.PORespositories;
using Enviri.SharedLibrary.Models;
using Enviri.PO.WebUI.Data;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Enviri.PO.WebUI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersMasterController : ControllerBase
    {
        private readonly IUsersRepository _usersRepository;
        public UsersMasterController(IUsersRepository usersRepository)
        {
            _usersRepository = usersRepository;
        }
        // GET: api/UsersMaster
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblUser>>> GetVendors()
        {
            return Ok(await _usersRepository.GetAllUsersAsync());
        }

        // GET api/UsersMaster/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TblUser>> GetVendor(int id)
        {
            return Ok(await _usersRepository.GetUserByIdAsync(id));
        }

        // POST api/UsersMaster
        [HttpPost]
        public async Task<ActionResult> PostVendor(TblUser model)
        {
            try
            {
                var data = await _usersRepository.AddUsersAsync(model);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return StatusCode(400, ex.Message);
            }

        }

      

        // DELETE api/UsersMaster/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<TblUser>> Delete(int id)
        {
            var data = await _usersRepository.DeleteUsersAsync(id);
            return Ok(data);
        }
    }
}
