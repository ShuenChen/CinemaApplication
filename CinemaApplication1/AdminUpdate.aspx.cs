using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;

namespace CinemaApplication1
{
    public partial class WebForm12 : System.Web.UI.Page
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
                    txtMovieName.Text = (string)dataReader["MovieName"];
                    ddlMovieLanguage.SelectedValue = (string)dataReader["MovieLanguage"];
                    txtMovieHour.Text = (string)dataReader["MovieHour"];
                    ddlMovieType.SelectedValue = (string)dataReader["MovieType"];
                    ddlmovieCategory.SelectedValue = (string)dataReader["Category"];
                    tdescription.Value = (string)dataReader["Description"];
                }


                dataReader.Close();

                connection.Close();

                if (!found)
                {

                    Response.Redirect("MovieDetails.aspx");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/images/" + fileName));
                string showMovieId = lblMovieId.Text;
                string movieName = txtMovieName.Text;
                string movieLanguage = ddlMovieLanguage.SelectedValue;
                string movieHour = txtMovieHour.Text;
                string movieType = ddlMovieType.SelectedValue;
                string movieCategory = ddlmovieCategory.SelectedValue;
                string mdescription = tdescription.Value;

                string sqlUpdateStatement = @"UPDATE Movie SET image_path = @image_path , MovieName = @MovieName , MovieLanguage = @MovieLanguage , MovieHour = @MovieHour , MovieType = @MovieType, Category= @movieCategory, Description= @description WHERE MovieId = @ShowMovieId";

                SqlConnection connection = new SqlConnection(connectionString);
                SqlCommand command = new SqlCommand(sqlUpdateStatement, connection);

                command.Parameters.AddWithValue("@image_path", "~/images/" + fileName);
                command.Parameters.AddWithValue("@MovieName", movieName);
                command.Parameters.AddWithValue("@MovieLanguage", movieLanguage);
                command.Parameters.AddWithValue("@MovieHour", movieHour);
                command.Parameters.AddWithValue("@MovieType", movieType);

                command.Parameters.AddWithValue("@ShowMovieId", showMovieId);
                command.Parameters.AddWithValue("@movieCategory", movieCategory);
                command.Parameters.AddWithValue("@description", mdescription);


                connection.Open();

                command.ExecuteNonQuery();

                connection.Close();
                Response.Redirect("MovieDetails.aspx");

            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovieDetails.aspx");
        }

        protected void CustomValidator7_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (txtMovieName.Text != null)
            {
                if (Regex.Matches(((string)txtMovieName.Text), @"[*&%#@$^!]").Count > 0)
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