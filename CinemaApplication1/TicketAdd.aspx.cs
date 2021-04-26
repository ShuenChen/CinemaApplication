using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CinemaApplication1
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        // Initialize connection string for this page to communicate with DB
        string connectionString = Global.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                //set a barrier
                bool found = false;

                string getMovieID = Request.QueryString["MovieId"] ?? "";
                string movieNameLbl = "";
                lblTicketID.Text = getMovieID;
                string sqlSelectStatement = "SELECT * FROM Movie WHERE MovieId = @ShowMovieId";

                SqlConnection connection = new SqlConnection(connectionString);
                SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

                command.Parameters.AddWithValue("@ShowMovieId", getMovieID);

                connection.Open();


                SqlDataReader dataReader = command.ExecuteReader();

                if (dataReader.Read())
                {

                    found = true;
                    imagePhoto.ImageUrl = (string)dataReader["image_path"];
                    movieNameLbl = dataReader["MovieName"].ToString();
                }

                movieName.Text = movieNameLbl.ToString();
                dataReader.Close();

                connection.Close();

                if (!found)
                {

                    Response.Redirect("MovieDetails.aspx");
                }
            }
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            // Make sure all input are valid
            if (Page.IsValid)
            {
                // Get the movie ID from previous page
                string getMovieID = Request.QueryString["MovieId"] ?? "";

                string mHall = hall.SelectedValue;
                string seatNo = seat.Text;
                int seatInsert = int.Parse(seat.Text);
                string mDate = date.Text.ToString();
                string mTime = time.Text.ToString();
                string mAvailable = "Yes";
                string mPrice = price.Text;
                //string mDate = DateTime.Parse(date.Text).ToString();
                //string mTime = time.Text;
                for (int i = 1; i <= seatInsert; i++)
                {
                    // Prepare SSQL insert statement
                    string sqlInsertStatement = @"INSERT INTO Ticket (TicketId, seat, hall, time, movieId, date, available, price) VALUES (@ticketId, @ticketSeat, @ticketHall, @ticketTime, @movieId, @ticketDate, @ticketAvailable, @ticketPrice)";
                    string ticketSeat = i.ToString();
                    if (ticketSeat.Length < 2)
                    {
                        ticketSeat = "0" + ticketSeat;
                    }
                    // Initialize a connection with DB
                    SqlConnection connection = new SqlConnection(connectionString);

                    // Initialize a sql command to execute
                    SqlCommand command = new SqlCommand(sqlInsertStatement, connection);

                    string ticketID = getMovieID + mHall + ticketSeat + mTime + mDate;
                    command.Parameters.AddWithValue("@ticketId", ticketID);
                    command.Parameters.AddWithValue("@ticketSeat", i);
                    command.Parameters.AddWithValue("@ticketHall", mHall);
                    command.Parameters.AddWithValue("@movieId", getMovieID);
                    command.Parameters.AddWithValue("@ticketTime", mTime);
                    command.Parameters.AddWithValue("@ticketDate", mDate);
                    command.Parameters.AddWithValue("@ticketAvailable", mAvailable);
                    command.Parameters.AddWithValue("@ticketPrice", mPrice);

                    // open connection to communicate with DB
                    connection.Open();

                    // execute insert statement,it also can use to uodate and delete
                    command.ExecuteNonQuery();

                    // close connection after communication with DB
                    connection.Close();
                }
                // redirect to another page to show updated data
                Response.Redirect("Ticket.aspx?MovieId=" + getMovieID);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            string getMovieID = Request.QueryString["MovieId"] ?? "";

            Server.Transfer("Ticket.aspx?MovieId=" + getMovieID);
        }
    }
}