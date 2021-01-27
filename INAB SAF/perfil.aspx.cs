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
    public partial class perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (username.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_PerfilInsert", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter nombre = objcmd.Parameters.Add("@nombre", SqlDbType.VarChar);
                    nombre.Value = username.Text;

                    SqlParameter nivel = objcmd.Parameters.Add("@nivel", SqlDbType.VarChar);
                    nivel.Value = DropDownList1.SelectedValue;

                    objcmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                    username.Text = "";
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

        protected void UpdatePerfil(object sender, EventArgs e)
        {
            string id = idPerfilSaf.Text;
            int idPerfil = Int32.Parse(id);
            //ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "alert('"+idPerfil+"');", true);

            
            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (nombreFuente.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_PerfilUpdate", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idPerfil1 = objcmd.Parameters.Add("@idPerfil", SqlDbType.Int);
                    idPerfil1.Value = idPerfil;

                    SqlParameter nombre = objcmd.Parameters.Add("@nombre", SqlDbType.VarChar);
                    nombre.Value = nombreFuente.Text;

                    SqlParameter nivel = objcmd.Parameters.Add("@nivel", SqlDbType.VarChar);
                    string nivelnombre = "";
                    if (nivelFuente.SelectedIndex == 0) {
                        nivelnombre = "Nacional";
                    }else
                    if (nivelFuente.SelectedIndex == 1)
                    {
                        nivelnombre = "Regional";
                    }
                    else
                    if (nivelFuente.SelectedIndex == 2)
                    {
                        nivelnombre = "SubRegional";
                    }
                    nivel.Value = nivelnombre;

                    SqlParameter estado = objcmd.Parameters.Add("@estado", SqlDbType.Int);
                    estado.Value = 1;

                    objcmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                    username.Text = "";
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

        protected void DeletePerfil(object sender, EventArgs e)
        {
            string id = idPerfilSaf1.Text;
            int idPerfil = Int32.Parse(id);
            
            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (idPerfilSaf1.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_PerfilDelete", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idPerfil1 = objcmd.Parameters.Add("@idPerfil", SqlDbType.Int);
                    idPerfil1.Value = idPerfil;                    

                    objcmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                    username.Text = "";
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
            thisCommand.CommandText = "SELECT id, nombre, nivel FROM admin_perfil WHERE estado = 1";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            
            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                string nombre = reader.GetString(1);
                string nivel = reader.GetString(2);
                htmlStr += "<tr><td>" + nombre + "</td><td>" + nivel + "</td><td><input type='button' class='btn btn-primary modificarPerfil' name='modificar' value='Modificar' ID='" + id + "' data-toggle='modal' data-target='#Modificar'></td><td><input type='button' class='btn btn-danger eliminarPerfil' name='eliminar' value='Eliminar' ID='" + id + "' data-toggle='modal' data-target='#Eliminar'></td></tr>";
            }

            thisConnection.Close();
            return htmlStr;
        }

        public void LoadDataUpdate(int id, string nombre, string nivel)
        {
            nombreFuente.Text = nombre;
            nivelFuente.SelectedValue = nivel;
        }

        [WebMethod]
        public static string consultarDatosdePerfil(string id)
        {
            
            string htmlStr1 = "";
            
            int idPerfil;
            string nombre, nivel;
            int idInt = Int32.Parse(id);
            htmlStr1 = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection thisConnection = new SqlConnection(htmlStr1);

            SqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "SELECT id, nombre, nivel FROM admin_perfil WHERE estado = 1 AND id = " + idInt + "";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            string json = "";
            while (reader.Read())
            {
                idPerfil = reader.GetInt32(0);
                nombre = reader.GetString(1);
                nivel = reader.GetString(2);
                var chk = new datosPerfil
                {
                    idPerfil = idPerfil,
                    nombre = nombre,
                    nivel = nivel
                };
                json =  JsonConvert.SerializeObject(chk);
            }
            return json;
        }

        public class datosPerfil
        {
            public int idPerfil { get; set; }
            public string nombre { get; set; }
            public string nivel { get; set; }
        }
    }
}