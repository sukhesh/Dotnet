<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sidemenu.ascx.cs" Inherits="moderator_sidemenu" %>

<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../project_files/avatar.png" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <p>Hello, <%= Session["f_name"].ToString() %></p>

            </div>
        </div>
        <!-- search form -->
        <div class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..." />
                <span class="input-group-btn">
                    <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                </span>
            </div>
        </div>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li>
                <a href="minbox.aspx">
                    <i class="fa fa-dashboard"></i><span>Inbox</span>
                </a>
            </li>            
            <li>
                <a href="UserWelcome.aspx">
                    <i class="fa fa-dashboard"></i><span>Tickets</span>
                </a>
            </li>
            <li>
                <a href="mMails.aspx">
                    <i class="fa fa-dashboard"></i><span>Mails</span>
                </a>
            </li>      
            
            <li>
                <a href="help.aspx">
                    <i class="fa fa-dashboard"></i><span>Help</span>
                </a>
            </li> 
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-bar-chart-o"></i>
                    <span>My Settings</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="update-details.aspx"><i class="fa fa-angle-double-right"></i>Update Details</a></li>
                    <li><a href="change-password.aspx"><i class="fa fa-angle-double-right"></i>Change Password</a></li>
                </ul>
            </li>         
            
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
