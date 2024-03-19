using Enviri.PO.WebUI;
using Enviri.SharedLibrary.Models;
using Enviri.SharedLibrary.PORespositories;
using System.Net.Http.Json;

namespace Enviri.PO.WebUI.Services
{
    public class PurchaseOrderService : IPORepository
    {
        private readonly HttpClient _httpClient;
        public PurchaseOrderService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        async Task<PurchaseOrder> IPORepository.AddProductAsync(PurchaseOrder model)
        {
            var product = await _httpClient.PostAsJsonAsync("api/PurchaseOrders", model);
            var response=await product.Content.ReadFromJsonAsync<PurchaseOrder>();
            return response!;
        }

       async Task<PurchaseOrder> IPORepository.DeleteProductAsync(int Id)
        {
            var product = await _httpClient.DeleteAsync("api/PurchaseOrders/{Id}");
            var response = await product.Content.ReadFromJsonAsync<PurchaseOrder>();
            return response!;
        }

          async  Task<List<PurchaseOrder>> IPORepository.GetAllProductsAsync()
        {
            var product = await _httpClient.GetAsync("api/PurchaseOrders");
            var response = await product.Content.ReadFromJsonAsync<List<PurchaseOrder>>();
            return response!;
        }

       async Task<PurchaseOrder> IPORepository.GetProductByIdAsync(int Id)
        {
            var product = await _httpClient.GetAsync("api/PurchaseOrders/{Id}");
            var response = await product.Content.ReadFromJsonAsync<PurchaseOrder>();
            return response!;
        }

        async Task<PurchaseOrder> IPORepository.UpdateProductAsync(PurchaseOrder model)
        {
            var product = await _httpClient.PutAsJsonAsync("api/PurchaseOrders/{Id}", model);
            var response = await product.Content.ReadFromJsonAsync<PurchaseOrder>();
            return response!;
        }
    }
}
