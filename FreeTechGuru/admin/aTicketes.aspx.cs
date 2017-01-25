using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_aTicketes : System.Web.UI.Page
{
    List<ListItem> list = new List<ListItem>();
    mydb db = new mydb();
    string st = "";
    int x = 0;
    SqlDataAdapter sqlda;
    public static DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Adminlogin_details"] == null)
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
        st = " SELECT ticket_id, name, contact_num,category_type, file_name, problem, description, convert(datetime,e_date,101) as e_date, file_name,convert(datetime,r_date,101) as r_date,a_status,priority FROM tickets";
        if (tkt_id.Text != "")
        {
            st += " where (status = 1) AND (a_status = 'Critical') AND (ticket_id = " + tkt_id.Text + ") OR " +
                   " (status = 1) AND (priority = 'Urgent') AND (ticket_id = " + tkt_id.Text + ")";
        }
        else
        {

            if (tb_dt_from.Text != "" && tb_dt_to.Text != "")
            {
                st += " WHERE (status = 1) AND (a_status = 'Critical') AND (e_date BETWEEN CONVERT(datetime, '" + tb_dt_from.Text + "', 101) AND CONVERT(datetime, '" + tb_dt_to.Text + "', 101)) OR " +
                     " (status = 1) AND (priority = 'Urgent') AND (e_date BETWEEN CONVERT(datetime, '" + tb_dt_from.Text + "', 101) AND CONVERT(datetime, '" + tb_dt_to.Text + "', 101)) AND " +
                     " (status = 1) ";
            }
            else
            {
                st += " where (status = 1) AND (a_status = 'Critical') or (priority = 'Urgent')";
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
}