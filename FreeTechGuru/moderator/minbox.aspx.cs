using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moderator_minbox : System.Web.UI.Page
{
    freeTech db = new freeTech();
    string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["f_name"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        if(!IsPostBack)
        {
            FillRepeater();
        }
    }

    private void FillRepeater()
    {
        st += " SELECT  notification.title, notification.message,convert(varchar(10),notification.n_date,101) as n_date,notification.n_id ";
        st += " ,notification_details.a_no FROM notification INNER JOIN notification_details ON notification.n_id = notification_details.n_id WHERE notification_details.to_id = " + Session["f_name"].ToString() + " and notification.u_type='moderator'";

        db.fill_rptr_ret_sqlda(st, rptr_msgs);
    }

    protected void lnk_delete_Click(object sender, EventArgs e)
    {

    }
}