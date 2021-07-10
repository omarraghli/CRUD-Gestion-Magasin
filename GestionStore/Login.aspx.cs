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
    public partial class Login : System.Web.UI.Page
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

        protected void btnconnecter_Click(object sender, EventArgs e)
        {

            if (txte.Text != "" && txtmotdepasse.Text != "")
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("select * from [user] where email=@email and pwd=@pwd", con);
                    cmd.Parameters.AddWithValue("@email", txte.Text);
                    cmd.Parameters.AddWithValue("@pwd", txtmotdepasse.Text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["role"] = "user";
                            Session["user_id"] = dr["id_user"].ToString();
                            Response.Redirect("Homepage.aspx");

                        }
                    }
                    else
                    {

                        err.Text = "Utilisateur introuvable";
                    }
                    con.Close();
                }
            }
            else
            {
                err.Text = "Remplissez tout le formulaire";
            }
        }
    }
}