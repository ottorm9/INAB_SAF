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
using System.Security.Cryptography;
using System.IO;
using System.Net;

namespace INAB_SAF
{
    public partial class usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtError.Text = "";
                CargarInformacionddlIdEtnia();
                CargarInformacionddlIdIdioma();
                CargarInformacionddlIdSubregion();
            }
        }

        protected void CargarInformacionddlIdSubregion()
        {
            try
            {
                DataTable dataTable = Datos.CreateCommand("select S.id, S.nombre from admin_subregion S inner join admin_region R on R.id = S.id_region and R.estado = 1 inner join admin_municipio M on M.id = S.id_municipio and M.estado = 1 inner join admin_departamento D on D.id = S.id_departamento and D.estado = 1 where S.estado = 1");

                if (dataTable != null)
                {
                    if (dataTable.Rows.Count > 0)
                    {
                        ddlIdSubregionUsu.DataSource = dataTable;
                        ddlIdSubregionUsu.DataTextField = "nombre";
                        ddlIdSubregionUsu.DataValueField = "id";
                        ddlIdSubregionUsu.DataBind();

                        ddlIdSubregionModUsu.DataSource = dataTable;
                        ddlIdSubregionModUsu.DataTextField = "nombre";
                        ddlIdSubregionModUsu.DataValueField = "id";
                        ddlIdSubregionModUsu.DataBind();
                    }
                    else
                    {
                        txtError.Text = "No se pudieron obtener las subregiones";
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                }
                else
                {
                    txtError.Text = "No se pudieron obtener las subregiones";
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

        protected void CargarInformacionddlIdIdioma()
        {
            try
            {
                DataTable dataTable = Datos.CreateCommand("select id, nombre from admin_idioma where estado = 1");

                if (dataTable != null)
                {
                    if (dataTable.Rows.Count > 0)
                    {
                        ddlIdIdiomaUsu.DataSource = dataTable;
                        ddlIdIdiomaUsu.DataTextField = "nombre";
                        ddlIdIdiomaUsu.DataValueField = "id";
                        ddlIdIdiomaUsu.DataBind();

                        ddlIdIdiomaModUsu.DataSource = dataTable;
                        ddlIdIdiomaModUsu.DataTextField = "nombre";
                        ddlIdIdiomaModUsu.DataValueField = "id";
                        ddlIdIdiomaModUsu.DataBind();
                    }
                    else
                    {
                        txtError.Text = "No se pudieron obtener los idiomas";
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                }
                else
                {
                    txtError.Text = "No se pudieron obtener los idiomas";
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

        protected void CargarInformacionddlIdEtnia()
        {
            try
            {
                DataTable dataTable = Datos.CreateCommand("select id, nombre from admin_etnia where estado = 1");

                if (dataTable != null)
                {
                    if (dataTable.Rows.Count > 0)
                    {
                        ddlIdEtniaUsu.DataSource = dataTable;
                        ddlIdEtniaUsu.DataTextField = "nombre";
                        ddlIdEtniaUsu.DataValueField = "id";
                        ddlIdEtniaUsu.DataBind();

                        ddlIdEtniaModUsu.DataSource = dataTable;
                        ddlIdEtniaModUsu.DataTextField = "nombre";
                        ddlIdEtniaModUsu.DataValueField = "id";
                        ddlIdEtniaModUsu.DataBind();
                    }
                    else
                    {
                        txtError.Text = "No se pudieron obtener las etnias";
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                }
                else
                {
                    txtError.Text = "No se pudieron obtener las etnias";
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
            var key = "b99ca2210a8e7548yghe6ld9748b8154";
            int user = Convert.ToInt32(Session["idUsuario"].ToString());
            string module = "administrativo";
            string EstadoUsuario = "nuevo";
            string mensaje = "";
            int ContraseniaIgual = 1;
            int ValidarContrasenia = 1;
            string ContraseniaEncrypt = "";
            bool isDigit = txtContraseniaUsu.Text.Any(char.IsDigit);
            bool isSymbol = txtContraseniaUsu.Text.Any(ch => !Char.IsLetterOrDigit(ch));
            bool isUpper = txtContraseniaUsu.Text.Any(char.IsUpper);
            bool isLower = txtContraseniaUsu.Text.Any(char.IsLower);

            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (txtContraseniaUsu.Text.Length < 8 || isDigit == false || isSymbol == false || isUpper == false || isLower == false)
                {
                    ValidarContrasenia = 0;
                }

                if (txtContraseniaUsu.Text != txtConfirmarContraseniaUsu.Text)
                {
                    ContraseniaIgual = 0;
                }
                else
                {
                    //Enviar valor encriptar = 1 para encriptar y valor 0 si necesita desencriptar
                    ContraseniaEncrypt = AesOperation.EncryptString(key, txtContraseniaUsu.Text);
                }


                if (txtNombreUsu.Text != "" && txtUsuarioUsu.Text != "" && txtCorreoUsu.Text != "" && txtDpiUsu.Text != "" && txtContraseniaUsu.Text != "" && txtConfirmarContraseniaUsu.Text != "" && txtPuestoUsu.Text != "" && ContraseniaEncrypt != "" && ddlIdSubregionUsu.SelectedIndex >= 0 && ddlIdIdiomaUsu.SelectedIndex >= 0 && ddlIdEtniaUsu.SelectedIndex >= 0 && ContraseniaIgual == 1 && ValidarContrasenia == 1)
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_insertar_usuario", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter usuario1 = objcmd.Parameters.Add("@nombre_usuario", SqlDbType.VarChar);
                    usuario1.Value = txtUsuarioUsu.Text;

                    SqlParameter nombre = objcmd.Parameters.Add("@nombre", SqlDbType.VarChar);
                    nombre.Value = txtNombreUsu.Text;

                    SqlParameter correo = objcmd.Parameters.Add("@correo", SqlDbType.VarChar);
                    correo.Value = txtCorreoUsu.Text;

                    SqlParameter dpi = objcmd.Parameters.Add("@dpi", SqlDbType.BigInt);
                    dpi.Value = Convert.ToInt64(txtDpiUsu.Text);

                    SqlParameter contrasenia = objcmd.Parameters.Add("@contrasenia", SqlDbType.VarChar);
                    contrasenia.Value = ContraseniaEncrypt;

                    SqlParameter estado_usuario = objcmd.Parameters.Add("@estado_usuario", SqlDbType.VarChar);
                    estado_usuario.Value = EstadoUsuario;

                    SqlParameter puesto = objcmd.Parameters.Add("@puesto", SqlDbType.VarChar);
                    puesto.Value = txtPuestoUsu.Text;

                    SqlParameter id_etnia = objcmd.Parameters.Add("@id_etnia", SqlDbType.Int);
                    id_etnia.Value = Convert.ToInt32(ddlIdEtniaUsu.SelectedValue);

                    SqlParameter id_idioma = objcmd.Parameters.Add("@id_idioma", SqlDbType.Int);
                    id_idioma.Value = Convert.ToInt32(ddlIdIdiomaUsu.SelectedValue);

                    SqlParameter id_subregion = objcmd.Parameters.Add("@id_subregion", SqlDbType.Int);
                    id_subregion.Value = Convert.ToInt32(ddlIdSubregionUsu.SelectedValue);

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
                        txtNombreUsu.Text = "";
                        txtUsuarioUsu.Text = "";
                        txtDpiUsu.Text = "";
                        txtCorreoUsu.Text = "";
                        txtContraseniaUsu.Text = "";
                        txtConfirmarContraseniaUsu.Text = "";
                        txtConfirmarContraseniaUsu.Text = "";
                        txtPuestoUsu.Text = "";
                        ddlIdIdiomaUsu.SelectedIndex = 0;
                        ddlIdEtniaUsu.SelectedIndex = 0;
                        ddlIdSubregionUsu.SelectedIndex = 0;
                        EstadoUsuario = "";
                        ContraseniaEncrypt = "";
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
                    if (ValidarContrasenia == 0)
                    {
                        string error = "Ocurrio un error, la contraseña debe tener una longitud de 8 o más caracteres y contener al menos una mayúscula, una minúscula, un carácter especial (@,-,etc) y un número";
                        txtError.Text = error;
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                    else if (ContraseniaIgual == 0)
                    {
                        string error = "Ocurrio un error, las contraseñas no son iguales";
                        txtError.Text = error;
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "FaltaDato", "FaltaDato();", true);
                    }
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
            thisCommand.CommandText = "SELECT U.id as id_usuario, U.usuario as nombre_usuario ,U.nombre as nombre, U.dpi, U.puesto, U.correo, S.id as id_subregion, "
                                      + "R.id as id_region, M.id as id_municipio, D.id as id_departamento, I.id as id_idioma, "
                                      + "E.id as id_etnia, S.nombre as NombreSubregion, R.nombre as NombreRegion, "
                                      + "M.nombre as NombreMunicipio, D.nombre as NombreDepartamento, I.nombre as NombreIdioma, "
                                      + "E.nombre as NombreEtnia "
                                      + "FROM admin_usuario U "
                                      + "inner join admin_subregion S ON S.id = U.id_subregion AND S.estado = 1 "
                                      + "inner join admin_region R ON R.id = U.id_region AND R.estado = 1 "
                                      + "inner join admin_municipio M ON M.id = U.id_municipio AND M.estado = 1 "
                                      + "inner join admin_departamento D ON D.id = U.id_departamento AND D.estado = 1 "
                                      + "inner join admin_idioma I ON I.id = U.id_idioma AND I.estado = 1 "
                                      + "inner join admin_etnia E ON E.id = U.id_etnia AND E.estado = 1 "
                                      + "WHERE U.estado = 1";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                int idUsuario = reader.GetInt32(0);
                string usuario = reader.GetString(1);
                string nombre = reader.GetString(2);
                long dpi = reader.GetInt64(3);
                string puesto = reader.GetString(4);
                string correo = reader.GetString(5);
                string NombreSubregion = reader.GetString(12);
                string NombreRegion = reader.GetString(13);
                string NombreMunicipio = reader.GetString(14);
                string NombreDepartamento = reader.GetString(15);
                string NombreIdioma = reader.GetString(16);
                string NombreEtnia = reader.GetString(17);
                htmlStr += "<tr><td>" + usuario + "</td><td>" + nombre + "</td><td>" + correo + "</td><td>" + dpi + "</td><td>" + puesto + "</td><td>" + NombreSubregion + "</td><td>" + NombreRegion + "</td><td>" + NombreMunicipio + "</td><td>" + NombreDepartamento + "</td><td>" + NombreIdioma + "</td><td>" + NombreEtnia + "</td><td><input type='button' class='btn btn-primary modificarUsuario' name='modificar' value='Modificar' ID='" + idUsuario + "' data-toggle='modal' data-target='#Modificar'></td><td><input type='button' class='btn btn-danger eliminarUsuario' name='eliminar' value='Eliminar' ID='" + idUsuario + "' data-toggle='modal' data-target='#Eliminar'></td></tr>";
            }

            thisConnection.Close();
            return htmlStr;
        }

        public void LoadDataUpdate(int id, string idSubregion, string idIdioma, string idEtnia, string nombre, string dpi, string correo, string Usuario, string puesto)
        {
            ddlIdSubregionUsu.SelectedValue = idSubregion;
            ddlIdEtniaUsu.SelectedValue = idEtnia;
            ddlIdIdiomaUsu.SelectedValue = idIdioma;
            txtNombreModUsu.Text = nombre;
            txtUsuarioUsu.Text = Usuario;
            txtCorreoUsu.Text = correo;
            txtDpiUsu.Text = dpi;
            txtPuestoUsu.Text = puesto;
        }

        [WebMethod]
        public static string consultarDatosdeUsuario(string id)
        {
            var key = "b99ca2210a8e7548yghe6ld9748b8154";
            string htmlStr1 = "";

            int idUsuario, idSubregion, idEtnia, idIdioma;
            string nombre, correo, usuario, NombreSubregion, NombreEtnia, NombreIdioma, Contrasenia, DecryptContrasenia, puesto;
            long dpi;
            int idInt = Int32.Parse(id);
            htmlStr1 = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection thisConnection = new SqlConnection(htmlStr1);

            SqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "SELECT U.id as id_usuario, U.usuario as nombre_usuario ,U.nombre as nombre, U.dpi, U.puesto, U.correo, S.id as id_subregion, "
                                      + "I.id as id_idioma, E.id as id_etnia, S.nombre as NombreSubregion, I.nombre as NombreIdioma, E.nombre as NombreEtnia, U.Contrasenia "
                                      + "FROM admin_usuario U "
                                      + "inner join admin_subregion S ON S.id = U.id_subregion AND S.estado = 1 "
                                      + "inner join admin_idioma I ON I.id = U.id_idioma AND I.estado = 1 "
                                      + "inner join admin_etnia E ON E.id = U.id_etnia AND E.estado = 1 "
                                      + "WHERE U.estado = 1 AND U.id = " + idInt + "";
            thisConnection.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            string json = "";
            while (reader.Read())
            {
                idUsuario = reader.GetInt32(0);
                usuario = reader.GetString(1);
                nombre = reader.GetString(2);
                dpi = reader.GetInt64(3);
                puesto = reader.GetString(4);
                correo = reader.GetString(5);
                idSubregion = reader.GetInt32(6);
                idIdioma = reader.GetInt32(7);
                idEtnia = reader.GetInt32(8);
                NombreSubregion = reader.GetString(9);
                NombreIdioma = reader.GetString(10);
                NombreEtnia = reader.GetString(11);
                Contrasenia = reader.GetString(12);

                //Enviar valor encriptar = 1 para encriptar y valor 0 si necesita desencriptar
                DecryptContrasenia = AesOperation.DecryptString(key, Contrasenia);

                var chk = new datosUsuario
                {
                    idUsuario = idUsuario,
                    idSubregion = idSubregion,
                    idIdioma = idIdioma,
                    idEtnia = idEtnia,
                    nombre = nombre,
                    correo = correo,
                    dpi = dpi,
                    usuario = usuario,
                    NombreSubregion = NombreSubregion,
                    NombreEtnia = NombreEtnia,
                    NombreIdioma = NombreIdioma,
                    contrasenia = DecryptContrasenia,
                    puesto = puesto
                };
                json = JsonConvert.SerializeObject(chk);
            }
            return json;
        }

        public class datosUsuario
        {
            public int idUsuario { get; set; }
            public int idSubregion { get; set; }
            public int idIdioma { get; set; }
            public int idEtnia { get; set; }
            public string nombre { get; set; }
            public string correo { get; set; }
            public long dpi { get; set; }
            public string usuario { get; set; }
            public string contrasenia { get; set; }
            public string NombreSubregion { get; set; }
            public string NombreIdioma { get; set; }
            public string NombreEtnia { get; set; }
            public string puesto { get; set; }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            var key = "b99ca2210a8e7548yghe6ld9748b8154";
            string id = txtIdUsuarioModUsu.Text;
            int idUsuario = Int32.Parse(id);
            int user = Convert.ToInt32(Session["idUsuario"].ToString());
            string module = "administrativo";
            string mensaje = "";
            int ContraseniaIgual = 1;
            int ValidarContrasenia = 1;
            string ContraseniaEncrypt = "";
            bool isDigit = txtContraseniaModUsu.Text.Any(char.IsDigit);
            bool isSymbol = txtContraseniaModUsu.Text.Any(ch => !Char.IsLetterOrDigit(ch));
            bool isUpper = txtContraseniaModUsu.Text.Any(char.IsUpper);
            bool isLower = txtContraseniaModUsu.Text.Any(char.IsLower);

            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (txtContraseniaModUsu.Text.Length < 8 || isDigit == false || isSymbol == false || isUpper == false || isLower == false)
                {
                    ValidarContrasenia = 0;
                }

                if (txtContraseniaModUsu.Text != txtConfirmarContraseniaModUsu.Text)
                {
                    ContraseniaIgual = 0;
                }
                else
                {
                    //Enviar valor encriptar = 1 para encriptar y valor 0 si necesita desencriptar
                    ContraseniaEncrypt = AesOperation.EncryptString(key, txtContraseniaModUsu.Text);
                }

                if (txtNombreModUsu.Text != "" && txtUsuarioModUsu.Text != "" && txtCorreoModUsu.Text != "" && txtDpiModUsu.Text != "" && txtContraseniaModUsu.Text != "" && txtConfirmarContraseniaModUsu.Text != "" && txtPuestoModUsu.Text != "" && ddlIdSubregionModUsu.SelectedIndex >= 0 && ddlIdIdiomaModUsu.SelectedIndex >= 0 && ddlIdEtniaModUsu.SelectedIndex >= 0 && ContraseniaIgual == 1 && ContraseniaEncrypt != "" && ValidarContrasenia == 1)
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_actualizar_usuario", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idUsuario1 = objcmd.Parameters.Add("@id_usuario1", SqlDbType.Int);
                    idUsuario1.Value = idUsuario;

                    SqlParameter isSubregion = objcmd.Parameters.Add("@id_subregion", SqlDbType.Int);
                    isSubregion.Value = ddlIdSubregionModUsu.SelectedValue.ToString();

                    SqlParameter idIdioma = objcmd.Parameters.Add("@id_idioma", SqlDbType.Int);
                    idIdioma.Value = ddlIdIdiomaModUsu.SelectedValue.ToString();

                    SqlParameter idEtnia = objcmd.Parameters.Add("@id_etnia", SqlDbType.Int);
                    idEtnia.Value = ddlIdEtniaModUsu.SelectedValue.ToString();

                    SqlParameter usuario1 = objcmd.Parameters.Add("@nombre_usuario", SqlDbType.VarChar);
                    usuario1.Value = txtUsuarioModUsu.Text;

                    SqlParameter nombre = objcmd.Parameters.Add("@nombre", SqlDbType.VarChar);
                    nombre.Value = txtNombreModUsu.Text;

                    SqlParameter correo = objcmd.Parameters.Add("@correo", SqlDbType.VarChar);
                    correo.Value = txtCorreoModUsu.Text;

                    SqlParameter dpi = objcmd.Parameters.Add("@dpi", SqlDbType.BigInt);
                    dpi.Value = Convert.ToInt64(txtDpiModUsu.Text);

                    SqlParameter puesto = objcmd.Parameters.Add("@puesto", SqlDbType.VarChar);
                    puesto.Value = txtPuestoModUsu.Text;

                    SqlParameter contrasenia = objcmd.Parameters.Add("@contrasenia", SqlDbType.VarChar);
                    contrasenia.Value = ContraseniaEncrypt;

                    SqlParameter usuario = objcmd.Parameters.Add("@usuario", SqlDbType.Int);
                    usuario.Value = user;

                    SqlParameter modulo = objcmd.Parameters.Add("@modulo", SqlDbType.VarChar);
                    modulo.Value = module;

                    SqlParameter modifico = objcmd.Parameters.Add("@actualizo", SqlDbType.VarChar, 1500);
                    modifico.Direction = ParameterDirection.Output;

                    objcmd.ExecuteNonQuery();

                    string result = objcmd.Parameters["@actualizo"].Value.ToString();

                    if (result == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "guardarbien", "guardarbien();", true);
                        txtNombreModUsu.Text = "";
                        txtUsuarioModUsu.Text = "";
                        txtCorreoModUsu.Text = "";
                        txtDpiModUsu.Text = "";
                        txtContraseniaModUsu.Text = "";
                        txtConfirmarContraseniaModUsu.Text = "";
                        txtPuestoModUsu.Text = "";
                        ddlIdEtniaModUsu.SelectedIndex = 0;
                        ddlIdIdiomaModUsu.SelectedIndex = 0;
                        ddlIdSubregionModUsu.SelectedIndex = 0;
                        txtIdUsuarioModUsu.Text = "";
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
                    if (ValidarContrasenia == 0)
                    {
                        string error = "Ocurrio un error, la contraseña debe contener al menos una mayúscula, una minúscula, un carácter y un número";
                        txtError.Text = error;
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                    else if (ContraseniaIgual == 0)
                    {
                        string error = "Ocurrio un error, las contraseñas no son iguales";
                        txtError.Text = error;
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorguardar", "errorguardar('" + txtError.Text + "');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "FaltaDato", "FaltaDato();", true);
                    }
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
            string id = txtIdUsuarioElUsu.Text;
            int idUsuario = Int32.Parse(id);
            int user = Convert.ToInt32(Session["idUsuario"].ToString());
            string module = "administrativo";
            string mensaje = "";
            int estado = 0;

            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["SAF"].ConnectionString;
            SqlConnection objsqlconn = new SqlConnection(conn);
            try
            {
                if (txtIdUsuarioElUsu.Text != "")
                {

                    objsqlconn.Open();
                    SqlCommand objcmd = new SqlCommand("sp_admin_eliminar_usuario", objsqlconn);
                    objcmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter idUsuario1 = objcmd.Parameters.Add("@id_usuario1", SqlDbType.Int);
                    idUsuario1.Value = idUsuario;

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
                        lblCorreoElUsu.Text = "";
                        lblDpiElUsu.Text = "";
                        lblIdEtniaElUsu.Text = "";
                        lblIdIdiomaElUsu.Text = "";
                        lblIdSubregionElUsu.Text = "";
                        lblNombreElUsu.Text = "";
                        lblUsuarioElUsu.Text = "";
                        txtError.Text = "";
                        txtIdUsuarioElUsu.Text = "";
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