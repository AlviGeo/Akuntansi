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
    public partial class EditJurnal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnedit_click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            con.Open();

            DateTime Jurnaldate = DateTime.Now;

            string updatecmd = "UPDATE Jurnal SET RowDate=@RowDate, AccountName = @AccountName, RowRef=@RowRef, Debit=@Debit, Kredit=@Kredit, Category=@Category WHERE RowID=@RowID";
            SqlCommand addcmd = new SqlCommand(updatecmd, con);
            addcmd.Parameters.AddWithValue("@RowID", RowID.Value);
            addcmd.Parameters.AddWithValue("@RowDate", Jurnaldate);
            addcmd.Parameters.AddWithValue("@AccountName", JurnalName.Text);
            addcmd.Parameters.AddWithValue("@RowRef", JurnalRef.Text);
            addcmd.Parameters.AddWithValue("@Debit", Debit.Text);
            addcmd.Parameters.AddWithValue("@Kredit", Kredit.Text);
            addcmd.Parameters.AddWithValue("@Category", Category.Text);

            addcmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Akuntansi.aspx");
        }
    }
}