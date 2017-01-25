using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_aMails : System.Web.UI.Page
{
    mydb db = new mydb();
    string st = "";
    int x;
    SqlDataAdapter sqlda;
    public static DataSet ds = new DataSet();
    SqlDataReader dr;

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
        st = "SELECT name, email_id, type, description, convert(varchar(10),e_date,101) as e_date, e_t_id FROM email_tech_support WHERE (e_t_id NOT IN (SELECT e_t_id FROM responce_email_tech_support AS responce_email_tech_support_1))";
        sqlda = db.fill_grid_ret_sqlda(st, GridView1);
        sqlda.Fill(ds, "tbl");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)(((Control)sender).NamingContainer);
            ImageButton ImageButton1 = (ImageButton)row.FindControl("ImageButton1");
            TextBox tb_desc = (TextBox)row.FindControl("tb_desc");
            Label lb_emailid = (Label)row.FindControl("lb_emailid");

            string s = GridView1.DataKeys[row.RowIndex].Value.ToString();
            st = " insert into responce_email_tech_support(e_t_id,reply,e_date,ent_by,status) values(" + GridView1.DataKeys[row.RowIndex].Value.ToString() + ",'" + tb_desc.Text + "',convert(datetime,'" + DateTime.Now.ToString("MM/dd/yyyy") + "',101),'" + Session["adminid"].ToString() + "',0) ";
            x = db.ExeQuery(st);
            if (x == 1)
            {
                st = " select r_e_t_id from responce_email_tech_support where status=0 and e_t_id=" + GridView1.DataKeys[row.RowIndex].Value.ToString() + " ";
                dr = db.readall(st);
                if (dr.Read() == true)
                {
                    ViewState["r_e_t_id"] = dr[0].ToString();
                }
                dr.Dispose();

            }


            //System.Net.Mail.MailMessage msg = new MailMessage();
            //msg.From = new MailAddress("freetechguru@gmail.com");
            //msg.To.Add(lb_emailid.Text);
            //msg.Subject = "freetechguru: Solution For Your Problem";
            //string mail_body = tb_desc.Text;
            //AlternateView html_mail = AlternateView.CreateAlternateViewFromString(mail_body, null, "text/html");

            //HttpFileCollection hfc = Request.Files;
            //for (int i = 0; i < hfc.Count; i++)
            //{

            //    HttpPostedFile hpf = hfc[i];
            //    if (hpf.ContentLength > 0)
            //    {
            //        string f_name = hpf.FileName.ToString();
            //        string ext = System.IO.Path.GetExtension(f_name).ToString();
            //        string new_f_name = ViewState["r_e_t_id"].ToString() + "_" + i.ToString() + ext.ToString();
            //        hpf.SaveAs(Server.MapPath("~/freetech_files/" + System.IO.Path.GetFileName(hpf.FileName.Replace(hpf.FileName, new_f_name))));

            //        //Response.Write("<b>File: </b>" + hpf.FileName + "  <b>Size:</b> " +
            //        //    hpf.ContentLength + "  <b>Type:</b> " + hpf.ContentType + " Uploaded Successfully <br/>");
            //        msg.Attachments.Add(new Attachment(hpf.InputStream, new_f_name.ToString()));
            //        st = " insert into responce_email_tech_details (file_name,status,r_e_t_id) values('" + new_f_name.ToString() + "',1," + ViewState["r_e_t_id"].ToString() + ") ";
            //        db.ExeQuery(st);

            //    }
            //}

            //msg.AlternateViews.Add(html_mail);
            //SmtpClient smtp = new SmtpClient();
            //smtp.Host = "smtp.gmail.com";
            //smtp.Port = 587;
            //smtp.Credentials = new System.Net.NetworkCredential("freetechguru", "techsupport123");
            //smtp.EnableSsl = true;
            //smtp.Send(msg);
            //msg = null;
            //Page.RegisterStartupScript("UserMsg", "<script>alert('Mail sent thank you...');</script>");
        }
        catch (Exception ex)
        {
            Console.WriteLine("{0} Exception caught.", ex);
        }

    }
}