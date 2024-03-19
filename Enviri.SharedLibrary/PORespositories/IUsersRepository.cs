using Enviri.PO.WebUI.Data;
using Enviri.SharedLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Enviri.SharedLibrary.PORespositories
{
    public interface IUsersRepository
    {
        Task<PostResult> AddUsersAsync(TblUser model);
        Task<TblUser> DeleteUsersAsync(int Id);
        Task<List<TblUser>> GetAllUsersAsync();
        Task<TblUser> GetUserByIdAsync(int Id);
    }
}
