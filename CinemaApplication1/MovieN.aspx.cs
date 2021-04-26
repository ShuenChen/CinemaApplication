using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Data;

namespace CinemaApplication1
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        // Initialize connection string for this page to communicate with DB
        string connectionString = Global.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //This one if for delete the session when user is leave the forget password page, please keep it
            if (Session["forgetPwdName"] != null)
            {
                Session.Remove("forgetPwdName");
            }

            if (!Page.IsPostBack)
            {
                // write SQL select statement to get all entries from Movie Table
                string sqlSelectStatement = "SELECT * FROM Movie";

                // Initialize a connection with DB
                SqlConnection connection = new SqlConnection(connectionString);

                // Initialize a sql command to execute
                SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

                // Open a channel to commmunicate with DB
                connection.Open();

                // Execute the command and read data from DB
                SqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    Session["movieName"] = dataReader[1];
                }
                // Close the connection after finish communicating with DB
                dataReader.Close();

                connection.Close();

                BindDatalist();
            }
        }
        public void BindDatalist()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand commandImageUpload = new SqlCommand("SELECT distinct Movie.MovieName,Movie.MovieId,Movie.image_path FROM Movie LEFT JOIN Ticket ON Movie.MovieId = Ticket.movieId WHERE Ticket.available = 'Yes' AND Movie.Category='N'", connection);
            connection.Open();
            SqlDataAdapter daImageUpload = new SqlDataAdapter(commandImageUpload);
            SqlDataAdapter da = new SqlDataAdapter(commandImageUpload);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string searchText = TextBox1.Text;
            DataList1.DataSource = null;
            DataList1.DataBind();

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand commandImageUpload = new SqlCommand("SELECT distinct Movie.MovieName,Movie.MovieId,Movie.image_path FROM Movie LEFT JOIN Ticket ON Movie.MovieId = Ticket.movieId WHERE Ticket.available = 'Yes' AND Movie.MovieName LIKE '%" + searchText + "%'", connection);
            connection.Open();
            SqlDataAdapter daImageUpload = new SqlDataAdapter(commandImageUpload);
            SqlDataAdapter da = new SqlDataAdapter(commandImageUpload);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();

            connection.Close();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string searchText = TextBox1.Text;
            DataList1.DataSource = null;
            DataList1.DataBind();

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand commandImageUpload = new SqlCommand("SELECT distinct Movie.MovieName,Movie.MovieId,Movie.image_path FROM Movie LEFT JOIN Ticket ON Movie.MovieId = Ticket.movieId WHERE Ticket.available = 'Yes' AND Movie.MovieName LIKE '%" + searchText + "%'", connection);
            connection.Open();
            SqlDataAdapter daImageUpload = new SqlDataAdapter(commandImageUpload);
            SqlDataAdapter da = new SqlDataAdapter(commandImageUpload);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();

            connection.Close();
        }
    }
}