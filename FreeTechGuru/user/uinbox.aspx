<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uinbox.aspx.cs" Inherits="user_uinbox" %>

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
</head>
<body class="skin-black">
    <form id="form1" runat="server">
   <div>

            <uc1:header runat="server" ID="header" />
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <uc1:sidemenu runat="server" ID="sidemenu" />
                <aside class="right-side">
                    <section class="content-header">
                        <h1>Messages from Moderator
                       
                        <small>Moderators response for your complaint.</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">Manage Complaints</li>
                        </ol>
                        <br />
                       <br />
                        <br />
                         <div class="box-body">
                           
                             <table class="table table-hover table-bordered">
                                            <tr>
                                                <td>Title</td>
                                                <td>Message</td>
                                                <td>Date</td>
                                                
                                                <td></td>
                                            </tr>
                                 <asp:Repeater ID="rptr_msgs" runat="server">
                                     <ItemTemplate>
                                         <tr>
                                             <td><%# Eval("title") %></td>
                                             <td><%# Eval("message") %></td>
                                             <td><%# Eval("n_date") %></td>
                                             <td>
                                               <asp:LinkButton ID="lnk_delete" ToolTip="Delete" CommandArgument='<%# Eval("n_id") %>' OnClick="lnk_delete_Click" OnClientClick="return confirm('Are you sure delete this record?')" runat="server"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                             </td>
                                         </tr>
                                     </ItemTemplate>
                                 </asp:Repeater>
                                 </table>

                        </div>
                    
                    </section>
                </aside>
                
            </div>
      
        </div>
    </form>
</body>
</html>
