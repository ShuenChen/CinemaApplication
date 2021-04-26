using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CinemaApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
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

            if (Session["username"] != null)
            {
                string username = Session["username"].ToString();
                double TotalPrice = 0;
                string sqlCountCartStatement = "SELECT COUNT(*) FROM Cart join Ticket on Ticket.TicketId = Cart.TicketId WHERE Cart.Paid = 'No' AND Cart.MemberName ='" + username + "' AND Ticket.available = 'Yes'";

                SqlConnection connection4 = new SqlConnection(connectionString);
                SqlCommand command4 = new SqlCommand(sqlCountCartStatement, connection4);


                connection4.Open();
                int count2 = (int)command4.ExecuteScalar();
                connection4.Close();

                if (count2 < 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Book Ticket First');window.location ='Movie.aspx';", true);
                }
                //string sqlCountCartStatement = "SELECT COUNT(*) FROM Cart";

                //SqlConnection connection2 = new SqlConnection(connectionString);
                //SqlCommand command2 = new SqlCommand(sqlCountCartStatement, connection2);


                //connection.Open();
                //int count = (int)command2.ExecuteScalar();
                //connection2.Close();



                //-------Sql statement parts---------------------------------------------------------
                // write SQL select statement to get all entries from Movie Table
                string sqlSelectStatement = "SELECT CartNum,TicketMovieName,TicketSeat,TicketHall,TicketTime,TicketPrice FROM Cart join Ticket on Ticket.TicketId = Cart.TicketId WHERE Cart.Paid = 'No' AND Cart.MemberName ='" + username + "' AND Ticket.available = 'Yes'";

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

                // Get the DB entries as data sources for grid view
                cartGv.DataSource = dataReader;

                cartGv.DataBind(); ;

                // Close the connection after finish communicating with DB
                dataReader.Close();

                //---------Close connection no need modify------------------------------------------
                // close connection
                connection.Close();


                string sqlSelectStatement2 = "SELECT CartNum,TicketMovieName,TicketSeat,TicketHall,TicketTime,TicketPrice FROM Cart join Ticket on Ticket.TicketId = Cart.TicketId WHERE Cart.Paid = 'No' AND MemberName ='" + username + "' AND Ticket.available = 'Yes'";
                //-------Connect DB no need modify---------------------------------------------------
                // Initialize a connection with DB
                SqlConnection connection2 = new SqlConnection(connectionString);

                //-------Initialize a sql command to execute,can modify------------------------------
                // select ticket Id part
                SqlCommand command2 = new SqlCommand(sqlSelectStatement2, connection2);

                //-------Open connection no need modify----------------------------------------------
                // Open a channel to commmunicate with DB
                connection2.Open();


                // Execute the command and read data from DB
                SqlDataReader dataReader2 = command2.ExecuteReader();

                while (dataReader2.Read())
                { 
                    TotalPrice += Convert.ToDouble(dataReader2["TicketPrice"].ToString());
                }

                totalPrice.Text = TotalPrice.ToString();

                // Close the connection after finish communicating with DB
                dataReader2.Close();

                //---------Close connection no need modify------------------------------------------
                // close connection
                connection2.Close();


                //string sqlDeleteStatement = "DELETE FROM Cart join Ticket on Ticket.TicketId = Cart.TicketId WHERE Cart.Paid = 'No' AND Cart.MemberName ='" + username + "' AND Ticket.available = 'No'";

                //SqlConnection connection5 = new SqlConnection(connectionString);
                //SqlCommand command5 = new SqlCommand(sqlDeleteStatement, connection5);


                //connection5.Open();

                //command5.ExecuteNonQuery();

                //connection5.Close();

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('Kindly Register and Login first');window.location ='MemberLogin.aspx';", true);
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["TotalPrice"] = totalPrice.Text;
            Response.Redirect("Payment.aspx");
        }
    }
}