using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_ticket_reply : System.Web.UI.Page
{
    List<ListItem> list = new List<ListItem>();
    freeTech db = new freeTech();
    string st = "";
    int x = 0;
    SqlDataAdapter sqlda;
    public static DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_reply.Text = "";
        if (Session["user"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        if (!IsPostBack)
        {

            fill_grid();
        }
    }
    private void fill_grid()
    {
        st = " SELECT ticket_id, name, contact_num,category_type, file_name, problem, description, convert(datetime,e_date,101) as e_date, file_name,convert(datetime,r_date,101) as r_date,a_status,priority FROM tickets where status=1 and ent_by=" + Session["user"].ToString() + "  ";
        if (tkt_id.Text != "")
        {
            st += " and  ticket_id=" + tkt_id.Text + "";
        }
        else
        {

            if (tb_dt_from.Text != "" && tb_dt_to.Text != "")
            {
                st += " and  e_date between CONVERT(datetime,'" + tb_dt_from.Text + "',101) and CONVERT(datetime,'" + tb_dt_to.Text + "',101)";
            }
        }
        st += " order by ticket_id desc ";
        ds.Clear();
        sqlda = db.fill_grid_ret_sqlda(st, grid_tkt_details);
        sqlda.Fill(ds, "tbl");
        if (grid_tkt_details.Rows.Count == 0)
        {
            lbl_reply.Text = "No tickets found";
        }
    }
    protected void bt_submit_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)(((Control)sender).NamingContainer);
        TextBox tb_reply = (TextBox)row.FindControl("tb_reply");
        DropDownList drp_priority = (DropDownList)row.FindControl("drp_priority");
        DropDownList drp_status = (DropDownList)row.FindControl("drp_status");
        if (tb_reply.Text != "")
        {
            st = " insert into responce (ent_by,ticket_id,reply_msg,status,e_date) values('" + Session["user"].ToString() + "'," + grid_tkt_details.DataKeys[row.RowIndex].Value.ToString() + ",'" + db.Quote(tb_reply.Text) + "',1,convert(datetime,'" + DateTime.Now.ToString("MM/dd/yyyy") + "',101)) ";
            x = db.ExeQuery(st);
            if (x == 1)
            {
                st = " update tickets set priority='" + drp_priority.SelectedItem.ToString() + "', a_status='" + drp_status.SelectedItem.ToString() + "',r_date=convert(datetime,'" + DateTime.Now.ToString("MM/dd/yyyy") + "',101) where ticket_id=" + grid_tkt_details.DataKeys[row.RowIndex].Value.ToString() + "";
                x = db.ExeQuery(st);
                if (x == 1)
                {
                    fill_grid();
                }
            }
        }
        else { Response.Write("<script>alert('Please enter reply.');</script>"); }

    }
    protected void grid_tkt_details_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList drp_priority = (DropDownList)e.Row.FindControl("drp_priority");
            DropDownList drp_status = (DropDownList)e.Row.FindControl("drp_status");
            HiddenField hf_status = (HiddenField)e.Row.FindControl("hf_status");
            HiddenField hf_priority = (HiddenField)e.Row.FindControl("hf_priority");
            Repeater Repeater1 = (Repeater)e.Row.FindControl("Repeater1");

            drp_priority.Items.Insert(0, "select");
            drp_priority.Items.Add("Low");
            drp_priority.Items.Add("Medium");
            drp_priority.Items.Add("High");
            drp_priority.Items.Add("Urgent");
            drp_priority.Items.Add("Emergency");

            drp_priority.SelectedItem.Text = hf_priority.Value.ToString();

            drp_status.Items.Insert(0, "select");
            drp_status.Items.Add("Open");
            drp_status.Items.Add("On hold");
            drp_status.Items.Add("Insufficient Details");
            drp_status.Items.Add("Awaiting for responce");
            drp_status.Items.Add("Suspended");
            drp_status.Items.Add("Closed");
            drp_status.Items.Add("Critical");

            drp_status.SelectedItem.Text = hf_status.Value.ToString();
            st = " select e_date,ent_by,reply_msg from responce where ticket_id=" + grid_tkt_details.DataKeys[e.Row.RowIndex].Value.ToString() + " and status=1 order by r_no desc  ";
            db.fill_rptr_ret_sqlda(st, Repeater1);
        }

    }
    protected void grid_tkt_details_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        st = " delete tickets where ticket_id=" + grid_tkt_details.DataKeys[e.RowIndex].Value.ToString() + "";
        x = db.ExeQuery(st);
        if (x == 1)
        {
            fill_grid();
        }
    }

    protected void bt_submit_Click1(object sender, EventArgs e)
    {
        fill_grid();
    }
    protected void bt_update_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)(((Control)sender).NamingContainer);
        TextBox tb_ttl = (TextBox)row.FindControl("tb_ttl");
        TextBox tb_desc = (TextBox)row.FindControl("tb_desc");

        st = " update tickets set problem='" + db.Quote(tb_ttl.Text) + "',description='" + db.Quote(tb_desc.Text) + "' where ticket_id=" + grid_tkt_details.DataKeys[row.RowIndex].Value.ToString() + " ";
        x = db.ExeQuery(st);
        if (x == 1)
        {
            st = " insert into responce (ent_by,ticket_id,reply_msg,status,e_date) values('" + Session["uid"].ToString() + "'," + grid_tkt_details.DataKeys[row.RowIndex].Value.ToString() + ",'Ticket Details Updated',1,convert(datetime,'" + DateTime.Now.ToString("MM/dd/yyyy") + "',101)) ";
            x = db.ExeQuery(st);
            if (x == 1)
            {
                st = " update tickets set r_date=convert(datetime,'" + DateTime.Now.ToString("MM/dd/yyyy") + "',101) where ticket_id=" + grid_tkt_details.DataKeys[row.RowIndex].Value.ToString() + "";
                x = db.ExeQuery(st);
                if (x == 1)
                {
                    fill_grid();
                }
            }
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {

        fill_grid();
    }
    protected void tkt_id_TextChanged(object sender, EventArgs e)
    {
        tb_dt_from.Text = tb_dt_to.Text = "";
    }
    protected void tb_dt_from_TextChanged(object sender, EventArgs e)
    {
        tkt_id.Text = "";
        tb_dt_to.Focus();
    }
    protected void tb_dt_to_TextChanged(object sender, EventArgs e)
    {
        tkt_id.Text = "";
        bt_submit.Focus();
    }


}