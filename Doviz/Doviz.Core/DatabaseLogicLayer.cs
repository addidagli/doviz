using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Doviz.Core
{
    public class DatabaseLogicLayer:BaseClass
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;

        public DatabaseLogicLayer()
        {
            con = new SqlConnection("data source=.; initial catalog=Doviz");
        }

        public void BaglantiIslemleri()
        {
            if(con.State==System.Data.ConnectionState.Open)
            {
                con.Close();
            }
            else
            {
                con.Open(); 
            }

            
        }
    }
}
