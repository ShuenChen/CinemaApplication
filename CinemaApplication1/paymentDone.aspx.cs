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
    public partial class WebForm19 : System.Web.UI.Page
    {

        string connectionString = Global.connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderNo = Session["OrderNo"].ToString();
            string username = Session["username"].ToString();
            string TotalPrice = Session["TotalPrice"].ToString();
            string orderValidate = Request.QueryString["order"].ToString();
            string paidDate = DateTime.Now.ToString("yyyy-MM-dd");
            if (orderValidate == orderNo)
            {
                //string sqlUpdateStatement = @"UPDATE Cart SET Paid = @Paid WHERE MemberName = '" + username + "'";
                string sqlUpdateStatement = @"UPDATE Cart SET Paid = @Paid, PaidDate = @paidDate WHERE MemberName = '" + username + "' AND Paid = 'No'";

                SqlConnection connection = new SqlConnection(connectionString);
                SqlCommand command = new SqlCommand(sqlUpdateStatement, connection);

                command.Parameters.AddWithValue("@Paid", "Yes");
                command.Parameters.AddWithValue("@paidDate", paidDate);
                connection.Open();

                command.ExecuteNonQuery();

                connection.Close();



                string sqlUpdateStatement2 = @"UPDATE Ticket SET available = @Available FROM Ticket join Cart on Ticket.TicketId = Cart.TicketId WHERE MemberName = '" + username + "'";

                SqlConnection connection2 = new SqlConnection(connectionString);
                SqlCommand command2 = new SqlCommand(sqlUpdateStatement2, connection2);

                command2.Parameters.AddWithValue("@Available", "No");

                connection2.Open();

                command2.ExecuteNonQuery();

                connection2.Close();



                //// Prepare SQL statement
                //string sqlSelectStatement3 = "SELECT MAX(Id) FROM Report";

                //// Initialize a connection with DB
                //SqlConnection connection3 = new SqlConnection(connectionString);

                //// Initialize a sql command to execute
                //SqlCommand command3 = new SqlCommand(sqlSelectStatement3, connection3);

                //// Open the connection after commucating with DB
                //connection3.Open();

                //SqlDataReader dataReader3 = command3.ExecuteReader();
                //while (dataReader3.Read())
                //{
                //    cartId = Convert.ToInt32(dataReader3[0]);
                //}
                //connection3.Close();



                //string sqlUpdateStatement4 = @"UPDATE Report SET Id = @Id,paymentDate = @PaymentDate,memberName = @MemberName";

                //SqlConnection connection4 = new SqlConnection(connectionString);
                //SqlCommand command4 = new SqlCommand(sqlUpdateStatement4, connection4);

                //command2.Parameters.AddWithValue("@Id", cartId + 1);

                //connection4.Open();

                //command4.ExecuteNonQuery();

                //connection4.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('Payment successfully.Back to homepage now.');window.location ='Homepage.aspx';", true);
            }
            else {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert", "alert('Oh no,your payment failed');window.location ='Cart.aspx';", true);
            }
        }
    }
}