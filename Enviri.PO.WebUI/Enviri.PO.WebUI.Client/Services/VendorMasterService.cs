using Enviri.PO.WebUI;
using Enviri.SharedLibrary.Models;
using Enviri.SharedLibrary.PORespositories;
using System.Net.Http.Json;

namespace Enviri.PO.WebUI.Client.Services
{
    public class VendorMasterService : IVendorRepository
    {
        private readonly HttpClient _httpClient;

        public VendorMasterService()
        {
            _httpClient = new HttpClient();
        }
        async Task<PostResult> IVendorRepository.AddVendorAsync(TblVendor model)
        {
            var data = await _httpClient.PostAsJsonAsync("http://localhost:5244/api/VendorMaster", model);
            var response=await data.Content.ReadFromJsonAsync<PostResult>();
            return response!;
        }

        async Task<TblVendor> IVendorRepository.DeleteVendorAsync(int Id)
        {
            var data = await _httpClient.DeleteAsync($"http://localhost:5244/api/VendorMaster/{Id}");
            var response = await data.Content.ReadFromJsonAsync<TblVendor>();
            return response!;
        }

       async Task<List<TblVendor>> IVendorRepository.GetAllVendorsAsync()
        {
            var data = await _httpClient.GetAsync("http://localhost:5244/api/VendorMaster");
            var response = await data.Content.ReadFromJsonAsync<List<TblVendor>>();
            return response!;
        }

        async Task<TblVendor> IVendorRepository.GetVendorByIdAsync(int Id)
        {
            var data = await _httpClient.GetAsync("http://localhost:5244/api/VendorMaster/{Id}");
            var response = await data.Content.ReadFromJsonAsync<TblVendor>();
            return response!;
        }

       async Task<TblVendor> IVendorRepository.UpdateVendorAsync(TblVendor model)
        {
            var data = await _httpClient.PutAsJsonAsync("http://localhost:5244/api/VendorMaster", model);
            var response = await data.Content.ReadFromJsonAsync<TblVendor>();
            return response!;
        }
    }
}
