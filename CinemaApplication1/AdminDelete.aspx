<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminDelete.aspx.cs" Inherits="CinemaApplication1.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(../image/bkBlack2k.jpg);
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
                <h2 class="text-light text-left">Delete Movie Infomation</h2>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvId">Movie ID:</label>
                    <%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter movie ID" ControlToValidate="lblMovieId" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="This ID already exist" ControlToValidate="lblMovieId" CssClass="error" Display="Dynamic" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>--%>
                    <asp:Label ID="lblMovieId" runat="server"></asp:Label>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvId">Current Image:</label>
                    <asp:Image ID="imagePhoto" runat="server" Width="140px" Height="200px" ImageUrl='<%# Bind("image_path") %>'></asp:Image>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvName">Movie Name:</label>
                    <asp:Label ID="lblMovieName" runat="server"></asp:Label>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvLge">Movie Language:</label>
                    <asp:Label ID="lblMovieLanguage" runat="server"></asp:Label>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvHour">MovieHour:</label>
                    <asp:Label ID="lblMovieHour" runat="server"></asp:Label>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvType">Movie Type:</label>
                    <asp:Label ID="lblMovieType" runat="server"></asp:Label>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvDes">Category:</label>
                    <asp:Label ID="lblCategory" runat="server"></asp:Label>
                </div>
                <br />
                <asp:Button ID="btnDelete" runat="server" class="btn btn-primary" Text="Delete" OnClick="btnDelete_Click" />
                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" OnClick="btnCancel_Click" />
                <br />
                <br />
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
