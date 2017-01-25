using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_change_password : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void lnk_save_Click(object sender, EventArgs e)
    {
        st = "update Reg_Users set password ='" + txt_newpassword.Text + "' where user_id=" + Session["user"].ToString() + " and password='" + txt_oldpwd.Text + "'";
        if (db.ExeQuery(st) > 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('success','Password updated successfully');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Old password does not match');", true);
        }
    }
}