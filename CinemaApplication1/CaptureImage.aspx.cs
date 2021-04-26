using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Services;
using System.Data.SqlClient;


namespace CinemaApplication1
{
    public partial class WebForm30 : System.Web.UI.Page
    {
        public const string connectionString = @"
            Data Source=(LocalDB)\mssqllocaldb;
            AttachDbFilename=|DataDirectory|\Cinema.mdf;
            Integrated Security=True";

        [WebMethod()]
        public static bool SaveCapturedImage(string data)
        {
            string fileName = HttpContext.Current.Session["username"].ToString();

            //Convert Base64 Encoded string to Byte Array.
            byte[] imageBytes = Convert.FromBase64String(data.Split(',')[1]);

            //Save the Byte Array as Image File.
            string filePath = HttpContext.Current.Server.MapPath(string.Format("~/UserPic/{0}.jpg", fileName));
            File.WriteAllBytes(filePath, imageBytes);

            string sql = @"UPDATE Member SET userPicPath=@userpicpath WHERE memberName = '" + fileName + "'";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@userpicpath", "~/UserPic/" + fileName + ".jpg");

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            return true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userName = Session["username"].ToString();

            string sql = @"UPDATE Member SET userPicPath=@userpicpath WHERE memberName = '" + userName + "'";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@userpicpath", "");
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

       
    }

}