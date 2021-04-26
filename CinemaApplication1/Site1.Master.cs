using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CinemaApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                LoginHome.Visible = false;
                RegisterHome.Visible = false;
                cartPage.Visible = true;
                btnLogoutHome.Visible = true;
                adminPanel.Visible = false;
                userPanel.Text = Session["username"].ToString();
                userPanel.Visible = true;
                ticketBot.Visible = true;
            }
            else if (Session["adminname"] != null)
            {
                LoginHome.Visible = false;
                RegisterHome.Visible = false;
                adminPanel.Visible = true;
                cartPage.Visible = false;
                btnLogoutHome.Visible = true;
                userPanel.Visible = false;
                adminPanel.Text = Session["adminname"].ToString();
                ticketBot.Visible = false;
            }
            else
            {
                adminPanel.Visible = false;
                userPanel.Visible = false;
                LoginHome.Visible = true;
                RegisterHome.Visible = true;
                cartPage.Visible = false; ;
                btnLogoutHome.Visible = false;
                ticketBot.Visible = true;
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogoutHome_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Server.Transfer("Homepage.aspx");
        }
    }
}