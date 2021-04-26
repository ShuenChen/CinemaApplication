using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace CinemaApplication1
{
    public partial class WebForm24 : System.Web.UI.Page
    {
        string ConnectionString = Global.connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string name = args.Value;

            string sql = "SELECT COUNT(*) FROM Member WHERE memberName = @name";
            string sql2 = "SELECT COUNT(*) FROM Admin WHERE adminName = @name";

            SqlConnection connection = new SqlConnection(ConnectionString);
            SqlCommand command = new SqlCommand(sql, connection);
            SqlCommand command2 = new SqlCommand(sql2, connection);
            command.Parameters.AddWithValue("@name", name);
            command2.Parameters.AddWithValue("@name", name);

            connection.Open();
            int count = (int)command.ExecuteScalar();
            int count2 = (int)command2.ExecuteScalar();
            connection.Close();

            if (count > 0 || count2 > 0)
            {
                args.IsValid = false;
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPanel.aspx");
        }

        protected void CustomValidator7_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string name = args.Value;

            if (name != null)
            {
                if (Regex.Matches(((string)name), @"[*&%#@$^!]").Count > 0)
                {

                    args.IsValid = false;

                }
                else
                {
                    args.IsValid = true;
                }
            }
        }
    }
}