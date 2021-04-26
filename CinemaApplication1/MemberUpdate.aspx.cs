using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;

namespace CinemaApplication1
{
    public partial class WebForm28 : System.Web.UI.Page
    {
        string ConnectionString = Global.connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //This one if for delete the session when user is leave the forget password page, please keep it
            if (Session["forgetPwdName"] != null)
            {
                Session.Remove("forgetPwdName");
            }
            else if (Session["username"] != null)
            {

                string username = Session["username"].ToString();
                string sqlSelectStatement = "SELECT memberName FROM Member WHERE memberName = '" + username + "'";

                // Initialize a connection with DB
                SqlConnection connection = new SqlConnection(ConnectionString);

                // Initialize a sql command to execute
                SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

                // Open a channel to commmunicate with DB
                connection.Open();

                // Execute the command and read data from DB
                SqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    mmbName.Text = dataReader[0].ToString();
                }
                // Close the connection after finish communicating with DB
                dataReader.Close();

                connection.Close();
            }
            else if (Session["adminname"] != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('You are now Login already.  Please log out first');window.location ='Homepage.aspx';", true);
            }
            else {
                Server.Transfer("MemberLogin.aspx");
            }
        }
        protected void Register_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = Session["username"].ToString();
                string email = txtEmail.Text;
                string password = Security.encrypt(txtPwd.Text);
                string question = ddlForgetPwdQuestion.SelectedValue;
                string answer = txtForgetPwdAnswer.Text;

                string sql = @"UPDATE Member SET memberEmail=@email,memberPassword=@pwd,forgetPwdQuestion=@question,forgetPwdAnswer=@answer WHERE memberName = '" + username + "'";
                SqlConnection connection = new SqlConnection(ConnectionString);
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@pwd", password);
                command.Parameters.AddWithValue("@question", question);
                command.Parameters.AddWithValue("@answer", answer);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Update sucessfully.  You will back to member panel');window.location ='MemberPanel.aspx';", true);
            }

        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberUpdate.aspx");
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
            Response.Redirect("MemberPanel.aspx");
        }

        protected void CustomValidator7_ServerValidate(object source, ServerValidateEventArgs args)
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