<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aMails.aspx.cs" Inherits="admin_aMails" %>

<%@ Register Src="~/admin/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/admin/sidemenu.ascx" TagPrefix="uc1" TagName="sidemenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'/>
        
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        
        <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />
        
        <link href="../css/admin-section.css" rel="stylesheet" type="text/css" />
        <link href="../css/custom.css" rel="stylesheet" type="text/css" />
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body class="skin-black">
    <form id="form1" runat="server">

        <div>

            <uc1:header runat="server" ID="header" />
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <uc1:sidemenu runat="server" ID="sidemenu" />
                <aside class="right-side">
                    <section class="content-header">
                        <h1>Mails
                       
                        <small>.</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">Mails</li>
                        </ol>
                        <br />
                        
                        <div class="container">

                        <div class="col-lg-10">
                            <div class="box box-info">
                                <div class="box-header">
                                    
                                    <h3 class="box-title">Manage Mails</h3>
                                    </div>
                               
                                
                                <br />
                                
                                <div id="server-message"></div>
                                
                                <div class="box-body">
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" DataKeyNames="e_t_id">
            <Columns>
                <asp:TemplateField HeaderText="Sr_No">
                   <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Complaints And User Details">
                    <ItemTemplate>
                    <table>   <tr><td style="color: red">Date : </td><td>  <asp:Label ID="Label9" runat="server" Text='<%# Bind("e_date") %>' ForeColor="Red"></asp:Label></td></tr>
                    <tr><td style="color: black">User Name :  </td><td><asp:Label ID="Label5" runat="server" Text='<%# Bind("name") %>' ForeColor="Black"></asp:Label></td></tr>
                     <tr><td style="color: #ff33ff">Email Id :  </td><td><asp:Label ID="lb_emailid" runat="server" Text='<%# Bind("email_id") %>' ForeColor="Fuchsia"></asp:Label></td></tr>
                      <tr><td>Problem Type :  </td><td><asp:Label ID="Label7" runat="server" Text='<%# Bind("type") %>' ForeColor="#804000"></asp:Label></td></tr>
                       <tr><td style="color: #0000ff">Description :  </td><td><asp:Label ID="Label8" runat="server" Text='<%# Bind("description") %>' ForeColor="Blue"></asp:Label></td></tr>
                     
                     </table>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reply">
                    <ItemTemplate>
                      <table> 
                      <tr><td style="width: 80px"> Description </td><td> <asp:TextBox ID="tb_desc" runat="server" TextMode="MultiLine" Height="71px" Width="232px"></asp:TextBox></td></tr>
                      <tr><td style="width: 80px">Upload Files </td><td>  <asp:FileUpload ID="fileupload1" runat="server" class="multi" Width="199px" /> 
                          <br />
                      </td></tr>
                       </table>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                     <ItemTemplate>
                       <a href="#"> <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/send_icon.gif" OnClick="ImageButton1_Click" /></a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        
        </asp:GridView>
                                    
                             </div>
                               
                                
                            </div>
                           
                        </div>

                    </div>
                        
                    </section>
                </aside>
            </div>
            
        </div>

    </form>
</body>

</html>
