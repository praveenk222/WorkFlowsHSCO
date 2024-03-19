using Enviri.SharedLibrary.PORespositories;
using Microsoft.EntityFrameworkCore;
using Enviri.PO.WebUI;
using System;
using Enviri.SharedLibrary.Models;
using Enviri.PO.WebUI.Data;
using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;

namespace Enviri.PO.WebUI.Implementations
{
    public class UsersRepository : IUsersRepository
    {
        private readonly POContext _poContext;
        //public IDapperDbConnection _dapperDbConnection;
        private readonly string _connectionString;
        private readonly IConfiguration _configuration;
        public UsersRepository(IConfiguration configuration)
        {
            _poContext = new POContext();
            //_dapperDbConnection = dapperDbConnection;
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("Harsco.HTS.connectionString");
        }
        
      async  Task<PostResult> IUsersRepository.AddUsersAsync(TblUser model)
        {
            if (model == null) return null!;
            using (var connection = new SqlConnection(_connectionString))
            {
                //model. = DateTime.Now;

                var parameters = new
                {
                    model.EntryId,
                    model.UserLname,
                    model.UserFname,
                    model.UserMname,
                    model.UserApprover,
                    model.UserAdmin,
                    model.UserPreparer,
                    model.UserEmail,
                    model.UserTitle,
                    model.CountryCode,
                    model.DivisionId,
                    model.UserId,
                    model.SiteLocation,
                    model.Created,
                    model.Modified,
                };

                return await connection.QueryFirstOrDefaultAsync<PostResult>("USP_SaveUserss", parameters, commandType: CommandType.StoredProcedure);
            }
        }

      

        

     
     

        Task<TblUser> IUsersRepository.DeleteUsersAsync(int Id)
        {
            throw new NotImplementedException();
        }

       async Task<List<TblUser>> IUsersRepository.GetAllUsersAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                return (await connection.QueryAsync<TblUser>("SELECT * FROM [tbl_User]")).ToList();
            }
        }

      async  Task<TblUser> IUsersRepository.GetUserByIdAsync(int Id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                return (await connection.QueryAsync<TblUser>("SELECT * FROM [tbl_User]")).FirstOrDefault();
            }
        }
    }
}
