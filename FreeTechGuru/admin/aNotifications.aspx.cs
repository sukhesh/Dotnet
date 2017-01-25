using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_aNotifications : System.Web.UI.Page
{
    freeTech db = new freeTech();

    string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Adminlogin_details"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        if (!IsPostBack)
        {
            drop_usertype.Items.Insert(0, "select");
            drop_usertype.Items.Insert(1, "moderator");
            drop_usertype.Items.Insert(2, "user");

        }
    }
    protected void drop_sender_SelectedIndexChanged(object sender, EventArgs e)
    {
        drop_user.Items.Clear();
        if (drop_usertype.SelectedIndex == 1)
        {
            st = "SELECT m_id, f_name + ' ' + m_name + ' ' + l_name AS name FROM moderators";
        }
        else
        {
            st = "SELECT user_id, user_name + ' ' + mid_name + ' ' + last_name AS name FROM Reg_Users";
        }
        db.fill_drop_with_id(st, drop_user);

    }
    protected void btn_send_Click(object sender, EventArgs e)
    {
        int RETVAL;
        st = "insert into notification (n_from,title,message,n_date,u_type,sender_type) OUTPUT Inserted.n_id values(";
        st += " " + Session["adminid"].ToString() + ",'" + txt_title.Text + "','" + txt_description.Text + "',convert(datetime,'" + DateTime.Now.ToString("MM/dd/yyyy") + "',101),'" + drop_usertype.SelectedItem.Text + "','admin' )";
        RETVAL = db.readmax(st);
        for (int i = 0; i < list_to.Items.Count; i++)
        {
            st = "insert into notification_details (to_id,n_id) values(" + list_to.Items[i].Value + "," + RETVAL + ")";
            db.ExeQuery(st);
            list_to.Items.Clear();
            lbl_reply.Text = "Notification sent.";
        }
        txt_description.Text = txt_title.Text = "";
        drop_user.Items.Clear();
        drop_usertype.SelectedIndex = 0;

    }
    protected void drop_user_SelectedIndexChanged(object sender, EventArgs e)
    {
        list_to.Items.Add(new ListItem(drop_user.SelectedItem.Text, drop_user.SelectedValue.ToString()));
        drop_user.Items.Remove(new ListItem(drop_user.SelectedItem.Text, drop_user.SelectedValue.ToString()));
        drop_user.SelectedIndex = 0;
    }
    protected void list_to_SelectedIndexChanged(object sender, EventArgs e)
    {
        drop_user.Items.Add(new ListItem(list_to.SelectedItem.Text, list_to.SelectedValue.ToString()));
        list_to.Items.Remove(new ListItem(list_to.SelectedItem.Text, list_to.SelectedValue.ToString()));
    }
}