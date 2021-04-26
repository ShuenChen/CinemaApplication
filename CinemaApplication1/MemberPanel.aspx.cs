using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using QRCoder;
using System.Drawing;
using System.IO;
using System.Data;

namespace CinemaApplication1
{
    public partial class WebForm25 : System.Web.UI.Page
    {
        // Initialize connection string for this page to communicate with DB
        string connectionString = Global.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                string formattedOutput = "";
                string username = Session["username"].ToString();
                txtUsername.Text = username;
                ticketMng.Visible = true;
                home.Visible = true;
                memberMng.Visible = false;
                double TotalPrice = 0;

                defaultImg.Visible = false;
                userImg.Visible = false;

                // write SQL select statement to get all entries from Movie Table
                string sqlSelectStatement = "SELECT CartNum,TicketMovieName,TicketSeat,TicketHall,TicketDate,TicketTime,TicketPrice FROM Cart join Ticket on Ticket.TicketId = Cart.TicketId WHERE Cart.Paid = 'Yes' AND Cart.MemberName ='" + username + "'";

                // Initialize a connection with DB
                SqlConnection connection = new SqlConnection(connectionString);

                // Initialize a sql command to execute
                SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

                // Open a channel to commmunicate with DB
                connection.Open();

                // Execute the command and read data from DB
                SqlDataReader dataReader = command.ExecuteReader();

                // Get the DB entries as data source for grid view
                gvTicket.DataSource = dataReader;

                // Bind the data into grid view
                gvTicket.DataBind();

                // Close the connection after finish communicating with DB
                dataReader.Close();

                string commandUserImage = "SELECT userPicPath FROM Member WHERE MemberName = '" + username + "'";

                // Initialize a sql command to execute
                SqlCommand command2 = new SqlCommand(commandUserImage, connection);

                // Execute the command and read data from DB
                SqlDataReader dataReader2 = command2.ExecuteReader();

                while (dataReader2.Read())
                {
                    imagePhoto.ImageUrl = dataReader2[0].ToString();

                }

                if (imagePhoto.ImageUrl != "")
                {
                    defaultImg.Visible = false;
                    userImg.Visible = true;
                }
                else
                {
                    defaultImg.Visible = true;
                    userImg.Visible = false;
                }

                // Close the connection after finish communicating with DB
                dataReader2.Close();
                connection.Close();



            }
            else
            {
                Server.Transfer("MemberLogin.aspx");
            }

        }
        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    home.Visible = true;
        //    ticketMng.Visible = false;
        //    memberMng.Visible = false;
        //}

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid || Page.IsValid)
            {
                string username = Session["username"].ToString();
                string sqlCountCartStatement = "SELECT COUNT(*) FROM Cart join Ticket on Ticket.TicketId = Cart.TicketId WHERE Cart.Paid = 'Yes' AND Cart.MemberName ='" + username + "'";

                SqlConnection connection4 = new SqlConnection(connectionString);
                SqlCommand command4 = new SqlCommand(sqlCountCartStatement, connection4);


                connection4.Open();
                int count2 = (int)command4.ExecuteScalar();
                connection4.Close();

                if (count2 < 1)
                {
                    ticketMng.Visible = false;
                }
                else
                {
                    ticketMng.Visible = true;
                }
                home.Visible = false;
                memberMng.Visible = false;


            }
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid || Page.IsValid)
            {
                home.Visible = false;
                ticketMng.Visible = false;
                memberMng.Visible = true;
                string username = Session["username"].ToString();
                string sqlSelectStatement = "SELECT memberName,memberEmail,dateJoin,forgetPwdQuestion,forgetPwdAnswer FROM Member WHERE memberName = '" + username + "'";

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
                    mmbName.Text = dataReader[0].ToString();
                    mmbEml.Text = dataReader[1].ToString();
                    dateJoin.Text = dataReader[2].ToString();
                    fgtPassQ.Text = dataReader[3].ToString();
                    fgtPassA.Text = dataReader[4].ToString();
                }
                // Close the connection after finish communicating with DB
                dataReader.Close();

                connection.Close();
            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Server.Transfer("Homepage.aspx");
        }

        protected void BrowseUserPic_Click(object sender, EventArgs e)
        {
            Server.Transfer("CaptureImage.aspx");
        }

    }
}