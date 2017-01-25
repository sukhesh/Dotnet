<%@ Page Language="C#" AutoEventWireup="true" CodeFile="onsitesolution.aspx.cs" Inherits="user_onsitesolution" %>

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
    <link href="style.css" rel="stylesheet" type="text/css" />
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
                        <h1>Onsite Solution
                       
                        <small>Get Onsite Solution From Moderator.</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">Onsite Solution</li>
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
                                   
                                    <h2> To Get Onsite/Online Solution <a href="freetech_files/TeamViewer_Setup.exe"> Download Teamviewer </a> and follow the below steps 
                                    </h2>  <h3>  1. Download And Install TeamViewer</h3>
   
                                            <h3> 2. Send User Id and Password to moderator through room.</h3>
                                           
                                            <h3>3.Wait for the Response.</h3>
    
                                   
                                    
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
