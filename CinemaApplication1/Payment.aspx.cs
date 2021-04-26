using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CinemaApplication1
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Random orderNoRan = new Random();
            int orderNo = orderNoRan.Next(0,999999);
            Session["OrderNo"] = orderNo.ToString();
            string TotalPrice = Session["TotalPrice"].ToString();
            Response.Write("<form action='https://www.sandbox.paypal.com/cgi-bin/webscr' method='post' name='buyCredits' id='buyCredits'>");
            Response.Write("<input type='hidden' name='cmd' value='_xclick'>");
            Response.Write("<input type='hidden' name='business' value='sb-di9qe5777761@business.example.com'>");
            Response.Write("<input type='hidden' name='currency_code' value='MYR'>");
            Response.Write("<input type='hidden' name='item_name' value='payment for donate'>");
            Response.Write("<input type='hidden' name='item_number' value='0'>");
            Response.Write("<input type='hidden' name='amount' value='" + TotalPrice.ToString() + "'>");
            Response.Write("<input type='hidden' name='return' value='https://localhost:44388/paymentDone.aspx?order=" + orderNo.ToString() + "''>");

            Response.Write("<script type='text/javascript'>");
            Response.Write("document.getElementById('buyCredits').submit();");
            Response.Write("</script>");
        }
    }
}