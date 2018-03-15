using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PractiCalTimeSheet
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            Session["Login"] = TextboxLogin.Text;

            if (TextboxLogin.Text.ToLower() == "employee" || TextboxLogin.Text.ToLower() == "admin")
            {
                Response.Redirect("Home.aspx");
            }
        }
    }
}