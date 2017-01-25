<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aNotifications.aspx.cs" Inherits="admin_aNotifications" %>

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
                        <h1>Notifications
                       
                        <small>.</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">Notifications</li>
                        </ol>
                        <br />
                        
                        <div class="container">

                        <div class="col-lg-10">
                            <div class="box box-info">
                                <div class="box-header">
                                    
                                    <h3 class="box-title"></h3>
                                    </div>
                               
                              
                                <br />
                                
                                <div id="server-message"></div>
                                
                                <div class="box-body">
                                   
                                     <asp:Label ID="lbl_reply" runat="server" ForeColor="Red"></asp:Label>
            <br />
            User Type&nbsp; :&nbsp; 
            <asp:DropDownList ID="drop_usertype" runat="server" AutoPostBack="True" 
                onselectedindexchanged="drop_sender_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="drop_usertype" Display="None" 
                ErrorMessage="Please select User Type" SetFocusOnError="True" 
                ValidationGroup="validate_notification" InitialValue="select"></asp:RequiredFieldValidator>
            
            <br />
            <br />
            Users:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="drop_user" runat="server" AutoPostBack="True" 
                onselectedindexchanged="drop_user_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            To :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             
            <asp:ListBox ID="list_to" runat="server" 
                        AutoPostBack="True" Height="95px" 
             Width="254px" onselectedindexchanged="list_to_SelectedIndexChanged">
        </asp:ListBox>
            <br />
            <br />
            Title :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_title" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txt_title" Display="None" ErrorMessage="Please enter title" 
                SetFocusOnError="True" ValidationGroup="validate_notification"></asp:RequiredFieldValidator>
        
            <br />
            <br />
            Description :
            <asp:TextBox ID="txt_description" runat="server" Height="62px" TextMode="MultiLine" 
                Width="173px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txt_description" Display="None" 
                ErrorMessage="Please enter description" SetFocusOnError="True" 
                ValidationGroup="validate_notification"></asp:RequiredFieldValidator>
            
            <br />
            <asp:Button ID="btn_send" runat="server" Text="Send" onclick="btn_send_Click" 
                ValidationGroup="validate_notification" />
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
