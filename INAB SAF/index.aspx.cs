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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            var key = "b99ca2210a8e7548yghe6ld9748b8154";
            int id, cant;
            string conn, nombre, usuario = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            //Enviar valor encriptar = 1 para encriptar y valor 0 si necesita desencriptar
            string ContraseniaEncrypt = "";
            try
            {
                if (email.Text != "" && password.Text != "")
                {
                    ContraseniaEncrypt = AesOperation.EncryptString(key, password.Text);
                    SqlConnection thisConnection = new SqlConnection(conn);
                    SqlCommand thisCommand = thisConnection.CreateCommand();
                    thisCommand.CommandText = "SELECT id, nombre, usuario, count(*) cant FROM admin_usuario WHERE usuario = '"+ email.Text +"' AND contrasenia = '" + ContraseniaEncrypt + "' AND estado = 1 GROUP BY id, nombre, usuario";
                    thisConnection.Open();
                    SqlDataReader reader = thisCommand.ExecuteReader();
                    while (reader.Read())
                    {
                        id = reader.GetInt32(0);
                        cant = reader.GetInt32(3);
                        nombre = reader.GetString(1);
                        usuario = reader.GetString(2);
                        if (cant > 0)
                        {
                            Session["idUsuario"] = id;
                            Session["nombre"] = nombre;
                            Session["usuario"] = usuario;
                            Session["autenticacion"] = true;
                            Response.Redirect("home.aspx");
                        }
                        else if(cant == 0) {
                            ScriptManager.RegisterStartupScript(this, GetType(), "datoIncorrecto", "datoIncorrecto();", true);
                        }
                    }
                    
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "FaltaDato", "FaltaDato();", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
                ScriptManager.RegisterStartupScript(this, GetType(), "faltadato", "FaltaDato();", true);
            }
            finally
            {
                objsqlconn.Close();
            }

            
        }
    }
}