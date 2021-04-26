<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="CinemaApplication1.WebForm23" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(../image/bkBlack.png);
            /*background-image: url(../image/cinemaBk3.jpg);*/
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="w-25 mx-auto my-5 py-4 bg-dark p-md-5 container-fluid" style="opacity: 0.9;">
        <div class="row">
            <div class="container-fluid col-lg-8">
                <br>
                <h2 class="text-warning text-left">Add New Admin</h2>
                <br>
                <div class="form-group text-warning w-auto">
                    <label for="uname"><i class="fa fa-user" style="font-size: 24px"></i> Name </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" CssClass="error" Display="Dynamic" ErrorMessage="Please fill in your name"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtName" CssClass="error" Display="Dynamic" ErrorMessage="The admin name have been used " OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="txtName" CssClass="error" Display="Dynamic" ErrorMessage="Cannot Insert Invalid Name" OnServerValidate="CustomValidator7_ServerValidate"></asp:CustomValidator>
                    <asp:TextBox ID="txtName" runat="server" class="form-control overflow-auto" placeholder="Name"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-warning w-auto">
                    <label for="email"><i class="fas fa-envelope" style="font-size: 24px"></i> Email </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" CssClass="error" Display="Dynamic" ErrorMessage="Please fill in your email"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" CssClass="error" Display="Dynamic" ErrorMessage="The email format is incorrect" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtEmail" class="form-control overflow-auto" placeholder="Email" runat="server"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-warning w-auto">
                    <label for="pwd"><i class="fa fa-lock" style="font-size: 24px"></i> Password </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" CssClass="error" Display="Dynamic" ErrorMessage="Please fill in your password"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtPassword" CssClass="error" Display="Dynamic" ErrorMessage="Password should more than5 words" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                    <asp:TextBox ID="txtPassword" class="form-control overflow-auto" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-warning w-auto">
                    <label for="txtPwd"><i class="fa fa-lock" style="font-size: 24px"></i> Confirm Password </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtConfirmPassword" CssClass="error" Display="Dynamic" ErrorMessage="Please fill in confirm password"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" CssClass="error" Display="Dynamic" ErrorMessage="Not same with password "></asp:CompareValidator>
                    <asp:TextBox ID="txtConfirmPassword" class="form-control overflow-auto" placeholder="Confirm Password" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <br />
                <asp:Button ID="btnConfirm" runat="server" class="btn btn-dark btn-outline-warning" Text="Register" OnClick="btnConfirm_Click" />&nbsp;
                <asp:Button ID="btnClear" runat="server" class="btn btn-dark btn-outline-warning" CausesValidation="False" Text="Clear" OnClick="btnClear_Click" />&nbsp;
                <asp:Button ID="Cancel" runat="server" class="btn btn-dark btn-outline-warning" Text="Cancel" CausesValidation="false" OnClick="Cancel_Click" />
                <br />
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
