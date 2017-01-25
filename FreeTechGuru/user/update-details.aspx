<%@ Page Language="C#" AutoEventWireup="true" CodeFile="update-details.aspx.cs" Inherits="user_update_details" %>

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
                        <h1>Update Details
                       
                        <small>Update Your details.</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">Update Details</li>
                        </ol>
                        <br />
                        
                        <div class="container">

                        <div class="col-lg-10">
                            <div class="box box-info">
                                <div class="box-header">
                                    
                                    <h3 class="box-title"></h3>
                                    </div>
                               
                                
                                <br />
                                <div>
                                    <asp:Label ID="lblMsg" runat="server" Text="" Display="Dynamic"></asp:Label>
                                    
                                </div>
                                <div id="server-message"></div>
                                
                                <div class="box-body">
                                   
                                    <div class="form-group">
                                        <label>Name</label>
                                        <asp:TextBox ID="txt_Name" CssClass="form-control" placeholder="Name" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Email Address</label>
                                        <asp:TextBox ID="txt_email" CssClass="form-control" placeholder="Email Address" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <asp:TextBox ID="txt_phone" onblur="" CssClass="form-control" placeholder="Phone" runat="server"></asp:TextBox>
                                    </div>
                                    
                               <div class="box-footer clearfix">
                                    <asp:LinkButton ID="lnk_save" class="pull-right btn btn-default"  runat="server" OnClick="lnk_save_Click">Save <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
                                </div>
                                
                            </div>
                           
                        </div>

                    </div>
                        
                    </section>
                </aside>
            </div>
            
        </div>

    </form>
</body></html>
