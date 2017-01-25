<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createModerator.aspx.cs" Inherits="admin_createModerator" %>

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
                        <h1>Manage Moderators
                       
                        <small>Add new moderator</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">Create Moderator</li>
                        </ol>
                        <br />
                        
                        <div class="container">

                        <div class="col-lg-10">
                            <div class="box box-info">
                                <div class="box-header">
                                    
                                    <h3 class="box-title">Add Moderator</h3>
                                    </div>
                               
                                
                                <br />
                                
                                <div id="server-message"></div>
                                
                                <div class="box-body">
                                   <asp:Button ID="addButton" runat="server"  CssClass="btn-info" Text="Add" Width="70px" OnClick="addButton_Click"/>
                                    <asp:Button ID="editButton" runat="server" CssClass="btn-info" Text="Edit" Width="70px" />
                                    <asp:Label ID="msgLbl" runat="server" ></asp:Label>
                                    <br />
                                    <br />
            
                <asp:Panel ID="Panel1" runat="server" >
                  <fieldset title="Step1" class="step" id="default-step-0" style="display: block;">
                         <legend> </legend>
                                 
                            <asp:Image ID="img_moderator" runat="server" Height="90px" Width="80px" AlternateText="Moderator Image"  />
                                    <asp:FileUpload ID="moderatorPic" runat="server" />
                                    <asp:Button ID="BtnModeratorPic" runat="server" Text="Upload" />
                                   <br /><br />
                            
                             <div class="form-group">
                                          <label class="col-lg-2 control-label">Name</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Name"></asp:TextBox>
                                              <div>
                                                 <%-- <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                              </div>
                                          </div>
                                      </div>

                                    <br /><br />

                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Middle Name</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtMiddleName" CssClass="form-control" placeholder="Middle Name"></asp:TextBox>
                                          </div>
                                      </div>

                                            <br /><br />
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Last Name</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                          </div>
                                      </div>

                                            <br /><br />

                               <div class="form-group">
                                          <label class="col-lg-2 control-label">Date Of Birth</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtDOB" CssClass="form-control" placeholder="Date If Birth"></asp:TextBox>
                                          </div>
                                      </div>
                
                                            <br /><br />

                                             <div class="form-group">
                                          <label class="col-lg-2 control-label">Qualification</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtQualification" CssClass="form-control" placeholder="Qualification"></asp:TextBox>
                                          </div>
                                      </div>

                                            <br /><br />
                              <div class="col-lg-10">
                                        <p id="default-buttons-0" class="default-buttons">
                                        <asp:Button ID="panel1NextBtn" runat="server" class="button-next  btn btn-info pull-right" Text="Next" OnClick="panel1NextBtn_Click" />
                                        </p>
                              </div>

            </fieldset>
        </asp:Panel>
       

        <asp:Panel ID="Panel2" runat="server">
            <fieldset title="Step 2" class="step" id="default-step-1" style="display: block;">
                                      <legend> </legend>
                                    <div class="form-group">
                                          <label class="col-lg-2 control-label">Email</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                               <div>
                                                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ErrorMessage="Email ID is not Valid" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ErrorMessage="Please Enter Your EmailID" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </div>
                                          </div>
                                      </div>
               
                <br /><br />
                
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Phone</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" placeholder="Phone"></asp:TextBox>
                                              <div>
                                                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ErrorMessage="Enter Valid Number" ControlToValidate="txtPhone" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>--%>
                                              </div>
                                          </div>
                                      </div>
                <br /><br />
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Password</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                          </div>
                                      </div>
                <br /><br />
                                    
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Address</label>
                                          <div class="col-lg-8">
                                             <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" placeholder="Address" TextMode="MultiLine" Height="150px"></asp:TextBox>
                                             
                                          </div>
                                      </div>
               <br /><br />

                <div class="col-lg-10">
                    <div class="col-lg-4 col-lg-offset-2">
                        <p class="default-buttons ">
                            <asp:Button ID="panel2PreviousBtn" runat="server" class="button-back btn btn-info" Text="Previous" OnClick="panel2PreviousBtn_Click"  />
                        </p>
                    </div>

                    <div class="col-lg-6">
                        <p class="default-buttons pull-right">
                            <asp:Button ID="panel2NextBtn" runat="server" class="button-next  btn btn-info" Text="Next" OnClick="panel2NextBtn_Click" />
                        </p>
                    </div>

                    
                </div>

            </fieldset>
        </asp:Panel>
        
        
        <asp:Panel ID="Panel3" runat="server">
            <fieldset title="Step 2" class="step" id="default-step-2" style="display: block;">
                                      <legend> </legend>
                                    <div class="form-group">
                                          <label class="col-lg-2 control-label">City</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="City"></asp:TextBox>
                                               <div>
                                                    
                                                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ErrorMessage="Please Enter Your EmailID" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </div>
                                          </div>
                                      </div>
               
                <br /><br />
                
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">State</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="State"></asp:TextBox>
                                              <div>
                                               
                                              </div>
                                          </div>
                                      </div>
                <br /><br />
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Pin Code</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="TextBox3" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                          </div>
                                      </div>
                <br /><br />
                                    
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Country</label>
                                          <div class="col-lg-8">
                                             <asp:TextBox runat="server" ID="TextBox4" CssClass="form-control" placeholder="Country"></asp:TextBox>
                                             
                                          </div>
                                      </div>
                <br /><br />

                <div class="col-lg-10">
                    <div class="col-lg-4 col-lg-offset-2">
                        <p class="default-buttons ">
                            <asp:Button ID="panel3PrvBtn" runat="server" class="button-back btn btn-info" Text="Previous" OnClick="panel3PrvBtn_Click"  />
                        </p>
                    </div>

                    <div class="col-lg-6">
                        <p class="default-buttons pull-right">
                            <asp:Button ID="panel3NextBtn" runat="server" class="button-next  btn btn-info" Text="Next"  />
                        </p>
                    </div>

                    
                </div>

            </fieldset>
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
