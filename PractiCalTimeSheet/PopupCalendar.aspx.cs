using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
namespace ContontrolsExersise
{
    public partial class PopupCalendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // if (IsPostBack) return;
           // else
           //{
           //   var al = new ArrayList() ;
           //   al.Add("*Year*");
           // for (var i = 1900; i < 2011; i++)
           // {
           //     al.Add(i);
           // }
           // Ddlyear.DataSource = al;
           // Ddlyear.DataBind();
            
           // }
        }

        protected void DdlyearSelectedIndexChanged(object sender, EventArgs e)
        {
           //var smonth = DateTime.Now.Month;
           // if (ddlMonth.SelectedValue!="00")
           // {
           //     smonth = Convert.ToInt32(ddlMonth.SelectedValue);
           // }
           // var date = smonth+ "/" + DateTime.Now.Day + "/" + Ddlyear.SelectedValue;
           // var dateTime = Convert.ToDateTime(date);
           // CalPopup.VisibleDate =dateTime;
        }

        protected void DdlMonthSelectedIndexChanged(object sender, EventArgs e)
        {
            //var year =DateTime.Now.Year ;
            //if (Ddlyear.SelectedValue!="*Year*")
            //{
            //    year =Convert.ToInt32(Ddlyear.SelectedValue);
            //}

            //var sdate = ddlMonth.SelectedValue + "/" + DateTime.Now.Day + "/" + year;
            //CalPopup.VisibleDate = Convert.ToDateTime(sdate);
        }
    }
}