using Enviri.PO.WebUI;
using Enviri.SharedLibrary.Models;
using Enviri.SharedLibrary.PORespositories;
using System;
using System.Net.Http.Json;

namespace Enviri.PO.WebUI.Services
{
    public class DepartmentService : IDepartmentRepository
    {
        private readonly HttpClient _httpClient;
       
        public DepartmentService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        async Task<PostResult> IDepartmentRepository.AddDepartmentAsync(TblDepartment model)
        {
            var product = await _httpClient.PostAsJsonAsync("api/Departments", model);
            var response = await product.Content.ReadFromJsonAsync<PostResult>();
            return response!;
        }

        Task<IEnumerable<string>> IDepartmentRepository.checkName()
        {
            throw new NotImplementedException();
        }

        async  Task<TblDepartment> IDepartmentRepository.DeleteDepartmentAsync(int Id)
        {
            var product = await _httpClient.DeleteAsync($"api/Departments/{Id}");
            var response = await product.Content.ReadFromJsonAsync<TblDepartment>();
            return response!;
        }


        async Task<List<TblDepartment>> IDepartmentRepository.GetAllDepartmentsAsync()
        {
            var product = await _httpClient.GetAsync("api/Departments");
            var response = await product.Content.ReadFromJsonAsync<List<TblDepartment>>();
            return response!;
        }      

        async Task<TblDepartment> IDepartmentRepository.GetDepartmentByIdAsync(int Id)
        {
            var product = await _httpClient.GetAsync("api/Departments/{Id}");
            var response = await product.Content.ReadFromJsonAsync<TblDepartment>();
            return response!;
        }
        async Task<TblDepartment> IDepartmentRepository.UpdateDepartmentAsync(TblDepartment model)
        {
            var product = await _httpClient.PostAsJsonAsync("api/Departments",model);
            var response = await product.Content.ReadFromJsonAsync<TblDepartment>();
            return response!;
        }
      

    }
}
