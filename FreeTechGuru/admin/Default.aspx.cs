using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    mydb db = new mydb();
    string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["OTA_emailid"] != null && Request.Cookies["QTA_password"] != null)
            {
                txt_emailid.Text = Request.Cookies["OTA_emailid"].Value;
                txt_pwd.Attributes["value"] = Request.Cookies["QTA_password"].Value;
                chk_remember.Checked = true;
            }
        }
    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        if (txt_emailid.Text.Length > 0 && txt_pwd.Text.Length > 0)
        {
            DataTable dt = new DataTable();
            st = "select Admin_Id,ProfilePicture,isSuperAdmin,FullName,AddCustomers,AddModerators,EmailID from admin where EmailID='" + txt_emailid.Text + "' and Password='" + txt_pwd.Text + "'";
            dt = db.get_datatable(st);
            if (dt.Rows.Count > 0)
            {
                Session["admin"] = dt.Rows[0][0].ToString();
                Session["fullname"] = dt.Rows[0][1].ToString();
                Adminlogin_details objAdminlogin_details = new Adminlogin_details();
                objAdminlogin_details.EmailID = dt.Rows[0]["EmailID"].ToString();
                objAdminlogin_details.is_superadmin = Boolean.Parse(dt.Rows[0]["isSuperAdmin"].ToString());
                objAdminlogin_details.AddCustomers = Boolean.Parse(dt.Rows[0]["AddCustomers"].ToString());
                objAdminlogin_details.AttendQueries = Boolean.Parse(dt.Rows[0]["AddModerators"].ToString());
                objAdminlogin_details.profile_pic = dt.Rows[0]["ProfilePicture"].ToString();
                objAdminlogin_details.fullname = dt.Rows[0]["FullName"].ToString();
                Session["Adminlogin_details"] = objAdminlogin_details;
                if (chk_remember.Checked)
                {
                    Response.Cookies["OTA_emailid"].Value = txt_emailid.Text;
                    Response.Cookies["QTA_password"].Value = txt_pwd.Text;
                    Response.Cookies["OTA_emailid"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["QTA_password"].Expires = DateTime.Now.AddDays(30);
                }
                else
                {
                    Response.Cookies["OTA_emailid"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["QTA_password"].Expires = DateTime.Now.AddDays(-1);
                }
                Response.Redirect("adminWelcome.aspx");
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