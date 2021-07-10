using System;
using System.Collections;
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
    public partial class GestionCommande : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        string article_identitfy;
        static List<string> totale = new List<string>();

        protected void centrer()
        {
            foreach (GridViewRow row in grdaffarticles.Rows)
            {
                foreach (TableCell cell in row.Cells)
                {
                    cell.Attributes.CssStyle["text-align"] = "center";
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].Equals(""))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {

                    List<string> totale = new List<string>();
                }
                centrer();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            totale.Add(grdaffarticles.SelectedRow.Cells[1].Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (totale.Any())
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("Insert into commande(id_user) values(@id_user)", con);
                    cmd.Parameters.AddWithValue("@id_user", Session["user_id"]);
                    cmd.ExecuteNonQuery();
                    cmd = new SqlCommand("SELECT max(commande_id) FROM commande", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read()) 
                    {
                        article_identitfy = dr.GetInt32(0).ToString();
                    }
                    con.Close();
                    foreach (string i in totale)
                    {
                        if (con.State==ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        cmd = new SqlCommand("Insert into hasmanycommandearticle(id_commande, id_article) values(@id_commande,@id_article)", con);
                        cmd.Parameters.AddWithValue("@id_commande", article_identitfy);
                        cmd.Parameters.AddWithValue("@id_article", i);
                        cmd.ExecuteNonQuery();
                        if (con.State == ConnectionState.Open)
                        {
                            con.Close();
                        }
                        
                    }
                    con.Close();
                    totale.Clear();
                    er.Text = "Commande validé";
                }
            }
            else if(!totale.Any())
            {
                er.Text = "selectionnez au moin un article";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AffichageCommande.aspx");
        }
    }
}