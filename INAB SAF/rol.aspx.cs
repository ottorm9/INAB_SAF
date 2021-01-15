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
    public partial class rol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertRol(object sender, EventArgs e)
        {

            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            
            try
            {
                if (NombreRol.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_RolInsert", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter nombre = objcmd.Parameters.Add("@nombre", SqlDbType.VarChar);
                    nombre.Value = NombreRol.Text;

                    objcmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                    NombreRol.Text = "";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "FaltaDato", "FaltaDato();", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
                ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar();", true);
            }
            finally
            {
                objsqlconn.Close();
            }

        }

        protected void UpdateRol(object sender, EventArgs e)
        {
            string id = idRolSaf.Text;
            int idRol = Int32.Parse(id);
            //ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "alert('"+idPerfil+"');", true);


            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (nombreRol1.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_RolUpdate", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idPerfil1 = objcmd.Parameters.Add("@idPerfil", SqlDbType.Int);
                    idPerfil1.Value = idRol;

                    SqlParameter nombre = objcmd.Parameters.Add("@nombre", SqlDbType.VarChar);
                    nombre.Value = nombreRol1.Text;

                    objcmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                    nombreRol1.Text = "";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "FaltaDato", "FaltaDato();", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
                ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar();", true);
            }
            finally
            {
                objsqlconn.Close();
            }

        }




        protected void DeleteRol(object sender, EventArgs e)
        {
            string id = idRol1.Text;
            int idRol = Int32.Parse(id);

            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (idRol1.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_RolDelete", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idRol1 = objcmd.Parameters.Add("@idRol", SqlDbType.Int);
                    idRol1.Value = idRol;

                    objcmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                    //username.Text = "";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "FaltaDato", "FaltaDato();", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
                ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar();", true);
            }
            finally
            {
                objsqlconn.Close();
            }

        }

        public string getWhileLoopData()
        {

            string htmlStr = "";
            string htmlStr1 = "";
            htmlStr1 = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection thisConnection = new SqlConnection(htmlStr1);

            SqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "SELECT id, nombre FROM admin_rol WHERE estado = 1";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                string nombre = reader.GetString(1);
                htmlStr += "<tr><td>" + nombre + "</td><td><input type='button' class='btn btn-primary modificar' name='modificar' value='Modificar' ID='" + id + "' data-toggle='modal' data-target='#Modificar'></td><td><input type='button' class='btn btn-danger eliminar' name='eliminar' value='Eliminar' ID='" + id + "' data-toggle='modal' data-target='#Eliminar'></td></tr>";
            }

            thisConnection.Close();
            return htmlStr;
        }



        [WebMethod]
        public static string consultarDatosdeRol(string id)
        {

            string htmlStr1 = "";

            int idRol;
            string nombre;
            int idInt = Int32.Parse(id);
            htmlStr1 = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection thisConnection = new SqlConnection(htmlStr1);

            SqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "SELECT id, nombre FROM admin_rol WHERE estado = 1 AND id = " + idInt + "";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            string json = "";
            while (reader.Read())
            {
                idRol = reader.GetInt32(0);
                nombre = reader.GetString(1);
                var chk1 = new datosRol
                {
                    idRol = idRol,
                    nombre = nombre
                };
                json = JsonConvert.SerializeObject(chk1);
            }
            return json;
        }

        public class datosRol
        {
            public int idRol { get; set; }
            public string nombre { get; set; }
        }
    }
}