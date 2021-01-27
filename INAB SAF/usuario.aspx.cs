using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;
using System.Threading;
using System.Web.Services;
using Newtonsoft.Json;

namespace INAB_SAF
{
    public partial class usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string htmlStr1 = "";
            htmlStr1 = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection thisConnection = new SqlConnection(htmlStr1);

            SqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "SELECT id, nombre FROM admin_etnia WHERE estado = 1";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                string idetinia = id.ToString();
                string nombre = reader.GetString(1);
                ListItem lst2 = new ListItem(nombre, idetinia);
                etnia.Items.Insert(etnia.Items.Count, lst2);
            }
            thisConnection.Close();


            SqlConnection thisConnection1 = new SqlConnection(htmlStr1);
            SqlCommand thisCommand1 = thisConnection1.CreateCommand();
            thisCommand1.CommandText = "SELECT id, nombre FROM admin_idioma WHERE estado = 1";
            thisConnection1.Open();
            SqlDataReader reader1 = thisCommand1.ExecuteReader();

            while (reader1.Read())
            {
                int id = reader1.GetInt32(0);
                string ididioma = id.ToString();
                string nombre = reader1.GetString(1);
                ListItem lst3 = new ListItem(nombre, ididioma);
                idioma.Items.Insert(idioma.Items.Count, lst3);
            }
            thisConnection1.Close();
        }

        
    }
}