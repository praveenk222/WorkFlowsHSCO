using Enviri.PO.WebUI;
using Enviri.PO.WebUI.Data;
using Enviri.SharedLibrary.Models;
using Enviri.SharedLibrary.PORespositories;
using System.Net.Http.Json;

namespace Enviri.PO.WebUI.Client.Services
{
    public class UserMasterService : IUsersRepository
    {
        private readonly HttpClient _httpClient;

        public UserMasterService()
        {
            _httpClient = new HttpClient();
        }
        async Task<PostResult> IUsersRepository.AddUsersAsync(TblUser model)
        {
            var data = await _httpClient.PostAsJsonAsync("http://localhost:5244/api/UserMaster", model);
            var response=await data.Content.ReadFromJsonAsync<PostResult>();
            return response!;
        }

      

        async Task<TblUser> IUsersRepository.DeleteUsersAsync(int Id)
        {
            var data = await _httpClient.DeleteAsync($"http://localhost:5244/api/UserMaster/{Id}");
            var response = await data.Content.ReadFromJsonAsync<TblUser>();
            return response!;
        }

      

   

       async Task<List<TblUser>> IUsersRepository.GetAllUsersAsync()
        {
            var data = await _httpClient.GetAsync("http://localhost:5244/api/UserMaster/{Id}");
            var response = await data.Content.ReadFromJsonAsync<List<TblUser>>();
            return response!;
        }

        async Task<TblUser> IUsersRepository.GetUserByIdAsync(int Id)
        {
            var data = await _httpClient.GetAsync("http://localhost:5244/api/UserMaster/{Id}");
            var response = await data.Content.ReadFromJsonAsync<TblUser>();
            return response!;
        }

  

  

       
    }
}
