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
    public partial class WebForm7 : System.Web.UI.Page
    {
        // Initialize connection string for this page to communicate with DB
        string connectionString = Global.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Set the value of user input for ID
            string movieID = args.Value;

            // Prepare SQL statement
            string sqlSelectStatement = "SELECT COUNT(*) FROM Movie WHERE MovieId = @movieId";

            // Initialize a connection with DB
            SqlConnection connection = new SqlConnection(connectionString);

            // Initialize a sql command to execute
            SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

            command.Parameters.AddWithValue("@movieId", movieID);

            // Open the connection after commucating with DB
            connection.Open();

            // Execute the sql command and get the number of entries
            int count = (int)command.ExecuteScalar();

            // If the student ID exist in the database
            if (count > 0)
            {
                args.IsValid = false;
            }
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            // Make sure all input are valid
            if (Page.IsValid)
            {

                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/images/" + fileName));

                // Get all user input
                string movieID = movieId.Text;
                string mName = movieName.Text;
                string mLanguage = movieLanguage.SelectedValue;
                string mHour = movieHour.Text;
                string mType = movieType.SelectedValue;
                string mCategory = movieCategory.SelectedValue;
                string mDescription = tdescription.Value;
                string mDate = DateTime.Now.ToString("yyyy-MM-dd");
                // Prepare SSQL insert statement
                string sqlInsertStatement = @"INSERT INTO Movie (MovieId,image_path, MovieName, MovieLanguage, MovieHour, MovieDate, MovieType, Category, Description) VALUES (@movieID,@image_path, @mName, @mLanguage, @mHour, @mDate, @mType,@Category, @description)";

                // Initialize a connection with DB
                SqlConnection connection = new SqlConnection(connectionString);

                // Initialize a sql command to execute
                SqlCommand command = new SqlCommand(sqlInsertStatement, connection);

                command.Parameters.AddWithValue("@movieID", movieID);
                command.Parameters.AddWithValue("@image_path", "~/images/" + fileName);
                command.Parameters.AddWithValue("@mName", mName);
                command.Parameters.AddWithValue("@mLanguage", mLanguage);
                command.Parameters.AddWithValue("@mHour", mHour);
                command.Parameters.AddWithValue("@mDate", mDate);
                command.Parameters.AddWithValue("@mType", mType);
                command.Parameters.AddWithValue("@Category", mCategory);
                command.Parameters.AddWithValue("@description", mDescription);

                // open connection to communicate with DB
                connection.Open();

                // execute insert statement,it also can use to uodate and delete
                command.ExecuteNonQuery();

                // close connection after communication with DB
                connection.Close();

                // redirect to another page to show updated data
                Response.Redirect("MovieDetails.aspx");
            }
        }

        protected void CustomValidator7_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (movieName.Text != null)
            {
                if (Regex.Matches(((string)movieName.Text), @"[*&%#@$^!]").Count > 0)
                {

                    args.IsValid = false;

                }
                else
                {
                    args.IsValid = true;
                }
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (movieId.Text != null)
            {
                if (Regex.Matches(((string)movieId.Text), @"[*&%#@$^!]").Count > 0)
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