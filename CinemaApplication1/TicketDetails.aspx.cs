using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using QRCoder;
using System.Drawing;
using System.IO;

namespace CinemaApplication1
{
    public partial class WebForm27 : System.Web.UI.Page
    {
        // Initialize connection string for this page to communicate with DB
        string connectionString = Global.connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                string CartNum = Request.QueryString["CartNum"] ?? "";
                string username = Session["username"].ToString();
                //string tkName = "";
                //string tkSeat = "";
                //string tkHall = "";
                //string tkDate = "";
                //string tkTime = "";
                //string tkPrice = "";
                string formattedOutput = "";

                // write SQL select statement to get all entires from student table 
                string sqlSelectStatement = "SELECT CartNum,TicketId,TicketMovieName,TicketSeat,TicketHall,TicketTime,TicketDate,TicketPrice FROM Cart WHERE Paid = 'Yes' AND MemberName ='" + username + "' AND CartNum = '" + CartNum + "'";

                // initialize a connection with DB
                SqlConnection connection = new SqlConnection(connectionString);

                // initialize a sql command to execute 
                SqlCommand command = new SqlCommand(sqlSelectStatement, connection);

                // Open a channel to communicate with DB
                connection.Open();

                SqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    formattedOutput = dataReader[1].ToString();
                    //formattedOutput += string.Format("{0} ", dataReader["Id"]);

                    System.Web.UI.WebControls.Image imgQRCode = new System.Web.UI.WebControls.Image();
                    QRCodeGenerator qrGenerator = new QRCodeGenerator();
                    QRCodeData qrCodeData = qrGenerator.CreateQrCode(formattedOutput, QRCodeGenerator.ECCLevel.Q);
                    QRCode qrCode = new QRCode(qrCodeData);
                    Bitmap qrCodeImage = qrCode.GetGraphic(20);
                    MemoryStream ms = new MemoryStream();

                    // size of the QR code
                    imgQRCode.Height = 150;
                    imgQRCode.Width = 150;


                    qrCodeImage.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    byte[] byteImage = ms.ToArray();
                    imgQRCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);

                    // return image to litResult2
                    litResult2.Controls.Add(imgQRCode);
                    mvName.Text = dataReader[2].ToString();
                    tkSeat.Text = dataReader[3].ToString();
                    mvHall.Text = dataReader[4].ToString();
                    tkDate.Text = dataReader[6].ToString();
                    tkTime.Text = dataReader[5].ToString();
                    tkPrice.Text = dataReader[7].ToString();
                }

                // Close the data reader after finish reading data.
                dataReader.Close();

                // Close the connection after finish commucation with DB
                connection.Close();

            }
            else {
                Server.Transfer("Homepage.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Server.Transfer("MemberPanel.aspx");
        }
    }
}