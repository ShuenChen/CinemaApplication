using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace CinemaApplication1
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        string connectionString = Global.connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string getUsername = Session["username"].ToString();
            string getCartNum = Request.QueryString["CartNum"] ?? "";

            string sqlDeleteStatement = "DELETE FROM Cart WHERE MemberName = @MemberName AND CartNum = @cartNum";

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sqlDeleteStatement, connection);
            
            command.Parameters.AddWithValue("@MemberName", getUsername);
            command.Parameters.AddWithValue("@cartNum", getCartNum);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();
            Response.Redirect("Cart.aspx");
        }
    }
}