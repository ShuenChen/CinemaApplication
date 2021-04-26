using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace CinemaApplication1
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        // Initialize connection string for this page to communicate with DB
        string connectionString = Global.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
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

                SqlDataAdapter daImageUpload = new SqlDataAdapter(command);
                SqlDataAdapter da = new SqlDataAdapter(command);
                DataSet dt = new DataSet();
                da.Fill(dt);

                // Execute the command and read data from DB
                SqlDataReader dataReader = command.ExecuteReader();

                // Get the DB entries as data source for grid view
                gvMovie.DataSource = dataReader;

                // Bind the data into grid view
                gvMovie.DataBind();

                // Close the connection after finish communicating with DB
                dataReader.Close();

            }
        }

    }
}