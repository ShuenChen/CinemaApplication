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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string ConnectionString = Global.connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //This one if for delete the session when user is leave the forget password page, please keep it
            if (Session["forgetPwdName"] != null)
            {
                Session.Remove("forgetPwdName");
            }
            if (Session["username"] != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('You are now Login already.  Please log out first');window.location ='Homepage.aspx';", true);
            }
            if (Session["adminname"] != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('You are now Login already.  Please log out first');window.location ='Homepage.aspx';", true);
            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string name = txtName.Text;
                string email = txtEmail.Text;
                string password = Security.encrypt(txtPwd.Text);
                string question = ddlForgetPwdQuestion.SelectedValue;
                string answer = txtForgetPwdAnswer.Text;
                string date = DateTime.Now.ToString("yyyy-MM-dd");
                string picpath = "";

                string sql = @"INSERT INTO Member VALUES(@name,@email,@pwd,@date,@question,@answer,@picpath)";

                SqlConnection connection = new SqlConnection(ConnectionString);
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@pwd", password);
                command.Parameters.AddWithValue("@date", date);
                command.Parameters.AddWithValue("@question", question);
                command.Parameters.AddWithValue("@answer", answer);
                command.Parameters.AddWithValue("@picpath", picpath);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Register sucessfully.  You can now Login');window.location ='MemberLogin.aspx';", true);
            }

        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberRegister.aspx");
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

        //to check whether the password length enough or not
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string pwd = args.Value;

            if (pwd.Length < 5)
            {
                args.IsValid = false;
            }
        }

        //to check the captcha asnwer correct or not by the session
        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string captchaanswer = args.Value;

            string captcha = Session["Captcha"].ToString();
            if (captchaanswer.Equals(captcha))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
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

        protected void CustomValidator8_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (txtForgetPwdAnswer.Text != null)
            {
                if (Regex.Matches(((string)txtForgetPwdAnswer.Text), @"[*&%#@$^!]").Count > 0)
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