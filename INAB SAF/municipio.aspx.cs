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
    public partial class municipio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtError.Text = "";
                CargarInformacionddlIdDepartamento();
            }
        }

        protected void CargarInformacionddlIdDepartamento()
        {
            try
            {
                DataTable dataTable = Datos.CreateCommand("select id, nombre from admin_departamento where estado = 1");

                if (dataTable != null)
                {
                    if (dataTable.Rows.Count > 0)
                    {
                        ddlIdDepartamentoMun.DataSource = dataTable;
                        ddlIdDepartamentoMun.DataTextField = "nombre";
                        ddlIdDepartamentoMun.DataValueField = "id";
                        ddlIdDepartamentoMun.DataBind();

                        ddlIdDepartamentoModMun.DataSource = dataTable;
                        ddlIdDepartamentoModMun.DataTextField = "nombre";
                        ddlIdDepartamentoModMun.DataValueField = "id";
                        ddlIdDepartamentoModMun.DataBind();
                    }
                    else
                    {
                        txtError.Text = "No se pudieron obtener los departamentos";
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                }
                else
                {
                    txtError.Text = "No se pudieron obtener los departamentos";
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                }
            }
            catch (Exception ex)
            {
                string error = "Ocurrio un error, refresque la pagina por favor y vuelva a intentarlo";
                txtError.Text = error;
                Response.Write(ex.Message.ToString());
                ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
            }
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
                if (txtNombreMun.Text != "" && txtCodigoMun.Text != "" && ddlIdDepartamentoMun.SelectedIndex >= 0)
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_insertar_municipio", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter nombre = objcmd.Parameters.Add("@nombre", SqlDbType.VarChar);
                    nombre.Value = txtNombreMun.Text;

                    SqlParameter codigo = objcmd.Parameters.Add("@codigo", SqlDbType.VarChar);
                    codigo.Value = txtCodigoMun.Text;

                    SqlParameter departamento = objcmd.Parameters.Add("@departamento", SqlDbType.Int);
                    departamento.Value = ddlIdDepartamentoMun.SelectedValue.ToString();

                    SqlParameter usuario = objcmd.Parameters.Add("@usuario", SqlDbType.Int);
                    usuario.Value = user;

                    SqlParameter modulo = objcmd.Parameters.Add("@modulo", SqlDbType.VarChar);
                    modulo.Value = module;

                    SqlParameter inserto = objcmd.Parameters.Add("@inserto", SqlDbType.VarChar, 500);
                    inserto.Direction = ParameterDirection.Output;

                    objcmd.ExecuteNonQuery();


                    string result = (string)objcmd.Parameters["@inserto"].Value;

                    if (result == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                        txtNombreMun.Text = "";
                        txtCodigoMun.Text = "";
                        ddlIdDepartamentoMun.SelectedIndex = 0;
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
            thisCommand.CommandText = "select M.id, M.codigo, M.nombre, D.nombre FROM admin_municipio M "
                                    + "INNER JOIN admin_departamento D on D.id = M.id_departamento AND D.estado = 1 "
                                    + "WHERE M.Estado = 1 ";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                int idMunicipio = reader.GetInt32(0);
                string codigo = reader.GetString(1);
                string nombre = reader.GetString(2);
                string departamento = reader.GetString(3);
                htmlStr += "<tr><td>" + codigo + "</td><td>" + nombre + "</td><td>" + departamento + "</td><td><input type='button' class='btn btn-primary modificarMunicipio' name='modificar' value='Modificar' ID='" + idMunicipio + "' data-toggle='modal' data-target='#Modificar'></td><td><input type='button' class='btn btn-danger eliminarMunicipio' name='eliminar' value='Eliminar' ID='" + idMunicipio + "' data-toggle='modal' data-target='#Eliminar'></td></tr>";
            }

            thisConnection.Close();
            return htmlStr;
        }

        public void LoadDataUpdate(int id, string nombre, string codigo, string departamento)
        {
            txtNombreModMun.Text = nombre;
            txtCodigoModMun.Text = codigo;
            ddlIdDepartamentoMun.SelectedValue = departamento;
        }

        [WebMethod]
        public static string consultarDatosdeMunicipio(string id)
        {

            string htmlStr1 = "";

            int idMunicipio;
            string nombre, codigo, nombreDepartamento;
            int idDepartamento;
            int idInt = Int32.Parse(id);
            htmlStr1 = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection thisConnection = new SqlConnection(htmlStr1);

            SqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "select M.id, D.nombre as NombreDepartamento, M.codigo, M.nombre as NombreMunicipio, D.id as idDepartamento FROM admin_municipio M "
                                    + "INNER JOIN admin_departamento D on D.id = M.id_departamento AND D.estado = 1 "
                                    + "WHERE M.Estado = 1 AND M.id = " + idInt + " ";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            string json = "";
            while (reader.Read())
            {
                idMunicipio = reader.GetInt32(0);
                nombreDepartamento = reader.GetString(1);
                codigo = reader.GetString(2);
                nombre = reader.GetString(3);
                idDepartamento = reader.GetInt32(4);
                var chk = new datosMunicipio
                {
                    idMunicipio = idMunicipio,
                    nombre = nombre,
                    codigo = codigo,
                    NombreDepartamento = nombreDepartamento,
                    idDepartamento = idDepartamento
                };
                json = JsonConvert.SerializeObject(chk);
            }
            return json;
        }

        public class datosMunicipio
        {
            public int idMunicipio { get; set; }
            public string nombre { get; set; }
            public string codigo { get; set; }
            public int idDepartamento { get; set; }
            public string NombreDepartamento { get; set; }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string id = txtIdMunicipioModMun.Text;
            int idMunicipio = Int32.Parse(id);
            int user = Convert.ToInt32(Session["idUsuario"].ToString());
            string module = "administrativo";
            string mensaje = "";
            //ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "alert('"+idPerfil+"');", true);


            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (txtNombreModMun.Text != "" && txtCodigoModMun.Text != "" && ddlIdDepartamentoModMun.SelectedIndex >= 0)
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_actualizar_municipio", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idMunicipio1 = objcmd.Parameters.Add("@id_municipio", SqlDbType.Int);
                    idMunicipio1.Value = idMunicipio;

                    SqlParameter nombre = objcmd.Parameters.Add("@nombre", SqlDbType.VarChar);
                    nombre.Value = txtNombreModMun.Text;

                    SqlParameter codigo = objcmd.Parameters.Add("@codigo", SqlDbType.VarChar);
                    codigo.Value = txtCodigoModMun.Text;

                    SqlParameter departamento = objcmd.Parameters.Add("@departamento", SqlDbType.Int);
                    departamento.Value = Convert.ToInt32(ddlIdDepartamentoModMun.SelectedValue);

                    SqlParameter usuario = objcmd.Parameters.Add("@usuario", SqlDbType.Int);
                    usuario.Value = user;

                    SqlParameter modulo = objcmd.Parameters.Add("@modulo", SqlDbType.VarChar);
                    modulo.Value = module;

                    SqlParameter modifico = objcmd.Parameters.Add("@actualizo", SqlDbType.VarChar, 500);
                    modifico.Direction = ParameterDirection.Output;

                    objcmd.ExecuteNonQuery();

                    string result = objcmd.Parameters["@actualizo"].Value.ToString();

                    if (result == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                        txtNombreModMun.Text = "";
                        txtCodigoModMun.Text = "";
                        ddlIdDepartamentoModMun.SelectedIndex = 0;
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
            string id = txtIdMunicipioElMun.Text;
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
                if (txtIdMunicipioElMun.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_eliminar_municipio", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idMunicipio1 = objcmd.Parameters.Add("@id_municipio", SqlDbType.Int);
                    idMunicipio1.Value = idRegion;

                    SqlParameter usuario = objcmd.Parameters.Add("@usuario", SqlDbType.Int);
                    usuario.Value = user;

                    SqlParameter modulo = objcmd.Parameters.Add("@modulo", SqlDbType.VarChar);
                    modulo.Value = module;

                    SqlParameter estado1 = objcmd.Parameters.Add("@estado", SqlDbType.Bit);
                    estado1.Value = estado;

                    SqlParameter elimino = objcmd.Parameters.Add("@elimino", SqlDbType.VarChar, 500);
                    elimino.Direction = ParameterDirection.Output;

                    objcmd.ExecuteNonQuery();

                    string result = objcmd.Parameters["@elimino"].Value.ToString();

                    if (result == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                        lblNombreElMun.Text = "";
                        lblCodigoElMun.Text = "";
                        lblIdDepartamentoElMun.Text = "";
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