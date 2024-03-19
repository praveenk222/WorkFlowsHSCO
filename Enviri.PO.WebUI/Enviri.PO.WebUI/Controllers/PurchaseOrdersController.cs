using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Enviri.PO.WebUI;
using Enviri.SharedLibrary.PORespositories;
using Enviri.SharedLibrary.Models;

namespace Enviri.PO.WebUI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PurchaseOrdersController : ControllerBase
    {
        private readonly IPORepository _pORepository;
        public PurchaseOrdersController(IPORepository pORepository)
        {
            _pORepository = pORepository;
        }

        // GET: api/PurchaseOrders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PurchaseOrder>>> GetPurchaseOrders()
        {
            return Ok(await _pORepository.GetAllProductsAsync());
        }

        // GET: api/PurchaseOrders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PurchaseOrder>> GetPurchaseOrder(int id)
        {
            return Ok(await _pORepository.GetProductByIdAsync(id));
        }

        // PUT: api/PurchaseOrders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPurchaseOrder(int id, PurchaseOrder purchaseOrder)
        {
            var product = await _pORepository.UpdateProductAsync(purchaseOrder);
            return Ok(product);
        }

        // POST: api/PurchaseOrders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<PurchaseOrder>> PostPurchaseOrder(PurchaseOrder purchaseOrder)
        {
            var product = await _pORepository.UpdateProductAsync(purchaseOrder);
            return Ok(product);
        }

        // DELETE: api/PurchaseOrders/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePurchaseOrder(int id)
        {
            var product = await _pORepository.DeleteProductAsync(id);
            return Ok(product);
        }

    }
}
