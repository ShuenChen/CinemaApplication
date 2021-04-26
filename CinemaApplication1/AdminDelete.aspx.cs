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
    public partial class WebForm13 : System.Web.UI.Page
    {
        string connectionString = Global.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //set a barrier
                bool found = false;

                string showMovieId = Request.QueryString["MovieId"] ?? "";

                string sqlSelectStatement = "SELECT * FROM Movie WHERE MovieId = @ShowMovieId";

                SqlConnection connection = new SqlConnection(connectionString);
                SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

                command.Parameters.AddWithValue("@ShowMovieId", showMovieId);

                connection.Open();


                SqlDataReader dataReader = command.ExecuteReader();

                if (dataReader.Read())
                {

                    found = true;
                    lblMovieId.Text = (string)dataReader["MovieId"];
                    imagePhoto.ImageUrl = (string)dataReader["image_path"];
                    lblMovieName.Text = (string)dataReader["MovieName"];
                    lblMovieLanguage.Text = (string)dataReader["MovieLanguage"];
                    lblMovieHour.Text = (string)dataReader["MovieHour"];
                    lblMovieType.Text = (string)dataReader["MovieType"];
                    lblCategory.Text = (string)dataReader["Category"];
                }


                dataReader.Close();

                connection.Close();

                if (!found)
                {

                    Response.Redirect("MovieDetails.aspx");
                }
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string showMovieId = lblMovieId.Text;

            string sqlDeleteStatement = "DELETE FROM Movie WHERE MovieId = @showMovieId";

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sqlDeleteStatement, connection);

            command.Parameters.AddWithValue("@ShowMovieId", showMovieId);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();
            Response.Redirect("MovieDetails.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovieDetails.aspx");
        }
    }
}