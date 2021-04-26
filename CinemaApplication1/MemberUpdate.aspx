<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberUpdate.aspx.cs" Inherits="CinemaApplication1.WebForm28" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(../image/bkBlack.png);
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="w-50 mx-auto my-5 py-4 bg-dark p-md-5 container-fluid" style="opacity: 0.9;">
        <div class="row">
            <div class="container-fluid col-lg-8">
                <br>
                <h2 class="text-warning text-left">Update Information</h2>
                <br>
                <div class="form-group text-warning w-auto">
                    <label for="uname"><i class="fa fa-user" style="font-size: 24px"></i> Member Name :</label>
                    <asp:Label ID="mmbName" CssClass="text-warning" runat="server" Text=""></asp:Label>
                </div>
                <br />
                <div class="form-group text-warning w-auto">
                    <label for="email"><i class="fas fa-envelope" style="font-size: 24px"></i> Email </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmail" CssClass="error" Display="Dynamic" ErrorMessage="Please fill in your email"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" CssClass="error" Display="Dynamic" ErrorMessage="The email format is incorrect" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtEmail" class="form-control overflow-auto" placeholder="Email" runat="server"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-warning w-auto">
                    <label for="pwd"><i class="fa fa-lock" style="font-size: 24px"></i> Password </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPwd" CssClass="error" Display="Dynamic" ErrorMessage="Please fill in your password"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator5" runat="server" ControlToValidate="txtPwd" CssClass="error" Display="Dynamic" ErrorMessage="Password should more than5 words" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                    <asp:TextBox ID="txtPwd" class="form-control overflow-auto" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-warning w-auto">
                    <label for="conPwd"><i class="fa fa-lock" style="font-size: 24px"></i> Confirm Password </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtConfirmPwd" CssClass="error" Display="Dynamic" ErrorMessage="Please fill in confirm password"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPwd" ControlToValidate="txtConfirmPwd" CssClass="error" Display="Dynamic" ErrorMessage="Not same with password "></asp:CompareValidator>
                    <asp:TextBox ID="txtConfirmPwd" class="form-control overflow-auto" placeholder="Confirm Password" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-warning w-auto">
                    <label for="frgPwdQues"><i class="fas fa-unlock-alt" style="font-size: 24px"></i> Forget Password Question</label>
                    <br />
                    <asp:DropDownList ID="ddlForgetPwdQuestion" runat="server">
                        <asp:ListItem Value="1">What is your favourite Food?</asp:ListItem>
                        <asp:ListItem Value="2">Where do you live at?</asp:ListItem>
                        <asp:ListItem Value="3">Who are your favourite singer?</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <div class="form-group text-warning w-auto">
                    <label for="frgPwdAns"><i class="fas fa-key" style="font-size: 24px"></i> Forget Password Answer </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtForgetPwdAnswer" CssClass="error" Display="Dynamic" ErrorMessage="Please fill in the answer"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="txtForgetPwdAnswer" CssClass="error" Display="Dynamic" ErrorMessage="Cannot Insert Invalid Name" OnServerValidate="CustomValidator7_ServerValidate"></asp:CustomValidator>
                    <asp:TextBox ID="txtForgetPwdAnswer" class="form-control overflow-auto" placeholder="Forget Password Answer" runat="server"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="captcha">
                        <img id="captcha" src="BuildCaptcha.aspx" /></label>
                    <input type="button" value="Change Captcha" onclick="captcha.src='BuildCaptcha.aspx?r=' + (new Date()).getTime()" />
                    <asp:CustomValidator ID="CustomValidator6" runat="server" ControlToValidate="txtCaptcha" CssClass="error" Display="Dynamic" ErrorMessage="Captcha entered is wrong" OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCaptcha" CssClass="error" Display="Dynamic" ErrorMessage="Captcha is required"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtCaptcha" class="form-control overflow-auto" placeholder="Captcha Value" runat="server"></asp:TextBox>
                </div>
                <br />
                <asp:Button ID="Register" runat="server" class="btn btn-dark btn-outline-warning" Text="Update" OnClick="Register_Click" />
                <asp:Button ID="Clear" runat="server" class="btn btn-dark btn-outline-warning" CausesValidation="False" Text="Clear" OnClick="Clear_Click" />
                <asp:Button ID="Cancel" runat="server" class="btn btn-dark btn-outline-warning" Text="Cancel" CausesValidation="false" OnClick="Cancel_Click" />
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
