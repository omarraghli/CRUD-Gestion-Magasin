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
    public partial class SingUp : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btninscire_Click(object sender, EventArgs e)
        {
            if (txtnom.Text != "" && txtprenom.Text != "" && txtmdp.Text != "" && txtdob.Text != "" && txtemail.Text!="")
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("Insert into [user] (nom,prenom,dob,email,pwd) values(@nom,@prenom,@dob,@email,@pwd)", con);
                    cmd.Parameters.AddWithValue("@nom", txtnom.Text);
                    cmd.Parameters.AddWithValue("@prenom", txtprenom.Text);
                    cmd.Parameters.AddWithValue("@pwd", txtmdp.Text);
                    cmd.Parameters.AddWithValue("@email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@dob", txtdob.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    msgError.Text = "";
                }
                Response.Redirect("Login.aspx");
            }
            else
            {
                msgError.Text = "Remplissez tout le formulaire";
            }
        }
    }
}