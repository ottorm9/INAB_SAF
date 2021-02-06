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
    public partial class subregion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtError.Text = "";
                CargarInformacionddlIdMunicipio();
                CargarInformacionddlIdRegion();
            }
        }

        protected void CargarInformacionddlIdRegion()
        {
            try
            {
                DataTable dataTable = Datos.CreateCommand("select id, nombre from admin_region where estado = 1");

                if(dataTable != null)
                {
                    if(dataTable.Rows.Count > 0)
                    {
                        ddlIdRegionSub.DataSource = dataTable;
                        ddlIdRegionSub.DataTextField = "nombre";
                        ddlIdRegionSub.DataValueField = "id";
                        ddlIdRegionSub.DataBind();

                        ddlIdRegionModSub.DataSource = dataTable;
                        ddlIdRegionModSub.DataTextField = "nombre";
                        ddlIdRegionModSub.DataValueField = "id";
                        ddlIdRegionModSub.DataBind();
                    }
                    else
                    {
                        txtError.Text = "No se pudieron obtener las regiones";
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                }
                else
                {
                    txtError.Text = "No se pudieron obtener las regiones";
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

        protected void CargarInformacionddlIdMunicipio()
        {
            try
            {
                DataTable dataTable = Datos.CreateCommand("select id, nombre from admin_municipio where estado = 1");

                if (dataTable != null)
                {
                    if (dataTable.Rows.Count > 0)
                    {
                        ddlIdMunicipioSub.DataSource = dataTable;
                        ddlIdMunicipioSub.DataTextField = "nombre";
                        ddlIdMunicipioSub.DataValueField = "id";
                        ddlIdMunicipioSub.DataBind();

                        ddlIdMunicipioModSub.DataSource = dataTable;
                        ddlIdMunicipioModSub.DataTextField = "nombre";
                        ddlIdMunicipioModSub.DataValueField = "id";
                        ddlIdMunicipioModSub.DataBind();
                    }
                    else
                    {
                        txtError.Text = "No se pudieron obtener los municipios";
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                }
                else
                {
                    txtError.Text = "No se pudieron obtener los municipios";
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


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int user = Convert.ToInt32(Session["idUsuario"].ToString());
            string module = "administrativo";
            string mensaje = "";

            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (txtNombreSub.Text != "" && txtCodigoSub.Text != "" && ddlTipoSub.SelectedIndex >= 0 && ddlIdRegionSub.SelectedIndex >= 0 && ddlIdMunicipioSub.SelectedIndex >= 0 )
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_insertar_subregion", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter id_Region = objcmd.Parameters.Add("@id_region", SqlDbType.Int);
                    id_Region.Value = Convert.ToInt32(ddlIdRegionSub.SelectedValue);

                    SqlParameter id_Municipio = objcmd.Parameters.Add("@id_municipio", SqlDbType.Int);
                    id_Municipio.Value = Convert.ToInt32(ddlIdMunicipioSub.SelectedValue);

                    SqlParameter nombre = objcmd.Parameters.Add("@subregion", SqlDbType.VarChar);
                    nombre.Value = txtNombreSub.Text;

                    SqlParameter codigo = objcmd.Parameters.Add("@no_subregion", SqlDbType.VarChar);
                    codigo.Value = txtCodigoSub.Text;

                    SqlParameter tipo = objcmd.Parameters.Add("@tipo", SqlDbType.VarChar);
                    tipo.Value = ddlTipoSub.SelectedValue.ToString();

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
                        txtNombreSub.Text = "";
                        txtCodigoSub.Text = "";
                        ddlIdRegionSub.SelectedIndex = 0;
                        ddlIdMunicipioSub.SelectedIndex = 0;
                        ddlTipoSub.SelectedIndex = 0;
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
            thisCommand.CommandText = "SELECT S.id, R.nombre as id_region, M.nombre as id_municipio, D.nombre as id_departamento, S.nombre, S.no_subregion, S.tipo "
                                    + "FROM admin_subregion S "
                                    + "inner join admin_region R ON R.id = S.id_region AND R.estado = 1 "
                                    + "inner join admin_municipio M ON M.id = S.id_municipio AND M.estado = 1 "
                                    + "inner join admin_departamento D ON D.id = S.id_departamento AND D.estado = 1 "
                                    + "WHERE S.estado = 1 ";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                int idSubregion = reader.GetInt32(0);
                string idRegion = reader.GetString(1);
                string idMunicipio = reader.GetString(2);
                string idDepartamento = reader.GetString(3);
                string nombre = reader.GetString(4);
                string codigo = reader.GetString(5);
                string tipo = reader.GetString(6);
                htmlStr += "<tr><td>" + idRegion + "</td><td>" + idMunicipio + "</td><td>" + idDepartamento + "</td><td>" + nombre + "</td><td>" + codigo + "</td><td>" + tipo + "</td><td><input type='button' class='btn btn-primary modificarSubregion' name='modificar' value='Modificar' ID='" + idSubregion + "' data-toggle='modal' data-target='#Modificar'></td><td><input type='button' class='btn btn-danger eliminarSubregion' name='eliminar' value='Eliminar' ID='" + idSubregion + "' data-toggle='modal' data-target='#Eliminar'></td></tr>";
            }

            thisConnection.Close();
            return htmlStr;
        }

        public void LoadDataUpdate(int id, string idRegion, string idMunicipio, string nombre, string codigo, string tipo, string actividad, string jerarquia)
        {
            ddlIdRegionModSub.SelectedValue = idRegion;
            ddlIdMunicipioModSub.SelectedValue = idMunicipio;
            txtNombreModSub.Text = nombre;
            txtCodigoModSub.Text = codigo;
            ddlTipoModSub.SelectedItem.Text = tipo;
        }

        [WebMethod]
        public static string consultarDatosdeSubRegion(string id)
        {

            string htmlStr1 = "";

            int idSubregion, idRegion, idMunicipio, idDepartamento;
            string nombre, codigo, tipo, NombreRegion, NombreMunicipio, NombreDepartamento;
            int idInt = Int32.Parse(id);
            htmlStr1 = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection thisConnection = new SqlConnection(htmlStr1);

            SqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "SELECT S.id, S.id_region, S.id_municipio, S.id_Departamento, S.nombre, S.no_subregion, S.tipo, R.nombre as nombre_region, M.nombre as nombre_municipio, D.nombre as nombre_departamento "
                                    + "FROM admin_subregion S "
                                    + "inner join admin_region R ON R.id = S.id_region "
                                    + "inner join admin_municipio M ON M.id = S.id_municipio "
                                    + "inner join admin_departamento D ON D.id = S.id_departamento "
                                    + "WHERE S.estado = 1 AND S.id = " + idInt + "";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            string json = "";
            while (reader.Read())
            {
                idSubregion = reader.GetInt32(0);
                idRegion = reader.GetInt32(1);
                idMunicipio = reader.GetInt32(2);
                idDepartamento = reader.GetInt32(3);
                nombre = reader.GetString(4);
                codigo = reader.GetString(5);
                tipo = reader.GetString(6);
                NombreRegion = reader.GetString(7);
                NombreMunicipio = reader.GetString(8);
                NombreDepartamento = reader.GetString(9);
                var chk = new datosSubRegion
                {
                    idSubRegion = idSubregion,
                    idRegion = idRegion,
                    idMunicipio = idMunicipio,
                    idDepartamento = idDepartamento,
                    nombre = nombre,
                    codigo = codigo,
                    tipo = tipo,
                    NombreRegion = NombreRegion,
                    NombreMunicipio = NombreMunicipio,
                    NombreDepartamento = NombreDepartamento
                };
                json = JsonConvert.SerializeObject(chk);
            }
            return json;
        }

        public class datosSubRegion
        {
            public int idSubRegion { get; set; }
            public int idRegion { get; set; }
            public int idMunicipio { get; set; }
            public int idDepartamento { get; set; }
            public string nombre { get; set; }
            public string codigo { get; set; }
            public string tipo { get; set; }
            public string NombreRegion { get; set; }
            public string NombreMunicipio { get; set; }
            public string NombreDepartamento { get; set; }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string id = txtIdSubRegionModSub.Text;
            int idSubRegion = Int32.Parse(id);
            int user = Convert.ToInt32(Session["idUsuario"].ToString());
            string module = "administrativo";
            string mensaje = "";


            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (txtNombreModSub.Text != "" && txtCodigoModSub.Text != "" && ddlTipoModSub.SelectedIndex >= 0 && ddlIdRegionModSub.SelectedIndex >= 0 && ddlIdMunicipioSub.SelectedIndex >= 0 )
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_actualizar_subregion", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idSubRegion1 = objcmd.Parameters.Add("@id_subregion", SqlDbType.Int);
                    idSubRegion1.Value = idSubRegion;

                    SqlParameter idRegion = objcmd.Parameters.Add("@id_region", SqlDbType.Int);
                    idRegion.Value = ddlIdRegionModSub.SelectedValue.ToString();

                    SqlParameter idMunicipio = objcmd.Parameters.Add("@id_municipio", SqlDbType.Int);
                    idMunicipio.Value = ddlIdMunicipioModSub.SelectedValue.ToString();

                    SqlParameter nombre = objcmd.Parameters.Add("@subregion", SqlDbType.VarChar);
                    nombre.Value = txtNombreModSub.Text;

                    SqlParameter codigo = objcmd.Parameters.Add("@no_subregion", SqlDbType.VarChar);
                    codigo.Value = txtCodigoModSub.Text;

                    SqlParameter tipo = objcmd.Parameters.Add("@tipo", SqlDbType.VarChar);
                    tipo.Value = ddlTipoModSub.SelectedItem.Text;

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
                        ddlIdRegionModSub.SelectedIndex = 0;
                        ddlIdMunicipioModSub.SelectedIndex = 0;
                        txtNombreModSub.Text = "";
                        txtCodigoModSub.Text = "";
                        ddlTipoModSub.SelectedIndex = 0;
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
            string id = txtIdSubRegionElSub.Text;
            int idSubregion = Int32.Parse(id);
            int user = Convert.ToInt32(Session["idUsuario"].ToString());
            string module = "administrativo";
            string mensaje = "";
            int estado = 0;

            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (txtIdSubRegionElSub.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_eliminar_subregion", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idSubRegion1 = objcmd.Parameters.Add("@id_subregion", SqlDbType.Int);
                    idSubRegion1.Value = idSubregion;

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
                        lblIdRegionElSub.Text = "";
                        lblIdMunicipioElSub.Text = "";
                        lblNombreElSub.Text = "";
                        lblCodigoElSub.Text = "";
                        lblTipoElSub.Text = "";
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