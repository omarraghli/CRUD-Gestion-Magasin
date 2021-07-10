using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionStore
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["role"] = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtadminemail.Text != "" && txtadminpwd.Text != "")
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("select * from admin where email=@email and pwd=@pwd", con);
                    cmd.Parameters.AddWithValue("@email", txtadminemail.Text);
                    cmd.Parameters.AddWithValue("@pwd", txtadminpwd.Text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["role"] = "admin";
                            Session["admin_id"] = dr["admin_id"];
                            Response.Redirect("Homepage.aspx");

                        }
                    }
                    else
                    {

                        errormessage.Text = "Utilisateur introuvable";
                    }
                    con.Close();
                }
            }
            else
            {
                errormessage.Text = "Remplissez tout le formulaire";
            }
        }
    }
}