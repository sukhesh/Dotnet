<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ticket_reply.aspx.cs" Inherits="user_ticket_reply" %>

<%@ Register Src="~/user/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/user/sidemenu.ascx" TagPrefix="uc1" TagName="sidemenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/admin-section.css" rel="stylesheet" type="text/css" />
    <link href="../css/custom.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    <script src="../js/jquery.js"></script>
    <!-- Bootstrap -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- AdminLTE App -->
    <script src="../js/AdminLTE/app.js"></script>

    <style type="text/css">
        .style1
        {
            height: 602px;
        }
    </style>
</head>
<body class="skin-black">
    <form id="form1" runat="server">
   <div>

            <uc1:header runat="server" ID="header" />
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <uc1:sidemenu runat="server" ID="sidemenu" />
                <aside class="right-side">
                    <section class="content-header">
                        <h1>
                       
                        <small></small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active"></li>
                        </ol>
                        <br />
                       <br />
                        <br />
                        <table>
<tr><td> Ticket_ID </td> <td><asp:TextBox ID="tkt_id" AutoPostBack="True" 
                                       ontextchanged="tkt_id_TextChanged" runat="server"></asp:TextBox> </td></tr>
     <tr><td> Date From </td><td>  
            <asp:TextBox ID="tb_dt_from" runat="server"  AutoPostBack="True" 
                                       ontextchanged="tb_dt_from_TextChanged"  onfocus="showCalendarControl(this);"></asp:TextBox></td><td> To </td><td> 
                <asp:TextBox ID="tb_dt_to" runat="server" AutoPostBack="True" 
                                       ontextchanged="tb_dt_to_TextChanged"  onfocus="showCalendarControl(this);"></asp:TextBox></td></tr>
        <tr><td> 
            <asp:Button ID="bt_submit" runat="server" Text="Submit" OnClick="bt_submit_Click1" /> </td></tr>
        </table>
            <asp:Label ID="lbl_reply" runat="server" ForeColor="red"></asp:Label>
                       <table><tr><td class="style1"> 
       
           <asp:ScriptManager ID="ScriptManager1" runat="server">
           </asp:ScriptManager>
           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
           <ContentTemplate>
               <asp:Timer ID="Timer1" Interval="75000" runat="server" ontick="Timer1_Tick">
               </asp:Timer>
           
    <asp:GridView ID="grid_tkt_details" runat="server" AutoGenerateColumns="False" 
                   BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" 
                   Width="935px" DataKeyNames="ticket_id" 
                   OnRowDataBound="grid_tkt_details_RowDataBound" 
                   OnRowDeleting="grid_tkt_details_RowDeleting" BorderStyle="None" 
                   GridLines="Horizontal" style="margin-bottom: 32px">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                 <ItemTemplate>
                 <asp:HiddenField ID="hf_status" Value='<%# Bind("a_status") %>' runat="server" />
                      <asp:HiddenField ID="hf_priority" Value='<%# Bind("priority") %>' runat="server" />
                 <table><tr> <td>Ticket ID:</td><td><asp:Label ID="lb_tkt_no" runat="server" Text='<%# Bind("ticket_id") %>'></asp:Label></td></tr>
                     <tr>
                 
                 <td> Priority : </td><td><asp:DropDownList ID="drp_priority" runat="server"></asp:DropDownList></td></tr><tr><td> Status : </td><td><asp:DropDownList ID="drp_status" runat="server">  </asp:DropDownList></td>
                     </tr>
                <tr><td>Name : </td><td><asp:Label ID="Label6" runat="server" Text='<%# Bind("name") %>'></asp:Label></td></tr>
               <tr><td> Contact No   :</td><td><asp:Label ID="Label5" runat="server" Text='<%# Bind("contact_num") %>'></asp:Label><br /><br /></td></tr>
                <tr><td>Entered Date :</td><td><asp:Label ID="Label3" runat="server" Text='<%# Bind("e_date") %>'></asp:Label></td></tr>
                <tr><td>Modified Date:</td><td><asp:Label ID="Label1" runat="server" Text='<%# Bind("r_date") %>'></asp:Label></td></tr>
                <tr><td>Category   :</td><td><asp:Label ID="Label7" runat="server" Text='<%# Bind("category_type") %>'></asp:Label></td></tr>
                <tr><td>Attched File :</td><td><a href="./freetech_files/<%# Eval("file_name") %> " target="_blank"><%# Eval("file_name") %></a></td></tr>
                </table>
                       
           <table border="1">
           <tr><td> Problem Title :  <asp:TextBox ID="tb_ttl" runat="server"></asp:TextBox>
              
           </td></tr>
            <tr><td> 
           Description :  <asp:TextBox ID="tb_desc" runat="server"></asp:TextBox>
               
           </td></tr>
           <tr><td>  
               <asp:Button ID="bt_update" runat="server" Text="Update" 
                   OnClick="bt_update_Click"/>  </td></tr>
           </table>
           </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
              
                <ItemTemplate>
                 <div>
                  Problem Title : <asp:Label ID="Label4" runat="server" Text='<%# Bind("problem") %>'></asp:Label><br />
                  Description : <asp:Label ID="Label2" runat="server" Text='<%# Bind("description") %>'></asp:Label><br />
                  Reply <asp:TextBox ID="tb_reply"  TextMode="MultiLine" runat="server"></asp:TextBox>
                   
                  <asp:Button ID="bt_submit" runat="server" Text="Submit" OnClick="bt_submit_Click" 
                         />
                  </div><br />
                  Replies:
                  <div style="overflow:scroll;height:200px;">
                   <asp:Repeater ID="Repeater1" runat="server">
                  <ItemTemplate>
                 <table style="border-bottom:1px dashed blue;border-left:1px dashed blue;border-right:1px dashed blue;width:100%;"width:100%;" cellpadding="5" cellspacing="5">
                  <tr><td><span style="border-bottom:1px dashed red;">Reply Date:<%#DataBinder.Eval(Container, "Dataitem.e_date")%> </span><br />
                      <%#DataBinder.Eval(Container, "Dataitem.reply_msg")%>
                  </td></tr>
                 
                  </table>
                  </ItemTemplate>                 
                  </asp:Repeater>
                  </div>
                </ItemTemplate>
           </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" ForeColor="#F7F7F7" Font-Bold="True" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    </asp:GridView> 
    </ContentTemplate>
           </asp:UpdatePanel>  </td></tr></table>
                    </section>
                </aside>
                
            </div>
      
        </div>
    </form>
</body>

</html>
