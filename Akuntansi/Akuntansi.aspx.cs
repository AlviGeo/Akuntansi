using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Akuntansi
{
    public partial class Akuntansi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            string CS = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("ShowJurnal", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
        }

        protected void btncari_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT * FROM Jurnal where AccountName like @contactName + '%' ", con);
            cmd.Parameters.AddWithValue("@contactName", txtcari.Text.Trim());
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnadd_click(object sender, EventArgs e)
        {
            Response.Redirect("AddJurnal.aspx");
        }

        protected void btnedit_click(object sender, EventArgs e)
        {
            Response.Redirect("EditJurnal.aspx");
        }

        protected void btndelete_click(object sender, EventArgs e)
        {
           
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("btnedit"))
            {
                GridViewRow gvrow = GridView1.Rows[index];
                lblID.Text = HttpUtility.HtmlDecode(gvrow.Cells[1].Text).ToString();
                txtEditCategory.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
                txtEditProductName.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                txtEditPrice.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
                txtEditDesc.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text).ToString();
                lblID.Visible = false;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");    
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

            }
            else if (e.CommandName.Equals("deleteRecord"))
            {
                string code = GridView1.DataKeys[index].Value.ToString();
                hfCode.Value = code;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteModalScript", sb.ToString(), false);
            }
        }

    }


}