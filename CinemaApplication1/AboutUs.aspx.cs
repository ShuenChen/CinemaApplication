using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CinemaApplication1
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //This one if for delete the session when user is leave the forget password page, please keep it
            if (Session["forgetPwdName"] != null)
            {
                Session.Remove("forgetPwdName");
            }
        }
    }
}