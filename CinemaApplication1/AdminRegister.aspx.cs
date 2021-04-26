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
    public partial class WebForm23 : System.Web.UI.Page
    {
        string ConnectionString = Global.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('Please log in as admin first!');window.location ='Homepage.aspx';", true);
            }
        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string name = txtName.Text;
                string email = txtEmail.Text;
                string password = Security.encrypt(txtPassword.Text);
                string purchaseId = "";
                string reportId = "";
                string date = DateTime.Now.ToString("M/d/yyyy");

                string sql = @"INSERT INTO Admin VALUES(@purchaseId,@reportId,@name,@email,@pwd,@date)";

                SqlConnection connection = new SqlConnection(ConnectionString);
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@pwd", password);
                command.Parameters.AddWithValue("@date", date);
                command.Parameters.AddWithValue("@purchaseId", purchaseId);
                command.Parameters.AddWithValue("@reportId", reportId);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Register sucessfully.');window.location ='AdminPanel.aspx';", true);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminRegister.aspx");
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPanel.aspx");
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

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string pwd = args.Value;

            if (pwd.Length < 5)
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator7_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (txtName.Text != null)
            {
                if (Regex.Matches(((string)txtName.Text), @"[*&%#@$^!]").Count > 0)
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