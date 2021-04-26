<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberLogin.aspx.cs" Inherits="CinemaApplication1.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(../image/bkBlack.png);
            /*background-image: url(../image/cinemaBk1.jpg);*/
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <%--    <div class="center">
        <h1>Login as the member
        </h1>
        <table class="tablecenter">
            <tr>
                <td>Name:
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Password :
                </td>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
        <asp:Button ID="btnHomepage" runat="server" Text="Back to homepage" OnClick="btnHomepage_Click" />
        <br />
        <br />
        <asp:HyperLink ID="Registernow" NavigateUrl="~/MemberRegister.aspx" runat="server">Haven't register yet? Register now</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="ForgotPassword" NavigateUrl="~/ForgetPassword.aspx" runat="server">Forget Password?</asp:HyperLink>


    </div>--%>

        <div class="w-50 mx-auto my-5 py-4 bg-dark p-md-5 container-fluid" style="opacity: 0.9;">
            <div class="row">
                <div class="container-fluid col-sm-6">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/welcome2.jpg" class="img-fluid rounded-circle" /><br />
                </div>
                <div class="container-fluid col-sm-6">
                    <br>
                    <h2 class="text-warning text-left">Login</h2>
                    <br>
                    <div class="form-group text-warning w-auto">
                        <label for="uname"><i class="fa fa-user" style="font-size: 24px"></i> Username</label>
                        <asp:TextBox ID="txtName" runat="server" class="form-control overflow-auto" placeholder="Username"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group text-warning w-auto">
                        <label for="pwd"><i class="fa fa-lock" style="font-size: 24px"></i> Password</label>
                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" class="form-control overflow-auto" placeholder="Password"></asp:TextBox>
                    </div>
                    <br />
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" class="btn btn-dark btn-outline-warning" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" class="btn btn-dark btn-outline-warning" />
                    <asp:Button ID="btnHomepage" runat="server" Text="Back to homepage" OnClick="btnHomepage_Click" class="btn btn-dark btn-outline-warning" />
                    <br />
                    <br />
                    <asp:HyperLink ID="Registernow" CssClass="text-warning " NavigateUrl="~/MemberRegister.aspx" runat="server">Haven't register yet? Register now</asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="ForgotPassword" CssClass="text-warning " NavigateUrl="~/ForgetPassword.aspx" runat="server">Forget Password?</asp:HyperLink>
                </div>
            </div>
        </div>
</asp:Content>
