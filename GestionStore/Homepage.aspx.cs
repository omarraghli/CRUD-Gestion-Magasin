using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionStore
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].Equals(""))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (Session["role"].Equals("admin"))
                {
                    btnGcategories.Visible = true;
                    btnGarticles.Visible = true;
                    btnGcommandes.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    btnGcategories.Visible = false;
                    btnGarticles.Visible = false;
                    btnGcommandes.Visible = true;
                }
            }
        }

        protected void btnGarticles_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionArticle.aspx");
        }

        protected void btnGcategories_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionCategorie.aspx");
        }

        protected void btnGcommandes_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionCommande.aspx");
        }
    }
}