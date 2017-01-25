<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sidemenu.ascx.cs" Inherits="user_sidemenu" %>

<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../project_files/avatar.png" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <p>Hello, <%= Session["fullname"].ToString() %></p>

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
                <a href="uinbox.aspx">
                    <i class="fa fa-dashboard"></i><span>Inbox</span>
                </a>
            </li>            
            <li>
                <a href="UserWelcome.aspx">
                    <i class="fa fa-dashboard"></i><span>Rise Ticket</span>
                </a>
            </li>
            <li>
                <a href="ticket_reply.aspx">
                    <i class="fa fa-dashboard"></i><span>Ticket Details</span>
                </a>
            </li>      
            
            <li>
                <a href="onsitesolution.aspx">
                    <i class="fa fa-dashboard"></i><span>Online Solution</span>
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
