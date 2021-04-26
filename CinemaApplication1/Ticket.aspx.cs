using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CinemaApplication1
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        // Initialize connection string for this page to communicate with DB
        string connectionString = Global.connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string getMovieID = Request.QueryString["MovieId"] ?? "";

        }

        protected void btnAddTicket_Click(object sender, EventArgs e)
        {
            string getMovieID = Request.QueryString["MovieId"] ?? "";

            Response.Redirect("TicketAdd.aspx?MovieId=" + getMovieID);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovieDetails.aspx");
        }

    }
}