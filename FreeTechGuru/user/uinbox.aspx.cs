using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_uinbox : System.Web.UI.Page
{
    freeTech db = new freeTech();
    string st = "";
    int x;
    SqlDataReader dr;
    SqlDataAdapter sqlda;
    public static DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["user"] == null)
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
       // ds.Clear();
        st += " SELECT  notification.title, notification.message,convert(varchar(10),notification.n_date,101) as n_date,notification.n_id,notification_details.a_no,notification.message ";
        st += " ,notification_details.a_no FROM notification INNER JOIN notification_details ON notification.n_id = notification_details.n_id WHERE notification_details.to_id = " + Session["user"].ToString() + " and notification.u_type='user'";

        
        db.fill_rptr_ret_sqlda(st, rptr_msgs);
      //  rptr_msgs.DataBind();
    }

    protected void lnk_delete_Click(object sender, EventArgs e)
    {

    }
}