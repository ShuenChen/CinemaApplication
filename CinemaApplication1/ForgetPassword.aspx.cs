using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace CinemaApplication1
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        string ConnectionString = Global.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;

            string sql = "SELECT * FROM Member WHERE memberName = @name";

            SqlConnection connection = new SqlConnection(ConnectionString);
            SqlCommand command = new SqlCommand(sql, connection);

            command.Parameters.AddWithValue("@name", name);

            connection.Open();

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                Session["forgetPwdName"] = name;
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('Please enter your forget password question.');window.location ='ForgetPasswordQuestion.aspx';", true);

            }

            if (!dataReader.Read())
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('The username you enter is not yet registered. Please check again');", true);
            }
            connection.Close();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgetPassword.aspx");
        }

        protected void btnHomepage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}