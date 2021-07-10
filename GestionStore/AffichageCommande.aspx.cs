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
    public partial class AffichageCommande : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;
        protected void centrer()
        {
            foreach (GridViewRow row in graf.Rows)
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
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("select hasmanycommandearticle.id_many, article.nom_article , article.prix_article from article inner join hasmanycommandearticle on article.Id=hasmanycommandearticle.id_article inner join commande on hasmanycommandearticle.id_commande=commande.commande_id inner join [user] on [user].id_user=commande.id_user where [user].id_user=@id", con);
                    cmd.Parameters.AddWithValue("@id", Session["user_id"]);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                    dt = new DataTable();
                    dt.Columns.Add("Ref Commande et article");
                    dt.Columns.Add("Nom de l'article");
                    dt.Columns.Add("Prix de l'article");
                    while (dr.Read())
                    {
                        DataRow row = dt.NewRow();
                        row["Ref Commande et article"] = dr["id_many"];
                        row["Nom de l'article"] = dr["nom_article"];
                        row["Prix de l'article"] = dr["prix_article"];
                        dt.Rows.Add(row);
                    }
                    graf.DataSource = dt;
                    graf.DataBind();
                    dr.Close();
                    con.Close();
                }
                    else
                    {

                        aze.Text = "Commandez au moin une commande";
                    }
                    con.Close();
                }
            centrer();
            }
        }

        protected void graf_SelectedIndexChanged(object sender, EventArgs e)
        {
            idsupcom.Text = graf.SelectedRow.Cells[1].Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("Delete From hasmanycommandearticle where id_many=@id", con);
                cmd.Parameters.AddWithValue("@id", idsupcom.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionCommande.aspx");
        }
    }
}