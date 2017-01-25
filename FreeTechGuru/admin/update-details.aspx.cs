using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_update_details : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("default.aspx");
        }
    }
    protected void lnk_save_Click(object sender, EventArgs e)
    {
        if(txt_fullname.Text != null && txt_emailid.Text != null)
        st = "update Admin set FullName='" + txt_fullname.Text + "',EmailID='" + txt_emailid.Text + "' where Admin_Id='" + Session["admin"].ToString() + "'";
        int x = db.ExeQuery(st);
        if (x > 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('success','Details Updated successfully.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Updation failed please try later.');", true);
        }
    }
}