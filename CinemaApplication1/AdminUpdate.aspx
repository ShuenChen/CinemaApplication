<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminUpdate.aspx.cs" Inherits="CinemaApplication1.WebForm12" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

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
    <div class="w-50 mx-auto my-5 py-4 bg-dark p-md-5 container-fluid" style="opacity: 0.9;">
        <div class="row">
            <div class="container-fluid col-lg-8">
                <br>
                <h2 class="text-light text-left">Update Movie Infomation</h2>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvId">Movie ID</label>
                    <%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter movie ID" ControlToValidate="lblMovieId" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="This ID already exist" ControlToValidate="lblMovieId" CssClass="error" Display="Dynamic" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>--%>
                    <asp:Label ID="lblMovieId" runat="server" class="form-control overflow-auto" Text='<%# Bind("MovieId") %>'></asp:Label>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvId">Current Image</label>
                    <asp:Image ID="imagePhoto" runat="server" Width="140px" Height="200px" ImageUrl='<%# Bind("image_path") %>'></asp:Image>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvImage">Movie Image</label>
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="New Picture is required" ControlToValidate="FileUpload1" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvName">Movie Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter movie name" ControlToValidate="txtMovieName" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="txtMovieName" CssClass="error" Display="Dynamic" ErrorMessage="Cannot Insert Invalid Name" OnServerValidate="CustomValidator7_ServerValidate"></asp:CustomValidator>
                    <asp:TextBox ID="txtMovieName" runat="server" class="form-control overflow-auto" placeholder="Movie Name"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvLge">Movie Language</label>
                    <br />
                    <asp:DropDownList ID="ddlMovieLanguage" runat="server">
                        <asp:ListItem>EN</asp:ListItem>
                        <asp:ListItem>CN</asp:ListItem>
                        <asp:ListItem>BM</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvHour">MovieHour</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please enter hour" ControlToValidate="txtMovieHour" CssClass="error"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="The format is wrong" ControlToValidate="txtMovieHour" CssClass="error" Display="Dynamic" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtMovieHour" class="form-control overflow-auto" placeholder="Movie Hour" runat="server"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvType">Movie Type</label>
                    <br />
                    <asp:DropDownList ID="ddlMovieType" runat="server">
                        <asp:ListItem>U</asp:ListItem>
                        <asp:ListItem>P13</asp:ListItem>
                        <asp:ListItem>R18</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvCtg">Movie Category</label>
                    <br />
                    <asp:DropDownList ID="ddlmovieCategory" runat="server">
                        <asp:ListItem Value="N">Newest</asp:ListItem>
                        <asp:ListItem Value="H">Hot</asp:ListItem>
                        <asp:ListItem Value="P">Promotion</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvDes">Movie Description</label>
                    <textarea id="tdescription" class="form-control overflow-auto" placeholder="Movie Description" runat="server" />
                </div>
                <br />
                <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary" Text="Update" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                <br />
                <br />
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
