using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionStore
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["role"].Equals("admin") || Session["role"].Equals("user"))
            {
                singupnav.Visible = false;
                loginnav.Visible = false;
                loginadminnav.Visible = false;
            }

            if (Session["role"].Equals(""))
            {
                deconav.Visible = false;
            }
            if (Session["role"].Equals("") || Session["role"].Equals("user"))
            {
                gartnav.Visible = false;
                gcatnav.Visible = false;
            }


        }
        protected void deconection(object sender, EventArgs e)
        {
            Session["role"] = "";
            Response.Redirect("Login.aspx");
        }
    }
}