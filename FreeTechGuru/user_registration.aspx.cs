using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_registration : System.Web.UI.Page
{
    freeTech db = new freeTech();
    //Class1 c1 = new Class1();
    string st = "";
    int x = 0;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            //Panel4.Visible = false;

            btnStep1.CssClass = "steps active";
            btnStep2.CssClass = "steps";
            btnStep3.CssClass = "steps";
            //Panel4.Visible= Panel3.Visible = Panel2.Visible = false;

        }
    }
    protected void up1NextBtn_Click(object sender, EventArgs e)
    {
        btnStep2.CssClass = "steps active";
        btnStep1.CssClass = "steps";
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    protected void up2NextBtn_Click(object sender, EventArgs e)
    {
        btnStep3.CssClass = "steps active";
        btnStep2.CssClass = "steps";
        lblName.Text = txtName.Text;
        lblMiddleName.Text = txtMiddleName.Text;
        lblLastName.Text = txtLastName.Text;
        lblDOB.Text = txtDOB.Text;

        if (rbMale.Checked)
        {
            lblGender.Text = "Male";
        }
        else
        {
            lblGender.Text = "Female";
        }
        lblEmail.Text = txtEmail.Text;
        lblPhone.Text = txtPhone.Text;
        ViewState["pwd"]= txtPassword.Text;
        lblAddress.Text = txtAddress.Text;
        Panel2.Visible = false;
        Panel3.Visible = true;
    }
    protected void up2PreviousBtn_Click(object sender, EventArgs e)
    {
        btnStep1.CssClass = "steps active";
        btnStep2.CssClass = "steps";
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
    protected void up3PreviousBtn_Click(object sender, EventArgs e)
    {
        btnStep2.CssClass = "steps active";
        btnStep3.CssClass = "steps";
        Panel3.Visible = false;
        Panel2.Visible = true;
    }
    protected void btnStep1_Click(object sender, EventArgs e)
    {
        btnStep1.CssClass = "steps active";
        btnStep2.CssClass = "steps";
        btnStep3.CssClass = "steps";
        Panel1.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
    }
    protected void btnStep2_Click(object sender, EventArgs e)
    {
        btnStep2.CssClass = "steps active";
        btnStep1.CssClass = "steps";
        btnStep3.CssClass = "steps";
        Panel1.Visible = false;
        Panel2.Visible = true;
        Panel3.Visible = false;
    }
    protected void btnStep3_Click(object sender, EventArgs e)
    {
        btnStep3.CssClass = "steps active";
        btnStep2.CssClass = "steps";
        btnStep1.CssClass = "steps";
        Panel3.Visible = true;
        Panel2.Visible = false;
        Panel1.Visible = false;
    }
    protected void up3FinishBtn_Click(object sender, EventArgs e)
    {
         //st = " select email_address from users where email_address='" + txtEmail.Text + "'";
         //dr = db.readall(st);
         //if (dr.Read() == true) 
         //{
         //    Response.Write("<script>alert('This emaild id is alerady registered.')</script>");
         //}
         //else
         //{
         //    dr.Dispose();
             //if(db.ExeQuery("insert into Reg_Users values('" + txtName.Text + "','" + txtMiddleName.Text + "','" + txtLastName.Text + "','" + txtDOB.Text + "','" + lblGender.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtPassword.Text + "','" + txtAddress.Text + "')")==1)
             //{
             //    Response.Redirect("complaints.aspx");
             //}
        if (db.ExeQuery("insert into Reg_Users(user_name,mid_name,last_name,dob,sex,email_address,phone,password,address) values('" + txtName.Text + "','" + txtMiddleName.Text + "','" + txtLastName.Text + "','" + txtDOB.Text + "','" + lblGender.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + ViewState["pwd"].ToString() + "','" + txtAddress.Text + "')") == 1)
        {
              
            Response.Write("<script>alert('Registration Successs... You can now LogIn with your EmailID and Password');window.location.href='index.html';</script>");
            
        }
             
             //Session["uid"] = db.readmax(st);
             //int len = lblPwd.Text.Length;
             //ViewState["c_id"] = "freetechguru" + Session["uid"] + "" + len.ToString();
             //db.ExeQuery(st);
        // }
             //st = "insert into users where user_name='" + lblName.Text + "', mid_name='" + lblMiddleName.Text + "', last_name='" + lblLastName.Text + "', dob='" + lblDOB.Text + "', sex='" + lblGender.Text + "', email_address='" + lblEmail.Text + "', phone='" + lblPhone.Text + "', password='" + lblPwd.Text + "', address='" + lblAddress.Text + "'";
        else
         {
             Response.Write("<script>alert('Something Went Wrong')</script>");
         }
        //Response.Write("<script>alert('Registration Success')</script>");

        
        
        //Panel1.Visible = false;
        //Panel2.Visible = false;
        //Panel3.Visible = false;
        //Panel4.Visible = true;

        //    st = "select user_id from users where email_address ='" + txtEmail.Text + "'";
        //    dr = db.readall(st);
        //    if (dr.Read() == true)
        //    {
        //        Response.Write("<script>alert('This EmailID is already registered')</script>");
        //    }
        //    else
        //    {
        //        dr.Dispose();
        //        st = "insert into users (user_name,mid_name,last_name,status,password) out inserted.convert(int,user_id) values ('"+txtName.Text+"', '"+txtMiddleName.Text+"', '"+txtLastName.Text+"', 0 , '"+txtPassword.Text+"' ";
        //        Session["uid"] = db.readmax(st);
        //        int len = txtPassword.Text.Length;
        //        ViewState["cid"] = "freetechguru" + Session["uid"] + "" + len.ToString();

        //        try
        //        {
        //            MailMessage m1 = new MailMessage();
        //            m1.From = new MailAddress("freetechguru@gmail.com");
        //            m1.To.Add(txtEmail.Text);
        //            m1.Subject = "FreeTechGuru Registration";
        //            m1.Body = "Hi " + txtName.Text + "." + txtMiddleName.Text + "." + txtLastName.Text + "... Your registration confirmation Id For www.freetechguru.com  Is : " + ViewState["cid"].ToString() + " Plz Paste this code in confirmation box";

        //            SmtpClient smpt = new SmtpClient();
        //            smpt.Credentials = new System.Net.NetworkCredential("freetechguru", "techsupport123");
        //            smpt.Host = "smpt.gmail.com";
        //            smpt.Port = 587;
        //            smpt.EnableSsl = true;

        //            Panel4.Visible = true;
        //            Panel3.Visible = false;
        //            Panel2.Visible = false;
        //            Panel1.Visible = false;

        //        }
        //        catch(Exception ex)
        //        {
        //            Response.Write("<script>alert('Internet connection  not available')</script>");
        //        }
        //    }
        //}
        //protected void btnConfirmID_Click(object sender, EventArgs e)
        //{
        //    if(txtConfrmID.Text == ViewState["cid"].ToString())
        //    {
        //        //st = "update user set dob=convert(datetime, '" + txtDOB.Text + "',103),sex=" + rdb_sex.SelectedValue.ToString() + ", Email ID='" + txtEmail.Text + "', address = '" + txtAddress.Text + "', ent_date=convert(datetime,'" + DateTime.Now.ToShortDateString() + "',103),status=1 where u_id=" + ViewState["uid"].ToString() + " ";
        //        x = db.ExeQuery(st);

        //        if(x >= 1)
        //        {
        //            Response.Redirect("Complaints.aspx");
        //        }
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('Wrong Confirmation ID..!')</script>");
        //    }
        //}
    }
}