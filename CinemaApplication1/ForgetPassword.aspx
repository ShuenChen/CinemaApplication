<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="CinemaApplication1.ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link href="css/RegisterandLogin.css" rel="stylesheet" type="text/css" />
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
<%--    <div class="center">
        <h1 style="">Forget Password</h1>
        <table class="tablecenter">
            <tr>
                <td>Name :
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
        <asp:Button ID="btnHomepage" runat="server" Text="Homepage" OnClick="btnHomepage_Click" />
    </div>--%>

    <div class="w-50 mx-auto my-5 py-4 bg-dark p-md-5 container-fluid" style="opacity: 0.9;">
        <div class="row">
            <%--<div class="container-fluid col-sm-6">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/welcome2.jpg" class="img-fluid rounded-circle" /><br />
            </div>--%>
            <div class="container-fluid col-sm-6">
                <br>
                <h2 class="text-warning text-left">Forget Password</h2>
                <br>
                <div class="form-group text-warning w-auto">
                    <label for="uname"><i class="fa fa-user" style="font-size: 24px"> </i>Enter Your Name</label>
                    <asp:TextBox ID="txtName" runat="server" class="form-control overflow-auto" placeholder="Username"></asp:TextBox>
                </div>
                <br />
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" class="btn btn-dark btn-outline-warning" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" class="btn btn-dark btn-outline-warning" />
                <asp:Button ID="btnHomepage" runat="server" Text="Homepage" OnClick="btnHomepage_Click" class="btn btn-dark btn-outline-warning" />
                <br />
            </div>
        </div>
    </div>
</asp:Content>
