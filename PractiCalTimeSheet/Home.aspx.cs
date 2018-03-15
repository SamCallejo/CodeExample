using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PractiCalTimeSheet
{
    public partial class Home1 : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(@"Data Source=localhost\SQLEXPRESS01;Initial Catalog=pubs;Integrated Security=True");
        private string _Role = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            _Role = (string)Session["Login"];

            if (_Role.ToLower() == "employee")
            {
                DropDownListEmployees.Visible = false;
                LiteralEmployeeName.Visible = true;
            }
            else
            {
                DropDownListEmployees.Visible = true;
                LiteralEmployeeName.Visible = false;
            }

            if (!IsPostBack)
            {
                loadStores();
            }
        }
        protected void btnAddSave_Click(object sender, EventArgs e)
        {
            Page.Validate("Add");

            if (Page.IsValid)
            {
                Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
        protected void loadStores()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from stores", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                gridView.DataSource = ds;
                gridView.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                gridView.DataSource = ds;
                gridView.DataBind();
                int columncount = gridView.Rows[0].Cells.Count;
                lblmsg.Text = " No data found !!!";
            }
        }
        protected void gridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridView.EditIndex = e.NewEditIndex;
            loadStores();
        }
        protected void gridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string stor_id = gridView.DataKeys[e.RowIndex].Values["stor_id"].ToString();
            TextBox stor_name = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtname");
            TextBox stor_address = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtaddress");
            TextBox city = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtcity");
            TextBox state = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtstate");
            TextBox zip = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtzip");
            con.Open();
            SqlCommand cmd = new SqlCommand("update stores set stor_name='" + stor_name.Text + "', stor_address='" + stor_address.Text + "', city='" + city.Text + "', state='" + state.Text + "', zip='" + zip.Text + "' where stor_id=" + stor_id, con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblmsg.BackColor = Color.Blue;
            lblmsg.ForeColor = Color.White;
            lblmsg.Text = stor_id + "        Updated successfully........    ";
            gridView.EditIndex = -1;
            loadStores();
        }
        protected void gridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridView.EditIndex = -1;
            loadStores();
        }
        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string stor_id = gridView.DataKeys[e.RowIndex].Values["stor_id"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from stores where stor_id=" + stor_id, con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                loadStores();
                lblmsg.BackColor = Color.Red;
                lblmsg.ForeColor = Color.White;
                lblmsg.Text = stor_id + "      Deleted successfully.......    ";
            }
        }
        protected void gridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string stor_id = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "stor_id"));
                Button lnkbtnresult = (Button)e.Row.FindControl("ButtonDelete");
                if (lnkbtnresult != null)
                {
                    lnkbtnresult.Attributes.Add("onclick", "javascript:return deleteConfirm('" + stor_id + "')");
                }
            }
        }
        protected void gridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox instorid = (TextBox)gridView.FooterRow.FindControl("instorid");
                TextBox inname = (TextBox)gridView.FooterRow.FindControl("inname");
                TextBox inaddress = (TextBox)gridView.FooterRow.FindControl("inaddress");
                TextBox incity = (TextBox)gridView.FooterRow.FindControl("incity");
                TextBox instate = (TextBox)gridView.FooterRow.FindControl("instate");
                TextBox inzip = (TextBox)gridView.FooterRow.FindControl("inzip");
                con.Open();
                SqlCommand cmd =
                    new SqlCommand(
                        "insert into stores(stor_id,stor_name,stor_address,city,state,zip) values('" + instorid.Text + "','" +
                        inname.Text + "','" + inaddress.Text + "','" + incity.Text + "','" + instate.Text + "','" + inzip.Text + "')", con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    loadStores();
                    lblmsg.BackColor = Color.Green;
                    lblmsg.ForeColor = Color.White;
                    lblmsg.Text = instorid.Text + "      Added successfully......    ";
                }
                else
                {
                    lblmsg.BackColor = Color.Red;
                    lblmsg.ForeColor = Color.White;
                    lblmsg.Text = instorid.Text + " Error while adding row.....";
                }
            }
        }

    }
}