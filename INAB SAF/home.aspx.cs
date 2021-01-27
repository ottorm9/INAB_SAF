using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace INAB_SAF
{
    public partial class home : System.Web.UI.Page
    {
        protected void Home(object sender, EventArgs e)
        {
            Label lbl = this.Master.FindControl("lblUsuario") as Label;
            lbl.Text = Session["nombre"].ToString();
        }
    }
}