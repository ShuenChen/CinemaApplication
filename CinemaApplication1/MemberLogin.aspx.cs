using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace CinemaApplication1
{
    public partial class WebForm5 : System.Web.UI.Page
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtName.Text;
                string pwd = Security.encrypt(txtPwd.Text);

                string sql = "SELECT * FROM Member WHERE memberName = @name AND memberPassword = @pwd";
                string sql2 = "SELECT * FROM Admin WHERE adminName = @name AND adminPassword = @pwd";

                SqlConnection connection = new SqlConnection(ConnectionString);
                SqlCommand command = new SqlCommand(sql, connection);
                SqlCommand command2 = new SqlCommand(sql2, connection);

                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@pwd", pwd);
                command2.Parameters.AddWithValue("@name", name);
                command2.Parameters.AddWithValue("@pwd", pwd);

                connection.Open();
                SqlDataReader dataReader2 = command2.ExecuteReader();
                if (dataReader2.Read())
                {
                    Session["adminname"] = txtName.Text;
                    //here is the one that link to homepage,if you want to redirect to other page,change the Homepage(Temporarily).aspx to others
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Login sucessfully.  You are now login as the admin');window.location ='Homepage.aspx';", true);

                }
                connection.Close();

                connection.Open();
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader.Read())
                {
                    Session["username"] = txtName.Text;
                    //here is the one that link to homepage,if you want to redirect to other page,change the Homepage(Temporarily).aspx to others
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Login sucessfully.  You will be redirected to Homepage');window.location ='Homepage.aspx';", true);

                }

                if (!dataReader.Read())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Login Fail, Please check your user name or password.');", true);
                }

               
                connection.Close();
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberLogin.aspx");
        }

        protected void btnHomepage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}