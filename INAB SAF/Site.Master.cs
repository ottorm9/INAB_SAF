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
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombre"].ToString() == "") {
                Response.Redirect("index.aspx");
            }
            else { 
                lblUsuario.Text = "test";
                lblUsuario.Text = Session["nombre"].ToString();
            }
        }

        protected void cerrarSesion(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        public string getMenuData()
        {

            string htmlStr = "";
            //////////////////////////////// OPCION INICIO //////////////////////////
            htmlStr += "<li> <a href=\"home.aspx\"><i class=\"fa fa-home\"></i> Inicio</a> </li>";
            //////////////////////////////// OPCION MANTENIMIENTOS //////////////////////////
            htmlStr += "<li>" +
                        "<a href=\"#\" class=\"active-menu\"><i class=\"fa fa-cogs\"></i> Mantenimientos<span class=\"fa arrow\"></span></a>" +
                        "<ul class=\"nav nav-second-level\">" +
                            "<li>" +
                                "<a href=\"usuario.aspx\">Usuario</a>" +
                            "</li >" +
                            "<li>" +
                                "<a href=\"perfil.aspx\">Perfil</a>" +
                            "</li>" +
                            "<li>" +
                                "<a href=\"rol.aspx\">Roles</a>" +
                            "</li>" +
                            "<li>" +
                                "<a href=\"asigRol.aspx\">Asignacionde roles</a>" +
                            "</li>" +
                            "<li>" +
                                "<a href=\"region.aspx\">Region</a>" +
                             "</li>" +
                             "<li>" +
                                 "<a href=\"subregion.aspx\">Subregion</a>" +
                             "</li>" +
                             "<li>" +
                                 "<a href=\"municipio.aspx\">Municipio</a>" +
                             "</li>" +
                             "<li>" +
                                "<a href=\"renglon.aspx\">Renglon</a>" +
                             "</li>" +
                              "<li>" +
                                 "<a href=\"fuente.aspx\">Fuente</a>" +
                             "</li>"+
                         "</ul>"+
                     "</li> ";
            return htmlStr;
        }
    }
}
