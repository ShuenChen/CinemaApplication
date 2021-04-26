using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;

namespace CinemaApplication1
{
    public partial class WebForm22 : System.Web.UI.Page
    {
        // Initialize connection string for this page to communicate with DB
        string connectionString = Global.connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] != null)
            {
                string reportType = Request.QueryString["report"] ?? "";
                string username = Session["adminname"].ToString();
                double TotalIncome = 0;
                double MonthIncome = 0;
                string ThisMonth = DateTime.Now.ToString("yyyy-MM");
                
                txtUsername.Text = username;
                movieMng.Visible = false;
                home.Visible = true;
                adminMng.Visible = false;
                Calendar1.Visible = true;

                if (reportType == "normal" || reportType == "")
                {
                    // Prepare SQL statement
                    string sqlSelectStatement = "SELECT COUNT(*) FROM Member";

                    // Initialize a connection with DB
                    SqlConnection connection = new SqlConnection(connectionString);

                    // Initialize a sql command to execute
                    SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

                    // Open the connection after commucating with DB
                    connection.Open();

                    // Execute the sql command and get the number of entries
                    int count = (int)command.ExecuteScalar();

                    // If the student ID exist in the database

                    box1Value.Text = count.ToString();


                    // Prepare SQL statement
                    string sqlSelectStatement2 = "SELECT COUNT(*) FROM Movie";

                    // Initialize a connection with DB
                    SqlConnection connection2 = new SqlConnection(connectionString);

                    // Initialize a sql command to execute
                    SqlCommand command2 = new SqlCommand(sqlSelectStatement2, connection2);

                    // Open the connection after commucating with DB
                    connection2.Open();

                    // Execute the sql command and get the number of entries
                    int count2 = (int)command2.ExecuteScalar();

                    // If the student ID exist in the database

                    box2Value.Text = count2.ToString();


                    string sqlSelectStatement3 = "SELECT TicketPrice FROM Cart WHERE Paid = 'Yes' AND PaidDate LIKE '" + ThisMonth + "%'";
                    //-------Connect DB no need modify---------------------------------------------------
                    // Initialize a connection with DB
                    SqlConnection connection3 = new SqlConnection(connectionString);

                    //-------Initialize a sql command to execute,can modify------------------------------
                    // select ticket Id part
                    SqlCommand command3 = new SqlCommand(sqlSelectStatement3, connection3);

                    //-------Open connection no need modify----------------------------------------------
                    // Open a channel to commmunicate with DB
                    connection3.Open();


                    // Execute the command and read data from DB
                    SqlDataReader dataReader3 = command3.ExecuteReader();

                    while (dataReader3.Read())
                    {
                        MonthIncome += Convert.ToDouble(dataReader3["TicketPrice"].ToString());
                    }

                    box3Value.Text = MonthIncome.ToString();

                    // Close the connection after finish communicating with DB
                    dataReader3.Close();

                    //---------Close connection no need modify------------------------------------------
                    // close connection
                    connection3.Close();



                    string sqlSelectStatement4 = "SELECT TicketPrice FROM Cart WHERE Paid = 'Yes'";
                    //-------Connect DB no need modify---------------------------------------------------
                    // Initialize a connection with DB
                    SqlConnection connection4 = new SqlConnection(connectionString);

                    //-------Initialize a sql command to execute,can modify------------------------------
                    // select ticket Id part
                    SqlCommand command4 = new SqlCommand(sqlSelectStatement4, connection4);

                    //-------Open connection no need modify----------------------------------------------
                    // Open a channel to commmunicate with DB
                    connection4.Open();


                    // Execute the command and read data from DB
                    SqlDataReader dataReader4 = command4.ExecuteReader();

                    while (dataReader4.Read())
                    {
                        TotalIncome += Convert.ToDouble(dataReader4["TicketPrice"].ToString());
                    }

                    box4Value.Text = TotalIncome.ToString();

                    // Close the connection after finish communicating with DB
                    dataReader4.Close();

                    //---------Close connection no need modify------------------------------------------
                    // close connection
                    connection4.Close();

                    box1.Text = "Total Member";
                    box2.Text = "Total Movie";
                    box3.Text = "This Month Income(RM)";
                    box4.Text = "Total Income(RM)";
                }
                else if (reportType == "day")
                {
                    box1.Text = "Total New Member";
                    box2.Text = "Total New Movie";
                    box3.Text = "Total Ticket Sold(RM)";
                    box4.Text = "Total Income(RM)";
                    if (Session["dateReport"] != null)
                    {
                        // Prepare SQL statement
                        string sqlSelectStatement5 = "SELECT COUNT(*) FROM Member WHERE dateJoin = '" + Session["dateReport"].ToString() + "'";

                        // Initialize a connection with DB
                        SqlConnection connection5 = new SqlConnection(connectionString);

                        // Initialize a sql command to execute
                        SqlCommand command5 = new SqlCommand(sqlSelectStatement5, connection5);

                        // Open the connection after commucating with DB
                        connection5.Open();

                        // Execute the sql command and get the number of entries
                        int count = (int)command5.ExecuteScalar();

                        // If the student ID exist in the database

                        box1Value.Text = count.ToString();

                        // Prepare SQL statement
                        string sqlSelectStatement6 = "SELECT COUNT(*) FROM Movie WHERE MovieDate = '" + Session["dateReport"].ToString() + "'";

                        // Initialize a connection with DB
                        SqlConnection connection6 = new SqlConnection(connectionString);

                        // Initialize a sql command to execute
                        SqlCommand command6 = new SqlCommand(sqlSelectStatement6, connection6);

                        // Open the connection after commucating with DB
                        connection6.Open();

                        // Execute the sql command and get the number of entries
                        int count2 = (int)command6.ExecuteScalar();

                        // If the student ID exist in the database

                        box2Value.Text = count2.ToString();

                        // Prepare SQL statement
                        string sqlSelectStatement7 = "SELECT COUNT(*) FROM Cart WHERE PaidDate='" + Session["dateReport"].ToString() + "' AND Paid = 'Yes'";

                        // Initialize a connection with DB
                        SqlConnection connection7 = new SqlConnection(connectionString);

                        // Initialize a sql command to execute
                        SqlCommand command7 = new SqlCommand(sqlSelectStatement7, connection7);

                        // Open the connection after commucating with DB
                        connection7.Open();

                        // Execute the sql command and get the number of entries
                        int count3 = (int)command7.ExecuteScalar();

                        // If the student ID exist in the database

                        box3Value.Text = count3.ToString();

                        string sqlSelectStatement4 = "SELECT TicketPrice FROM Cart WHERE Paid = 'Yes' AND PaidDate='" + Session["dateReport"].ToString() + "'";
                        //-------Connect DB no need modify---------------------------------------------------
                        // Initialize a connection with DB
                        SqlConnection connection4 = new SqlConnection(connectionString);

                        //-------Initialize a sql command to execute,can modify------------------------------
                        // select ticket Id part
                        SqlCommand command4 = new SqlCommand(sqlSelectStatement4, connection4);

                        //-------Open connection no need modify----------------------------------------------
                        // Open a channel to commmunicate with DB
                        connection4.Open();


                        // Execute the command and read data from DB
                        SqlDataReader dataReader4 = command4.ExecuteReader();

                        while (dataReader4.Read())
                        {
                            TotalIncome += Convert.ToDouble(dataReader4["TicketPrice"].ToString());
                        }

                        box4Value.Text = TotalIncome.ToString();

                        // Close the connection after finish communicating with DB
                        dataReader4.Close();
                    }
                }
                else if (reportType == "month")
                {
                    box1.Text = "Total New Member";
                    box2.Text = "Total New Movie";
                    box3.Text = "Total Ticket Sold(RM)";
                    box4.Text = "Total Income(RM)";
                    if (Session["dateReport2"] != null)
                    {
                        // Prepare SQL statement
                        string sqlSelectStatement5 = "SELECT COUNT(*) FROM Member WHERE dateJoin LIKE '" + Session["dateReport2"].ToString() + "%'";

                        // Initialize a connection with DB
                        SqlConnection connection5 = new SqlConnection(connectionString);

                        // Initialize a sql command to execute
                        SqlCommand command5 = new SqlCommand(sqlSelectStatement5, connection5);

                        // Open the connection after commucating with DB
                        connection5.Open();

                        // Execute the sql command and get the number of entries
                        int count = (int)command5.ExecuteScalar();

                        // If the student ID exist in the database

                        box1Value.Text = count.ToString();

                        // Prepare SQL statement
                        string sqlSelectStatement6 = "SELECT COUNT(*) FROM Movie WHERE MovieDate LIKE '" + Session["dateReport2"].ToString() + "%'";

                        // Initialize a connection with DB
                        SqlConnection connection6 = new SqlConnection(connectionString);

                        // Initialize a sql command to execute
                        SqlCommand command6 = new SqlCommand(sqlSelectStatement6, connection6);

                        // Open the connection after commucating with DB
                        connection6.Open();

                        // Execute the sql command and get the number of entries
                        int count2 = (int)command6.ExecuteScalar();

                        // If the student ID exist in the database

                        box2Value.Text = count2.ToString();

                        // Prepare SQL statement
                        string sqlSelectStatement7 = "SELECT COUNT(*) FROM Cart WHERE PaidDate LIKE '" + Session["dateReport2"].ToString() + "%' AND Paid = 'Yes'";

                        // Initialize a connection with DB
                        SqlConnection connection7 = new SqlConnection(connectionString);

                        // Initialize a sql command to execute
                        SqlCommand command7 = new SqlCommand(sqlSelectStatement7, connection7);

                        // Open the connection after commucating with DB
                        connection7.Open();

                        // Execute the sql command and get the number of entries
                        int count3 = (int)command7.ExecuteScalar();

                        // If the student ID exist in the database

                        box3Value.Text = count3.ToString();

                        string sqlSelectStatement4 = "SELECT TicketPrice FROM Cart WHERE Paid = 'Yes' AND PaidDate LIKE '" + Session["dateReport2"].ToString() + "%'";
                        //-------Connect DB no need modify---------------------------------------------------
                        // Initialize a connection with DB
                        SqlConnection connection4 = new SqlConnection(connectionString);

                        //-------Initialize a sql command to execute,can modify------------------------------
                        // select ticket Id part
                        SqlCommand command4 = new SqlCommand(sqlSelectStatement4, connection4);

                        //-------Open connection no need modify----------------------------------------------
                        // Open a channel to commmunicate with DB
                        connection4.Open();


                        // Execute the command and read data from DB
                        SqlDataReader dataReader4 = command4.ExecuteReader();

                        while (dataReader4.Read())
                        {
                            TotalIncome += Convert.ToDouble(dataReader4["TicketPrice"].ToString());
                        }

                        box4Value.Text = TotalIncome.ToString();

                        // Close the connection after finish communicating with DB
                        dataReader4.Close();
                    }
                }
                else if (reportType == "year") {
                    box1.Text = "Total New Member";
                    box2.Text = "Total New Movie";
                    box3.Text = "Total Ticket Sold(RM)";
                    box4.Text = "Total Income(RM)";
                    if (Session["dateReport3"] != null)
                    {
                        // Prepare SQL statement
                        string sqlSelectStatement5 = "SELECT COUNT(*) FROM Member WHERE dateJoin LIKE '" + Session["dateReport3"].ToString() + "%'";

                        // Initialize a connection with DB
                        SqlConnection connection5 = new SqlConnection(connectionString);

                        // Initialize a sql command to execute
                        SqlCommand command5 = new SqlCommand(sqlSelectStatement5, connection5);

                        // Open the connection after commucating with DB
                        connection5.Open();

                        // Execute the sql command and get the number of entries
                        int count = (int)command5.ExecuteScalar();

                        // If the student ID exist in the database

                        box1Value.Text = count.ToString();

                        // Prepare SQL statement
                        string sqlSelectStatement6 = "SELECT COUNT(*) FROM Movie WHERE MovieDate LIKE '" + Session["dateReport3"].ToString() + "%'";

                        // Initialize a connection with DB
                        SqlConnection connection6 = new SqlConnection(connectionString);

                        // Initialize a sql command to execute
                        SqlCommand command6 = new SqlCommand(sqlSelectStatement6, connection6);

                        // Open the connection after commucating with DB
                        connection6.Open();

                        // Execute the sql command and get the number of entries
                        int count2 = (int)command6.ExecuteScalar();

                        // If the student ID exist in the database

                        box2Value.Text = count2.ToString();

                        // Prepare SQL statement
                        string sqlSelectStatement7 = "SELECT COUNT(*) FROM Cart WHERE PaidDate LIKE '" + Session["dateReport3"].ToString() + "%' AND Paid = 'Yes'";

                        // Initialize a connection with DB
                        SqlConnection connection7 = new SqlConnection(connectionString);

                        // Initialize a sql command to execute
                        SqlCommand command7 = new SqlCommand(sqlSelectStatement7, connection7);

                        // Open the connection after commucating with DB
                        connection7.Open();

                        // Execute the sql command and get the number of entries
                        int count3 = (int)command7.ExecuteScalar();

                        // If the student ID exist in the database

                        box3Value.Text = count3.ToString();

                        string sqlSelectStatement4 = "SELECT TicketPrice FROM Cart WHERE Paid = 'Yes' AND PaidDate LIKE '" + Session["dateReport3"].ToString() + "%'";
                        //-------Connect DB no need modify---------------------------------------------------
                        // Initialize a connection with DB
                        SqlConnection connection4 = new SqlConnection(connectionString);

                        //-------Initialize a sql command to execute,can modify------------------------------
                        // select ticket Id part
                        SqlCommand command4 = new SqlCommand(sqlSelectStatement4, connection4);

                        //-------Open connection no need modify----------------------------------------------
                        // Open a channel to commmunicate with DB
                        connection4.Open();


                        // Execute the command and read data from DB
                        SqlDataReader dataReader4 = command4.ExecuteReader();

                        while (dataReader4.Read())
                        {
                            TotalIncome += Convert.ToDouble(dataReader4["TicketPrice"].ToString());
                        }

                        box4Value.Text = TotalIncome.ToString();

                        // Close the connection after finish communicating with DB
                        dataReader4.Close();
                    }
                }
            }
            else
            {
                Server.Transfer("MemberLogin.aspx");
            }


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            home.Visible = true;
            movieMng.Visible = false;
            adminMng.Visible = false;
            Calendar1.Visible = true;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid || Page.IsValid)
            {
                home.Visible = false;
                movieMng.Visible = true;
                adminMng.Visible = false;
                Calendar1.Visible = false;
            }
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid || Page.IsValid)
            {
                home.Visible = false;
                movieMng.Visible = false;
                adminMng.Visible = true;
                Calendar1.Visible = false;
            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Server.Transfer("Homepage.aspx");
        }

        protected void confirmReport_Click(object sender, EventArgs e)
        {
            Session["dateReport"] = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Session["dateReport2"] = Calendar1.SelectedDate.ToString("yyyy-MM");
            Session["dateReport3"] = Calendar1.SelectedDate.ToString("yyyy");
            string report = reportChoice.SelectedValue.ToString();
            Response.Redirect("AdminPanel.aspx?report=" + report);
        }
    }
}