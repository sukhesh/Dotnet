using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_update_details : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("default.aspx");
        }
    }
    protected void lnk_save_Click(object sender, EventArgs e)
    {
        if (txt_Name.Text != null && txt_email.Text != null && txt_phone.Text != null)
            st = "update Reg_Users set user_name='" + txt_Name.Text + "',email_address='" + txt_email.Text + "',phone="+txt_phone.Text+" where user_id='" + Session["user"].ToString() + "'";
        int x = db.ExeQuery(st);
        if (x > 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('success','Details Updated successfully.');", true);
            lblMsg.Text = "Details Updated Successfully.";
            lblMsg.ForeColor = Color.Green;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Updation failed please try later.');", true);
            lblMsg.Text = "Failed To Update Details.";
            lblMsg.ForeColor = Color.Red;
        }
    }
}