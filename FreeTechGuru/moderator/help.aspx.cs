using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moderator_help : System.Web.UI.Page
{
    freeTech db = new freeTech();
    string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        panel1.Visible = false;
        
        if(Session["f_name"] == null)
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        st = " SELECT h_f_id, title, description,keywords FROM help_files where keywords like '%" + txtSearch.Text + "%'or description  like '%" + txtSearch.Text + "%'  or title like '%" + txtSearch.Text + "%'";

        db.fill_rptr_ret_sqlda(st, rptr_msgs);
        panel1.Visible = true;
    }
}