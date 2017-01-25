using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_UserWelcome : System.Web.UI.Page
{
    freeTech db = new freeTech();
    SqlDataReader dr;
    string st = "";
    int x = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["fullname"] ==null)
        {
            Response.Redirect("Index.html");

        }
        if(! IsPostBack)
        {
            txt_Name.Enabled = false;
            txt_email.Enabled = false;
            txt_phone.Enabled = false;
            dropdwn_Category.Enabled = false;
            txt_problem.Enabled = false;
            txt_description.Enabled = false;
            fileUpload1.Enabled = false;
            lnk_save.Enabled = false;
            lblTicketId.Visible = false;
            lblMsg.Visible = false;
        }
            
    }
    protected void btn_new_Click(object sender, EventArgs e)
    {

        txt_Name.Enabled = true;
        txt_email.Enabled = true;
        txt_phone.Enabled = true;
        dropdwn_Category.Enabled = true;
        txt_problem.Enabled = true;
        txt_description.Enabled = true;
        fileUpload1.Enabled = true;
        lnk_save.Enabled = true;
        lblTicketId.Visible = true;

        dropdwn_Category.Items.Insert(0, "---select---");
        dropdwn_Category.Items.Insert(1, "Software");

        st = "select ticket_id from tickets where ent_by='"+Session["fullname"].ToString()+"' and status=0";
        dr = db.readall(st);

        if (dr.Read() == true)
        {
            ViewState["ticket_id"] = dr[0].ToString();
        }

        else
        {
            dr.Dispose();
            st = " insert into tickets (status,ent_by,e_date) values(0,'" + Session["fullname"].ToString() + "',convert(datetime,'" + DateTime.Now.ToString("MM/dd/yyyy") + "',101)) ";
            x = db.ExeQuery(st);
            if (x == 1)
            {
                st = " select ticket_id from tickets where ent_by='" + Session["fullname"].ToString() + "' and status=0";
                dr = db.readall(st);
                if (dr.Read() == true)
                {
                    ViewState["ticket_id"] = dr[0].ToString();
                }
                dr.Dispose();
            }
        }
        dr.Dispose();
        lblTicketId.Text = " Your Ticket Id Is : " + ViewState["ticket_id"].ToString();

    }

    protected void btnAddFile_Click(object sender, EventArgs e)
    {
        double doc_len = fileUpload1.PostedFile.ContentLength;
        string f_name = fileUpload1.PostedFile.FileName;
        if (doc_len < 512000)
        {


            string ext = System.IO.Path.GetExtension(f_name).ToString();
            string actual_file_name = ViewState["ticket_id"].ToString() + ext;
            if ((ext == ".txt") || (ext == ".doc") || (ext == ".docx") || (ext == ".pdf"))
            {

                fileUpload1.SaveAs(Server.MapPath("~/freetech_files/" + fileUpload1.FileName.Replace(fileUpload1.FileName.ToString(), actual_file_name)));
                st = " update tickets set file_name='" + actual_file_name.ToString() + "' where  ticket_id=" + ViewState["ticket_id"].ToString() + " ";
                x = db.ExeQuery(st);
                if (x == 1)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "File Uploaded";
                    lblMsg.ForeColor = Color.Red;
                    lblTicketId.Text = "";
                }
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Invalid File Plz Upload Valid File";
            }

        }
        else
        {
            lblMsg.Visible = true;
            lblMsg.Text = "File Size Exeeds the limit of 512kb";
        }
    }

    protected void lnk_save_Click(object sender, EventArgs e)
    {
        st = " update tickets set name='" + txt_Name.Text + "',email_id='" + txt_email.Text + "'";
        st += " ,contact_num=" + txt_phone.Text + ",problem='" + txt_problem.Text + "',description='" + txt_description.Text + "',e_date=convert(datetime,'" + DateTime.Now.ToString("MM/dd/yyyy") + "',101),status=1,category_type='" + dropdwn_Category.SelectedItem.Text + "',priority='Medium',a_status='Open' where ticket_id=" + ViewState["ticket_id"].ToString() + " ";

        x = db.ExeQuery(st);

        if (x == 1)
        { 
            lblMsg.Visible = true;
            lblMsg.Text = "Ticket Raised For Your Complaint. ";
            lblTicketId.Visible = true;
            lblTicketId.Text = "Your Ticket ID :" + ViewState["ticket_id"].ToString(); 
            lblMsg.ForeColor = Color.Green;
            lblTicketId.ForeColor = Color.Red;

            txt_phone.Text = txt_description.Text = txt_email.Text = txt_Name.Text = txt_problem.Text = "";

            txt_Name.Enabled = false;
            txt_email.Enabled = false;
            txt_phone.Enabled = false;
            dropdwn_Category.Enabled = false;
            txt_problem.Enabled = false;
            txt_description.Enabled = false;
            fileUpload1.Enabled = false;
            lnk_save.Enabled = false;
            lblTicketId.Visible = false;

        }
    }
}
