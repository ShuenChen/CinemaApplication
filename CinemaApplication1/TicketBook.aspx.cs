using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CinemaApplication1
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        // Initialize connection string for this page to communicate with DB
        string connectionString = Global.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    Button1.Visible = true;
                    Button2.Visible = false;
                }
                else {
                    Button1.Visible = false;
                    Button2.Visible = true;
                }
                // Get the movie ID from previous page
                string getMovieID = Request.QueryString["MovieId"] ?? "";
                string movieName1 = "";
                // write SQL select statement to get all entries from Movie Table
                string sqlSelectStatement = "SELECT distinct date FROM Ticket WHERE movieId = '" + getMovieID + "' AND available='Yes'";
               
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
                    // Insert the value into moive date from sql and same with the info = movieId
                    movieDate.Items.Add(dataReader.GetSqlString(0).ToString());
                }

                // make sure the movie time got value before user click
                movieDate_SelectedIndexChanged(null, null);

                // Close the connection after finish communicating with DB
                dataReader.Close();

                connection.Close();

                string sqlSelectStatement2 = "SELECT distinct image_path,MovieName FROM Movie WHERE movieId = '" + getMovieID + "'";

                SqlConnection connection2 = new SqlConnection(connectionString);

                SqlCommand command2 = new SqlCommand(sqlSelectStatement2, connection2);

                connection2.Open();

                SqlDataReader dataReader2 = command2.ExecuteReader();
                while (dataReader2.Read())
                {
                    string path = dataReader2.GetSqlString(0).ToString();
                    movieName1 = dataReader2[1].ToString();
                    image.ImageUrl = path;
                }
                movieName.Text = movieName1.ToString();
                dataReader2.Close();

                connection2.Close();

                string sqlSelectStatement3 = "SELECT distinct description FROM Movie WHERE movieId = '" + getMovieID + "'";

                SqlConnection connection3 = new SqlConnection(connectionString);

                SqlCommand command3 = new SqlCommand(sqlSelectStatement3, connection3);

                connection3.Open();

                SqlDataReader dataReader3 = command3.ExecuteReader();
                while (dataReader3.Read())
                {
                    string descrip = dataReader3.GetSqlString(0).ToString();
                    descript.Text = descrip;
                }

                dataReader3.Close();

                connection3.Close();
            }
        }

        protected void movieDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            string getMovieID = Request.QueryString["MovieId"] ?? "";
            // write SQL select statement to get all entries from Movie Table
            string sqlSelectStatement = "SELECT distinct time FROM Ticket WHERE date = '" + movieDate.Text + "' AND movieId = '" + getMovieID + "' AND available = 'Yes'";

            // Initialize a connection with DB
            SqlConnection connection = new SqlConnection(connectionString);

            // Initialize a sql command to execute
            SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

            // Open a channel to commmunicate with DB
            connection.Open();

            // Execute the command and read data from DB
            SqlDataReader dataReader = command.ExecuteReader();
            movieTime.Items.Clear();
            while (dataReader.Read())
            {
                // Insert the value into the movie time dropdown list from database
                movieTime.Items.Add(dataReader.GetSqlString(0).ToString());
            }

            movieTime_SelectedIndexChanged(null, null);

            // Close the connection after finish communicating with DB
            dataReader.Close();

            connection.Close();
        }

        protected void movieTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            string getMovieID = Request.QueryString["MovieId"] ?? "";
            // write SQL select statement to get all entries from Movie Table
            string sqlSelectStatement = "SELECT distinct hall FROM Ticket WHERE date = '" + movieDate.Text + "' AND movieId = '" + getMovieID + "' AND time = '" + movieTime.Text + "' AND available='Yes'";

            // Initialize a connection with DB
            SqlConnection connection = new SqlConnection(connectionString);

            // Initialize a sql command to execute
            SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

            // Open a channel to commmunicate with DB
            connection.Open();

            // Execute the command and read data from DB
            SqlDataReader dataReader = command.ExecuteReader();
            movieHall.Items.Clear();
            while (dataReader.Read())
            {
                // Insert the value into the movie time dropdown list from database
                movieHall.Items.Add(dataReader.GetSqlString(0).ToString());
            }
            movieHall_SelectedIndexChanged(null, null);

            // Close the connection after finish communicating with DB
            dataReader.Close();

            connection.Close();
        }

        protected void movieHall_SelectedIndexChanged(object sender, EventArgs e)
        {
            string getMovieID = Request.QueryString["MovieId"] ?? "";
            // write SQL select statement to get all entries from Movie Table
            string sqlSelectStatement = "SELECT seat FROM Ticket WHERE date = '" + movieDate.Text + "' AND movieId = '" + getMovieID + "' AND time = '" + movieTime.Text + "' AND hall = '" + movieHall.Text + "' AND available = 'Yes'";

            // Initialize a connection with DB
            SqlConnection connection = new SqlConnection(connectionString);

            // Initialize a sql command to execute
            SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

            // Open a channel to commmunicate with DB
            connection.Open();

            // Execute the command and read data from DB
            SqlDataReader dataReader = command.ExecuteReader();
            movieSeat.Items.Clear();
            while (dataReader.Read())
            {
                // Insert the value into the movie time dropdown list from database
                movieSeat.Items.Add(dataReader.GetSqlInt32(0).ToString());
            }
            // Close the connection after finish communicating with DB
            dataReader.Close();

            connection.Close();

            string sqlSelectStatement2 = "SELECT distinct price FROM Ticket WHERE date = '" + movieDate.Text + "' AND time = '" + movieTime.Text + "'";

            SqlConnection connection2 = new SqlConnection(connectionString);

            SqlCommand command2 = new SqlCommand(sqlSelectStatement2, connection2);

            connection2.Open();

            SqlDataReader dataReader2 = command2.ExecuteReader();
            while (dataReader2.Read())
            {
                string tprice = dataReader2.GetSqlString(0).ToString();
                price.Text = tprice;
            }
            dataReader2.Close();

            connection2.Close();
        }
 

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Get the movie ID from previous page
                string getMovieID = Request.QueryString["MovieId"] ?? "";
                string getMovieName = movieName.Text.ToString();
                string getMoviePrice = price.Text.ToString();
                string getMovieHall = movieHall.SelectedValue.ToString();
                string getMovieSeat = movieSeat.SelectedValue.ToString();
                string getMovieDate = movieDate.SelectedValue.ToString();
                string getMovieTime = movieTime.SelectedValue.ToString();
                string getTicketID1 = "";
                string getTicketPaid = "No";
                string paidDate = "No";
                string paidAmount = "No";
                string getMemberName = Session["username"].ToString();
                Session["ticketHall"] = getMovieHall;
                Session["ticketSeat"] = getMovieSeat;
                Session["ticketDate"] = getMovieDate;
                Session["ticketTime"] = getMovieTime;
                Session["movieId"] = getMovieID;

                //-------Sql statement parts---------------------------------------------------------
                // write SQL select statement to get all entries from Movie Table
                string sqlSelectStatement = "SELECT TicketId FROM Ticket WHERE movieId = '" + getMovieID + "' AND hall ='" + getMovieHall + "' AND seat ='" + getMovieSeat + "' AND date='" + getMovieDate + "' AND time ='" + getMovieTime + "' AND available='Yes'";

                //-------Connect DB no need modify---------------------------------------------------
                // Initialize a connection with DB
                SqlConnection connection = new SqlConnection(connectionString);

                //-------Initialize a sql command to execute,can modify------------------------------
                // select ticket Id part
                SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

                //-------Open connection no need modify----------------------------------------------
                // Open a channel to commmunicate with DB
                connection.Open();


                // Execute the command and read data from DB
                SqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    getTicketID1 = dataReader[0].ToString();
                    Session["ticketId"] = dataReader[0].ToString();
                }

                // Close the connection after finish communicating with DB
                dataReader.Close();

                //---------Close connection no need modify------------------------------------------
                // close connection
                connection.Close();

                string sqlCountCartStatement = "SELECT COUNT(*) FROM Cart WHERE MemberName = '" + getMemberName + "'";

                SqlConnection connection4 = new SqlConnection(connectionString);
                SqlCommand command4 = new SqlCommand(sqlCountCartStatement, connection4);


                connection4.Open();
                int count2 = (int)command4.ExecuteScalar();
                connection4.Close();


                string sqlValidateStatement = "SELECT COUNT(*) FROM Cart WHERE TicketId = @ticketID AND MemberName = '" + getMemberName + "'";

                SqlConnection connection3 = new SqlConnection(connectionString);
                SqlCommand command3 = new SqlCommand(sqlValidateStatement, connection3);
                command3.Parameters.AddWithValue("@ticketID", getTicketID1);

                connection3.Open();
                int count = (int)command3.ExecuteScalar();
                connection3.Close();

                if (count > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "alertAlreadyAddToCart()", true);
                }
                else
                {

                    //-------Sql statement parts---------------------------------------------------------
                    // write SQL select statement to get all entries from Movie Table
                    string sqlInsertCartStatement = @"INSERT INTO Cart VALUES(@CartId,@CartNum,@TicketId,@MemberName,@TicketMovieName,@TicketPrice,@TicketSeat,@TicketHall,@TicketTime,@Paid,@TicketDate,@PaidDate)";
                    count2++;
                    //-------Connect DB no need modify---------------------------------------------------
                    // Initialize a connection with DB
                    SqlConnection connection2 = new SqlConnection(connectionString);

                    //-------Initialize a sql command to execute,can modify------------------------------
                    // insert cart part
                    SqlCommand command2 = new SqlCommand(sqlInsertCartStatement, connection2);

                    //-------Open connection no need modify----------------------------------------------
                    // Open a channel to commmunicate with DB
                    connection2.Open();
                    command2.Parameters.AddWithValue("@CartId", getTicketID1 + getMemberName);
                    command2.Parameters.AddWithValue("@CartNum", count2.ToString());
                    command2.Parameters.AddWithValue("@TicketId", getTicketID1);
                    command2.Parameters.AddWithValue("@MemberName", getMemberName);
                    command2.Parameters.AddWithValue("@TicketMovieName", getMovieName);
                    command2.Parameters.AddWithValue("@TicketPrice", getMoviePrice);
                    command2.Parameters.AddWithValue("@TicketSeat", getMovieSeat);
                    command2.Parameters.AddWithValue("@TicketHall", getMovieHall);
                    command2.Parameters.AddWithValue("@TicketTime", getMovieTime);
                    command2.Parameters.AddWithValue("@Paid", getTicketPaid);
                    command2.Parameters.AddWithValue("@TicketDate", getMovieDate);
                    command2.Parameters.AddWithValue("@PaidDate", paidDate);
                    command2.ExecuteNonQuery();

                    //---------Close connection no need modify------------------------------------------
                    // close connection
                    connection2.Close();

                    ClientScript.RegisterStartupScript(this.GetType(), "", "alertAddToCart()", true);
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberLogin.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movie.aspx");
        }
    }
}