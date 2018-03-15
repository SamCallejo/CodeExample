using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PractiCalTimeSheet
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (((string)Session["Login"]).ToLower() == "employee")
            {
                ButtonReports.Visible = false;
                LiteralAdmin.Visible = false;
            }
            else
            {
                ButtonReports.Visible = true;
                LiteralAdmin.Visible = true;
            }
        }
    }
}