using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moderator_Default : System.Web.UI.Page
{
    mydb db = new mydb();
    string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["User_emailid"] != null && Request.Cookies["User_password"] != null)
            {
                txt_emailid.Text = Request.Cookies["User_emailid"].Value;
                txt_pwd.Attributes["value"] = Request.Cookies["User_password"].Value;
                chk_remember.Checked = true;
            }
        }
    }

    protected void lnk_login_Click(object sender, EventArgs e)
    {
        if (txt_emailid.Text.Length > 0 && txt_pwd.Text.Length > 0)
        {
            DataTable dt = new DataTable();
            st = "select m_id,f_name from moderators where email_id='" + txt_emailid.Text + "' and pwd='" + txt_pwd.Text + "'";
            dt = db.get_datatable(st);
            if (dt.Rows.Count > 0)
            {
                Session["m_name"] = dt.Rows[0][0].ToString();
                Session["f_name"] = dt.Rows[0][1].ToString();
                if (chk_remember.Checked)
                {
                    Response.Cookies["moderator_emailid"].Value = txt_emailid.Text;
                    Response.Cookies["moderator_password"].Value = txt_pwd.Text;
                    Response.Cookies["moderator_emailid"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["moderator_password"].Expires = DateTime.Now.AddDays(30);
                }
                else
                {
                    Response.Cookies["moderator_emailid"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["moderator_password"].Expires = DateTime.Now.AddDays(-1);
                }
                Response.Redirect("ModeratorWelcome.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Login failed');", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Please enter login credentials.');", true);
        }
    }
}
