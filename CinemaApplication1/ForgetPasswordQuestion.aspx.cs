using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CinemaApplication1
{
    public partial class ForgetPasswordQuestion : System.Web.UI.Page
    {
        string ConnectionString = Global.connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //display out the question according to the username
            string name = Session["forgetPwdName"].ToString();

            string sql = "SELECT * FROM Member WHERE memberName = @name";

            SqlConnection connection = new SqlConnection(ConnectionString);
            SqlCommand command = new SqlCommand(sql, connection);

            command.Parameters.AddWithValue("@name", name);

            connection.Open();

            SqlDataReader dataReader = command.ExecuteReader();
            dataReader.Read();
            int question = (int)dataReader["forgetPwdQuestion"];
            connection.Close();

            if (question == 1)
            {
                lblQuestion.Text = "What is your favourite Food?";
            }
            else if (question == 2)
            {
                lblQuestion.Text = "Where do you live at?";
            }
            else if (question == 3)
            {
                lblQuestion.Text = "Who are your favourite singer?";
            }

            //this one will display out the password of specific user if the answer is correct
            lblPassword.Text = "";
            lblPassword.BackColor = System.Drawing.Color.Transparent;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string answer = txtAnswer.Text;
            string name = Session["forgetPwdName"].ToString();

            string sql = "SELECT * FROM Member WHERE memberName = @name";

            SqlConnection connection = new SqlConnection(ConnectionString);
            SqlCommand command = new SqlCommand(sql, connection);

            command.Parameters.AddWithValue("@name", name);

            connection.Open();

            SqlDataReader dataReader = command.ExecuteReader();
            dataReader.Read();
            string checkAsnwer = (string)dataReader["forgetPwdAnswer"];
            string password = (string)dataReader["memberPassword"];
            connection.Close();

            if (checkAsnwer == answer)
            {
                lblPassword.Text = "Your password is " + Security.Decrypt(password) + ". Kindly remind to change your password";
            }
            else if (checkAsnwer != answer)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('The answer is not correct');", true);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtAnswer.Text = "";
        }

        protected void btnLoginNow_Click(object sender, EventArgs e)
        {
            //This one if for delete the session when user is leave the forget password page
            if(Session["forgetPwdName"] != null)
            {
                Session.Remove("forgetPwdName");
            }
            Response.Redirect("MemberLogin.aspx");
        }
    }
}