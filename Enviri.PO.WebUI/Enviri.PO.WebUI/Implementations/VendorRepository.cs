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
    public class VendorRepository : IVendorRepository
    {
        private readonly POContext _poContext;
        //public IDapperDbConnection _dapperDbConnection;
        private readonly string _connectionString;
        private readonly IConfiguration _configuration;
        public VendorRepository(IConfiguration configuration)
        {
            _poContext = new POContext();
            //_dapperDbConnection = dapperDbConnection;
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("Harsco.HTS.connectionString");
        }
         async Task<List<TblVendor>> IVendorRepository.GetAllVendorsAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                return (await connection.QueryAsync<TblVendor>("SELECT * FROM [tbl_Vendors]")).ToList();
            }
        }
        //Task<PostResult> IVendorRepository.AddVendorAsync(TblVendor model)
        //{
        //    if (model == null) return null!;
        //    //var newDataAdded = _poContext.TblVendors.Add(model).Entity;
        //    var newDataAdded =  _poContext.PostResults.FromSqlRaw("USP_SaveVendors {0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13}",
        //        model.Id, model.Name, model.Number, model.Address1, model.Address2, model.Address3, model.Address4, model.City, model.State, model.Zip, model.PaymentTermsId,
        //        model.IsDeleted,model.CreatedBy,model.ModifiedBy).FirstOrDefaultAsync();

        //    return newDataAdded;

        //}
        async Task<PostResult>  IVendorRepository.AddVendorAsync(TblVendor model)
        {
            if (model == null) return null!;
            using (var connection = new SqlConnection(_connectionString))
            {
                model.CreatedOn=DateTime.Now;
                model.ModifiedOn = DateTime.Now;
                model.CreatedBy = "pkadma";
                model.ModifiedBy = "pkadma";

                var parameters = new
                {
                    model.Id,
                    model.Name,
                    model.Number,
                    model.Address1,
                    model.Address2,
                    model.Address3,
                    model.Address4,
                    model.City,
                    model.State,
                    model.Zip,
                    model.PaymentTermsId,
                   model.IsDeleted,model.CreatedBy,model.ModifiedBy
                };

                return await connection.QueryFirstOrDefaultAsync<PostResult>("USP_SaveVendors", parameters, commandType: CommandType.StoredProcedure);
            }


        }

        async Task<TblVendor> IVendorRepository.DeleteVendorAsync(int Id)
        {
           var data=await _poContext.TblVendors.FirstOrDefaultAsync(x => x.Id == Id);
            if (data is null) return null!;
            _poContext.TblVendors.Remove(data);
            await _poContext.SaveChangesAsync();
            return data;
        }

        //async Task<List<TblVendor>> IVendorRepository.GetAllVendorsAsync()
        //{
        //    //TblVendor tbl=await _poContext.TblVendors.Include(c=>c.)
        //   return await _poContext.TblVendors.ToListAsync();
        //}

        async Task<TblVendor> IVendorRepository.GetVendorByIdAsync(int Id)
        {
            var data = await _poContext.TblVendors.FirstOrDefaultAsync(x=>x.Id==Id);
            if(data is null) return null!;
            return data;
        }

        async Task<TblVendor> IVendorRepository.UpdateVendorAsync(TblVendor model)
        {
            if(model.Id > 0)
            {
                var data = await _poContext.TblVendors.FirstOrDefaultAsync(x => x.Id == model.Id);
                if (data is null) return null!;
            }
            else
            {
                if (model == null) return null!;
                var newDataAdded = _poContext.TblVendors.Add(model).Entity;
            }

            await _poContext.SaveChangesAsync();
            return await _poContext.TblVendors.FirstOrDefaultAsync(x => x.Id == model.Id)!;
        }
    }
}
