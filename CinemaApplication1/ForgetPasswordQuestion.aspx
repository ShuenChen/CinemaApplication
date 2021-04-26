<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgetPasswordQuestion.aspx.cs" Inherits="CinemaApplication1.ForgetPasswordQuestion" %>

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
        <h1>Forget Password Question</h1>
        <table class="tablecenter">
            <tr>
                <td>Question :
                </td>
                <td>
                    <asp:Label ID="lblQuestion" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Answer :
                </td>
                <td>
                    <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblPassword" runat="server" Text="Label" BackColor="White"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
        <asp:Button ID="btnLoginNow" runat="server" Text="Login Now" OnClick="btnLoginNow_Click" />
    </div>--%>

    <div class="w-50 mx-auto my-5 py-4 bg-dark p-md-5 container-fluid" style="opacity: 0.9;">
        <div class="row">
            <%--<div class="container-fluid col-sm-6">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/welcome2.jpg" class="img-fluid rounded-circle" /><br />
            </div>--%>
            <div class="container-fluid col-sm-6">
                <br>
                <h2 class="text-warning text-left">Forget Password Question</h2>
                <br>
                <div class="form-group text-warning w-auto">
                    <label for="uname"><i class="fas fa-question-circle" style="font-size: 24px"></i> Question</label>
                    <asp:Label ID="lblQuestion" runat="server" Text="Label" class="form-control overflow-auto"></asp:Label>
                </div>
                <br>
                <div class="form-group text-warning w-auto">
                    <label for="uname"><i class="fas fa-key" style="font-size: 24px"></i> Answer</label>
                    <asp:TextBox ID="txtAnswer" runat="server" class="form-control overflow-auto"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <asp:Label ID="lblPassword"  runat="server" Text="Label" BackColor="White"></asp:Label>
                </div>
                <br />
                <asp:Button ID="btnConfirm" runat="server" class="btn btn-dark btn-outline-warning" Text="Confirm" OnClick="btnConfirm_Click" />
                <asp:Button ID="btnClear" runat="server" class="btn btn-dark btn-outline-warning" Text="Clear" OnClick="btnClear_Click" />
                <asp:Button ID="btnLoginNow" runat="server" class="btn btn-dark btn-outline-warning" Text="Login Now" OnClick="btnLoginNow_Click" />

                <br />
            </div>
        </div>
    </div>
</asp:Content>
