using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace INAB_SAF
{
    public class Datos
    {
        public static DataTable CreateCommand(string queryString)
        {
            string ConnectionString = "Server=DESKTOP-MRADK6O\\SQLEXPRESS;Database=INAB_SAF;User Id=usuario1;Password=123456;";
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                
                //create data adapter from string with SQL command and SQL Connection object
                SqlDataAdapter da = new SqlDataAdapter(queryString, con);
                //populate DataTable
                da.Fill(dt);
                con.Close();
            }

            return dt;
        }
    }
}