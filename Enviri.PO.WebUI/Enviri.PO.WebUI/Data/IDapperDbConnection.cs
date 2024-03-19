using System.Data;

namespace Enviri.PO.WebUI.Data
{
    public interface IDapperDbConnection
    {
        public IDbConnection CreateConnection();
    }
}
