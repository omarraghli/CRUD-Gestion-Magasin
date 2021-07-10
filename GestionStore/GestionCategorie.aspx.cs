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
    
    public partial class GestionCategorie : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;
       

        public void DataLoad()
        {
            if (Page.IsPostBack)
            {
                GridView1.DataBind();
                
            }
            
        }
        public void ClearAllData()
        {
            txtcat.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].Equals("user") || Session["role"].Equals(""))
            {
                Response.Redirect("AdminLogin.aspx");
            }
            }

        protected void btncat_Click(object sender, EventArgs e)
        {
            if (txtcat.Text != "")
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("Insert into categorie(nom_categorie,admin_id) values(@nom_cat,@admin_id)", con);
                    cmd.Parameters.AddWithValue("@nom_cat", txtcat.Text);
                    cmd.Parameters.AddWithValue("@admin_id",Session["admin_id"]);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataLoad();
                    ClearAllData();
                    msger.Text = "";
                }
            }
            else
            {
                msger.Text = "Remplissez tout le formulaire";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtcat.Text = GridView1.SelectedRow.Cells[2].Text;
            lblidentify.Text = GridView1.SelectedRow.Cells[1].Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtcat.Text != "")
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("Update categorie Set nom_categorie=@nom_categorie, admin_id=@admin_id Where categorie_id=@id", con);
                    cmd.Parameters.AddWithValue("@nom_categorie", txtcat.Text);
                    cmd.Parameters.AddWithValue("@admin_id",Session["admin_id"]);
                    cmd.Parameters.AddWithValue("@id", lblidentify.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataLoad();
                    ClearAllData();
                    msger.Text = "";
                }
            }
            else
                msger.Text = "Remplissez tout le formulaire";
            
        }

        protected void btnsupp_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("Delete From categorie where categorie_id=@id", con);
                cmd.Parameters.AddWithValue("@id", lblidentify.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                DataLoad();
                ClearAllData();
            }
        }
    }
}