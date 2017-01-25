<%@ Page Language="C#" AutoEventWireup="true" CodeFile="help.aspx.cs" Inherits="moderator_help" %>

<%@ Register Src="~/moderator/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/moderator/sidemenu.ascx" TagPrefix="uc1" TagName="sidemenu" %>

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
                        <h1>
                       
                        <small></small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">Help</li>
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
                                   
                                  Enter Search Keyword : <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox> 
                                    <asp:Button ID="btnSearch" runat="server"  CssClass="btn-default" Text="Search" OnClick="btnSearch_Click"/>
                                    <br />
                                    <br />
                                    <asp:Panel ID="panel1" runat="server">
                                        <table class="table table-hover table-bordered">
                                            <tr>
                                                <td>Title</td>
                                                <td>Description</td>
                                                <td>Keywords</td>
                                                <td>Files</td>
                                            </tr>
                                 <asp:Repeater ID="rptr_msgs" runat="server">
                                     <ItemTemplate>
                                         <tr>
                                             <td><%# Eval("title") %></td>
                                             <td><%# Eval("description") %></td>
                                             <td><%# Eval("keywords") %></td>
                                             <td>
                                               <%--<asp:LinkButton ID="lnk_delete" ToolTip="Delete" CommandArgument='<%# Eval("n_id") %>' OnClick="lnk_delete_Click" OnClientClick="return confirm('Are you sure delete this record?')" runat="server"><i class="fa fa-trash-o"></i></asp:LinkButton>--%>
                                             </td>
                                         </tr>
                                     </ItemTemplate>
                                 </asp:Repeater>
                                 </table>
                                    </asp:Panel>
                                    
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
