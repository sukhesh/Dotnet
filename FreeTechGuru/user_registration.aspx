<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_registration.aspx.cs" Inherits="user_registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="assets/css/style.css" rel="stylesheet" />
    
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .steps{
            padding:30px 20px;
            text-align:center;
            vertical-align:middle;
            border-radius:50%;
            font-size:12px;
            font-weight:400;
            display:inline-block;
            background:#a1a1a1;
        }
        .steps.active{background:#A9D86E}
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">
        <h1 class="text-center"> Register Here </h1> 
    <div align="center">
    
        <asp:Button ID="btnStep1" runat="server" CssClass="steps active" Text="Step 1" OnClick="btnStep1_Click" />
        <%--<asp:Label ID="lblStep1" runat="server"  CssClass="steps active" Text="Step 1"></asp:Label>--%>
&nbsp;&nbsp;
        <asp:Button ID="btnStep2" runat="server" CssClass="steps active" Text="Step 2" OnClick="btnStep2_Click" />
        <%--<asp:Label ID="lblStep2" runat="server"  CssClass="steps" Text="Step 2"></asp:Label>--%>
&nbsp;&nbsp;
        <asp:Button ID="btnStep3" runat="server" CssClass="steps active" Text="Step 3" OnClick="btnStep3_Click" />
        <%--<asp:Label ID="lblStep3" runat="server" CssClass="steps" Text="Step 3"></asp:Label>--%>
    
    </div>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" >
            <fieldset title="Step1" class="step" id="default-step-0" style="display: block;">
                                      <legend> </legend>
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Name</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Name"></asp:TextBox>
                                              <div>
                                                  <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Your Name" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                                              </div>
                                          </div>
                                      </div>
                
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Middle Name</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtMiddleName" CssClass="form-control" placeholder="Middle Name"></asp:TextBox>
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Last Name</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                          </div>
                                      </div>

                               <div class="form-group">
                                          <label class="col-lg-2 control-label">Date Of Birth</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtDOB" CssClass="form-control" placeholder="Date If Birth"></asp:TextBox>
                                          </div>
                                      </div>
                
                                    <div class="form-group">
                                          <label class="col-lg-2 control-label">Gender</label>
                                          <div class="col-lg-10">
                                          <div class="radio">
                                          <asp:RadioButton ID="rbMale" runat="server" GroupName="Gender"/>
                                               Male  
                                          </div>
                                          <div class="radio">
                                          <asp:RadioButton ID="rbFemale"  runat="server" GroupName="Gender" />
                                               Female
                                          </div>

                                      </div>
                                      </div>

                <div class="col-lg-10">
                    <p id="default-buttons-0" class="default-buttons">
                        <asp:Button ID="up1NextBtn" runat="server" class="button-next  btn btn-info pull-right" Text="Next" OnClick="up1NextBtn_Click" />

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
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ErrorMessage="Email ID is not Valid" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ErrorMessage="Please Enter Your EmailID" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                          </div>
                                      </div>
               
                
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Phone</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" placeholder="Phone"></asp:TextBox>
                                              <div>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ErrorMessage="Enter Valid Number" ControlToValidate="txtPhone" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                                              </div>
                                          </div>
                                      </div>
                
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Password</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                          </div>
                                      </div>
                                     <div class="form-group">
                                          <label class="col-lg-2 control-label">Confirm Password</label>
                                          <div class="col-lg-8">
                                              <asp:TextBox runat="server" ID="txtConfrmPwd" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                              <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfrmPwd" ErrorMessage="Password doesnt match" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Address</label>
                                          <div class="col-lg-8">
                                             <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" placeholder="Address" TextMode="MultiLine" Height="150px"></asp:TextBox>
                                             
                                          </div>
                                      </div>

                <div class="col-lg-10">
                    <div class="col-lg-4 col-lg-offset-2">
                        <p class="default-buttons ">
                            <asp:Button ID="up2PreviousBtn" runat="server" class="button-back btn btn-info" Text="Previous" OnClick="up2PreviousBtn_Click" />
                        </p>
                    </div>

                    <div class="col-lg-6">
                        <p class="default-buttons pull-right">
                            <asp:Button ID="up2NextBtn" runat="server" class="button-next  btn btn-info" Text="Next" OnClick="up2NextBtn_Click" />
                        </p>
                    </div>

                    
                </div>

            </fieldset>
        </asp:Panel>
        
        <p class="default-buttons">
            &nbsp;</p>
        <asp:Panel ID="Panel3" runat="server">
            <fieldset title="Step 3" class="step" id="default-step-2" style="display: block;">
                                      <legend> </legend>
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Name</label>
                                          <div class="col-lg-10">
                                             <asp:Label runat="server" ID="lblName" CssClass="form-control-static"></asp:Label>
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Middle Name</label>
                                          <div class="col-lg-10">
                                              <asp:Label runat="server" ID="lblMiddleName" CssClass="form-control-static"></asp:Label>
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Last Name</label>
                                          <div class="col-lg-10">
                                             <asp:Label runat="server" ID="lblLastName" CssClass="form-control-static"></asp:Label>
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Date Of Birth</label>
                                          <div class="col-lg-10">
                                              <asp:Label runat="server" ID="lblDOB" CssClass="form-control-static"></asp:Label>
                                          </div>
                                      </div>
                                     
                                     
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Gender</label>
                                          <div class="col-lg-10">
                                              <asp:Label runat="server" ID="lblGender" CssClass="form-control-static"></asp:Label>
                                          </div>
                                      </div>

                                    <div class="form-group">
                                          <label class="col-lg-2 control-label">Email</label>
                                          <div class="col-lg-10">
                                              <asp:Label runat="server" ID="lblEmail" CssClass="form-control-static"></asp:Label>
                                          </div>
                                      </div>
                                    <div class="form-group">
                                          <label class="col-lg-2 control-label">Phone</label>
                                          <div class="col-lg-10">
                                              <asp:Label runat="server" ID="lblPhone" CssClass="form-control-static"></asp:Label>
                                          </div>
                                      </div>
                                    
                                    <div class="form-group">
                                          <label class="col-lg-2 control-label">Address</label>
                                          <div class="col-lg-10">
                                              <asp:Label runat="server" ID="lblAddress" CssClass="form-control-static"></asp:Label>
                                          </div>
                                      </div>
                <div class="col-lg-10">
                    <div class="col-lg-4 col-lg-offset-2">
                                  <p  class="default-buttons">
                                      <asp:Button ID="up3PreviousBtn" runat="server" class="button-back btn btn-info" Text="Previous" OnClick="up3PreviousBtn_Click"/>
                                     </p>
                        </div>  
                                      <div class="col-lg-6">
                                      <p class="default-buttons pull-right">
                                        <asp:Button ID="up3FinishBtn" runat="server" class="finish btn btn-danger" Text="Finish" OnClick="up3FinishBtn_Click"/>
                                      </p>
                                     </div> 
                    </div>
                                 

            </fieldset>
        </asp:Panel>
         <div align="center">
            <p> <img src="img/test_1.gif" alt="" width="19" height="20"/> 
            <em>We can let circumstances rule us, or we can take charge and rule our lives from within </em>.
            <img src="img/test_2.gif" alt="" width="19" height="20"/> 
        </p>
        </div>

        <script src="js/jquery.js"></script>
        <script src="js/plugins/daterangepicker/daterangepicker.js"></script>
        <script>
            $(function () {
                $(".datepicker").daterangepicker();
            });
        </script>
        <%--<asp:Panel ID="Panel4" runat="server">
                                      <div class="form-group">
                                          <label class="col-lg-2 control-label">Confirmation ID</label>
                                      <div class="col-md-3 col-xs-11">

                                      <div class="form-group" >
                                         <asp:TextBox runat="server" ID="txtConfrmID" ReadOnly="false" CssClass="form-control" placeholder="Confirmation ID"></asp:TextBox>
                                          <br />   
                                          <asp:Button ID="btnConfirmID" runat="server" class="button-back btn btn-info" Text="Confirm" OnClick="btnConfirmID_Click"/>
                                      </div>
                                     
                                  </div>
                              </div>
        </asp:Panel>--%>
    </form>
</body>
</html>
