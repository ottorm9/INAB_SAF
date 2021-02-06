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
    public partial class region : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtError.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int user = Convert.ToInt32(Session["idUsuario"].ToString());
            string module = "administrativo";
            string mensaje = "";

            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (txtNombreReg.Text != "" && txtCodigoReg.Text != "" && txtActividadReg.Text != "" && txtJerarquiaReg.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_insertar_region", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter nombre = objcmd.Parameters.Add("@region", SqlDbType.VarChar);
                    nombre.Value = txtNombreReg.Text;

                    SqlParameter codigo = objcmd.Parameters.Add("@no_region", SqlDbType.VarChar);
                    codigo.Value = txtCodigoReg.Text;

                    SqlParameter tipo = objcmd.Parameters.Add("@tipo", SqlDbType.VarChar);
                    tipo.Value = DropDownList1Reg.SelectedValue.ToString();

                    SqlParameter actividad = objcmd.Parameters.Add("@actividad", SqlDbType.VarChar);
                    actividad.Value = txtActividadReg.Text;

                    SqlParameter jerarquia = objcmd.Parameters.Add("@jerarquia", SqlDbType.Int);
                    jerarquia.Value = txtJerarquiaReg.Text;

                    SqlParameter usuario = objcmd.Parameters.Add("@usuario", SqlDbType.Int);
                    usuario.Value = user;

                    SqlParameter modulo = objcmd.Parameters.Add("@modulo", SqlDbType.VarChar);
                    modulo.Value = module;

                    SqlParameter inserto = objcmd.Parameters.Add("@inserto", SqlDbType.VarChar, 500);
                    inserto.Direction = ParameterDirection.Output;

                    objcmd.ExecuteNonQuery();


                    string result = (string) objcmd.Parameters["@inserto"].Value;

                    if (result == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                        txtNombreReg.Text = "";
                        txtCodigoReg.Text = "";
                        txtActividadReg.Text = "";
                        txtJerarquiaReg.Text = "";
                        DropDownList1Reg.SelectedIndex = 0;
                        txtError.Text = "";
                    }
                    else
                    {
                        txtError.Text = result;
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                    
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "FaltaDato", "FaltaDato();", true);
                }
            }
            catch (Exception ex)
            {
                string error = "Ocurrio un error, refresque la pagina por favor y vuelva a intentarlo";
                txtError.Text = error;
                Response.Write(ex.Message.ToString());
                ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
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
            thisCommand.CommandText = "SELECT id, nombre, codigo_region, tipo, actividad, jerarquia FROM admin_region WHERE estado = 1";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                int idRegion = reader.GetInt32(0);
                string nombre = reader.GetString(1);
                string codigo = reader.GetString(2);
                string tipo = reader.GetString(3);
                string actividad = reader.GetString(4);
                int jerarquia = reader.GetInt32(5);
                htmlStr += "<tr><td>" + codigo + "</td><td>" + nombre + "</td><td>" + tipo + "</td><td>" + actividad + "</td><td>" + jerarquia + "</td><td><input type='button' class='btn btn-primary modificarRegion' name='modificar' value='Modificar' ID='" + idRegion + "' data-toggle='modal' data-target='#Modificar'></td><td><input type='button' class='btn btn-danger eliminarRegion' name='eliminar' value='Eliminar' ID='" + idRegion + "' data-toggle='modal' data-target='#Eliminar'></td></tr>";
            }

            thisConnection.Close();
            return htmlStr;
        }

        public void LoadDataUpdate(int id, string nombre, string codigo, string tipo, string actividad, string jerarquia)
        {
            txtNombreModReg.Text = nombre;
            txtCodigoModReg.Text = codigo;
            ddlTipoModReg.SelectedItem.Text = tipo;
            txtActividadModReg.Text = actividad;
            txtJerarquiaModReg.Text = jerarquia;
        }

        [WebMethod]
        public static string consultarDatosdeRegion(string id)
        {

            string htmlStr1 = "";

            int idRegion;
            string nombre, codigo, tipo, actividad;
            int jerarquia;
            int idInt = Int32.Parse(id);
            htmlStr1 = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection thisConnection = new SqlConnection(htmlStr1);

            SqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "SELECT id, nombre, codigo_region, tipo, actividad, jerarquia FROM admin_region WHERE estado = 1 AND id = " + idInt + "";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            string json = "";
            while (reader.Read())
            {
                idRegion = reader.GetInt32(0);
                nombre = reader.GetString(1);
                codigo = reader.GetString(2);
                tipo = reader.GetString(3);
                actividad = reader.GetString(4);
                jerarquia = reader.GetInt32(5);
                var chk = new datosRegion
                {
                    idRegion = idRegion,
                    nombre = nombre,
                    codigo = codigo,
                    tipo = tipo,
                    actividad = actividad,
                    jerarquia = jerarquia
                };
                json = JsonConvert.SerializeObject(chk);
            }
            return json;
        }

        public class datosRegion
        {
            public int idRegion { get; set; }
            public string nombre { get; set; }
            public string codigo { get; set; }
            public string tipo { get; set; }
            public string actividad { get; set; }
            public int jerarquia { get; set; }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string id = txtidRegionModReg.Text;
            int idRegion = Int32.Parse(id);
            int user = Convert.ToInt32(Session["idUsuario"].ToString());
            string module = "administrativo";
            string mensaje = "";
            //ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "alert('"+idPerfil+"');", true);


            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (txtNombreModReg.Text != "" && txtCodigoModReg.Text != "" && txtActividadModReg.Text != "" && txtJerarquiaModReg.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_actualizar_region", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idRegion1 = objcmd.Parameters.Add("@id_region", SqlDbType.Int);
                    idRegion1.Value = idRegion;

                    SqlParameter nombre = objcmd.Parameters.Add("@region", SqlDbType.VarChar);
                    nombre.Value = txtNombreModReg.Text;

                    SqlParameter codigo = objcmd.Parameters.Add("@no_region", SqlDbType.VarChar);
                    codigo.Value = txtCodigoModReg.Text;

                    SqlParameter tipo = objcmd.Parameters.Add("@tipo", SqlDbType.VarChar);
                    tipo.Value = ddlTipoModReg.SelectedItem.Text;

                    SqlParameter actividad = objcmd.Parameters.Add("@actividad", SqlDbType.VarChar);
                    actividad.Value = txtActividadModReg.Text;

                    SqlParameter jerarquia = objcmd.Parameters.Add("@jerarquia", SqlDbType.Int);
                    jerarquia.Value = txtJerarquiaModReg.Text;

                    SqlParameter usuario = objcmd.Parameters.Add("@usuario", SqlDbType.Int);
                    usuario.Value = user;

                    SqlParameter modulo = objcmd.Parameters.Add("@modulo", SqlDbType.VarChar);
                    modulo.Value = module;

                    SqlParameter modifico = objcmd.Parameters.Add("@actualizo", SqlDbType.VarChar,500);
                    modifico.Direction = ParameterDirection.Output;

                    objcmd.ExecuteNonQuery();

                    string result = objcmd.Parameters["@actualizo"].Value.ToString();

                    if (result == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                        txtNombreModReg.Text = "";
                        txtCodigoModReg.Text = "";
                        txtActividadModReg.Text = "";
                        txtJerarquiaModReg.Text = "";
                        ddlTipoModReg.SelectedIndex = 0;
                        txtError.Text = "";
                    }
                    else
                    {
                        txtError.Text = result;
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "FaltaDato", "FaltaDato();", true);
                }
            }
            catch (Exception ex)
            {
                string error = "Ocurrio un error, refresque la pagina por favor y vuelva a intentarlo";
                txtError.Text = error;
                Response.Write(ex.Message.ToString());
                ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
            }
            finally
            {
                objsqlconn.Close();
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string id = txtidRegionElReg.Text;
            int idRegion = Int32.Parse(id);
            int user = Convert.ToInt32(Session["idUsuario"].ToString());
            string module = "administrativo";
            string mensaje = "";
            int estado = 0;

            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (txtidRegionElReg.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_eliminar_region", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idRegion1 = objcmd.Parameters.Add("@id_region", SqlDbType.Int);
                    idRegion1.Value = idRegion;

                    SqlParameter usuario = objcmd.Parameters.Add("@usuario", SqlDbType.Int);
                    usuario.Value = user;

                    SqlParameter modulo = objcmd.Parameters.Add("@modulo", SqlDbType.VarChar);
                    modulo.Value = module;

                    SqlParameter estado1 = objcmd.Parameters.Add("@estado", SqlDbType.Bit);
                    estado1.Value = estado;

                    SqlParameter elimino = objcmd.Parameters.Add("@elimino", SqlDbType.VarChar,500);
                    elimino.Direction = ParameterDirection.Output;

                    objcmd.ExecuteNonQuery();

                    string result = objcmd.Parameters["@elimino"].Value.ToString();

                    if (result == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                        lblNombreElReg.Text = "";
                        lblCodigoElReg.Text = "";
                        lblTipoElReg.Text = "";
                        lblActividadElReg.Text = "";
                        lblJerarquiaElReg.Text = "";
                        txtError.Text = "";
                    }
                    else
                    {
                        txtError.Text = result;
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "FaltaDato", "FaltaDato();", true);
                }
            }
            catch (Exception ex)
            {
                string error = "Ocurrio un error, refresque la pagina por favor y vuelva a intentarlo";
                txtError.Text = error;
                Response.Write(ex.Message.ToString());
                ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
            }
            finally
            {
                objsqlconn.Close();
            }
        }
    }
}