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
    public partial class GestionArticle : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        public void DataLoad()
        {
            if (Page.IsPostBack)
            {
                grdarticle.DataBind();
            }
        }

        public void ClearAllData()
        {
            txtnomarticle.Text = "";
            txtprixarticle.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].Equals("user") || Session["role"].Equals(""))
            {
                Response.Redirect("AdminLogin.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    using (con = new SqlConnection(cs))
                    {
                        con.Open();
                        cmd = new SqlCommand("select * from categorie", con);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                ListItem li = new ListItem(dr["nom_categorie"].ToString(), dr["categorie_id"].ToString());
                                ddlcategorie.Items.Add(li);
                            }
                        }

                        con.Close();
                    }
                }
            }
            
        }

        protected void btnaarticle_Click(object sender, EventArgs e)
        {
            if (txtnomarticle.Text != "" && txtprixarticle.Text != "")
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("Insert into article(nom_article,prix_article,categorie_id,id_admin) values(@nom_article,@prix_article,@categorie_id,@id_admin)", con);
                    cmd.Parameters.AddWithValue("@nom_article", txtnomarticle.Text);
                    cmd.Parameters.AddWithValue("@prix_article", txtprixarticle.Text);
                    cmd.Parameters.AddWithValue("@categorie_id", ddlcategorie.SelectedValue);
                    cmd.Parameters.AddWithValue("@id_admin", Session["admin_id"]);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataLoad();
                    ClearAllData();
                    m.Text = "";
                }
            }
            else
            {
                m.Text = "Remplissez tout le formulaire";
            }
        }

        protected void btnearticle_Click(object sender, EventArgs e)
        {
            if (txtnomarticle.Text != "" && txtprixarticle.Text != "" )
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("Update article Set nom_article=@nom_article ,prix_article=@prix_article, categorie_id=@categorie_id, id_admin=@id_admin Where Id=@id", con);
                    cmd.Parameters.AddWithValue("@nom_article", txtnomarticle.Text);
                    cmd.Parameters.AddWithValue("@prix_article", txtprixarticle.Text);
                    cmd.Parameters.AddWithValue("@categorie_id", ddlcategorie.SelectedValue);
                    cmd.Parameters.AddWithValue("@Id",identifiant.Text );
                    cmd.Parameters.AddWithValue("@id_admin",Session["admin_id"]);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataLoad();
                    ClearAllData();
                    m.Text = "";
                }
            }
            else
            {
                m.Text = "Remplissez tout le formulaire";
            }
        }

        protected void btndarticle_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("Delete From article where id=@id", con);
                cmd.Parameters.AddWithValue("@id", identifiant.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                DataLoad();
                ClearAllData();
            }
        }

        protected void ddlcategorie_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void grdarticle_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtprixarticle.Text = grdarticle.SelectedRow.Cells[4].Text;
            txtnomarticle.Text = grdarticle.SelectedRow.Cells[3].Text;
            ddlcategorie.Text = grdarticle.SelectedRow.Cells[2].Text;
            identifiant.Text = grdarticle.SelectedRow.Cells[1].Text; 
        }
    }
}