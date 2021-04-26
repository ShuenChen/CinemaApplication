<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MovieInsert.aspx.cs" Inherits="CinemaApplication1.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(../image/cinemaBk3.jpg);
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
                <h2 class="text-light text-left">Add New Movie</h2>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvId">Movie ID</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter movie ID" ControlToValidate="movieId" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="This ID already exist" ControlToValidate="movieId" CssClass="error" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                 <asp:CustomValidator ID="CustomValidator2" runat="server" CssClass="error" Display="Dynamic" ErrorMessage="Cannot Insert Invalid Id" OnServerValidate="CustomValidator2_ServerValidate" ControlToValidate="movieId"></asp:CustomValidator>
                    <asp:TextBox ID="movieId" runat="server" class="form-control overflow-auto" placeholder="Movie ID"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvImage">Movie Image</label>
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="New Picture is required" ControlToValidate="FileUpload1" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvName">Movie Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter movie name" ControlToValidate="movieName" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator7" runat="server" CssClass="error" Display="Dynamic" ErrorMessage="Cannot Insert Invalid Name" OnServerValidate="CustomValidator7_ServerValidate" ControlToValidate="movieName"></asp:CustomValidator>
                    <asp:TextBox ID="movieName" runat="server" class="form-control overflow-auto" placeholder="Movie Name"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvLge">Movie Language</label>
                    <br />
                    <asp:DropDownList ID="movieLanguage" runat="server">
                        <asp:ListItem>EN</asp:ListItem>
                        <asp:ListItem>CN</asp:ListItem>
                        <asp:ListItem>BM</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvHour">MovieHour</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please enter hour" ControlToValidate="movieHour" CssClass="error"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="The format is wrong" ControlToValidate="movieHour" CssClass="error" Display="Dynamic" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="movieHour" class="form-control overflow-auto" placeholder="Movie Hour" runat="server"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvType">Movie Type</label>
                    <br />
                    <asp:DropDownList ID="movieType" runat="server">
                        <asp:ListItem>U</asp:ListItem>
                        <asp:ListItem>P13</asp:ListItem>
                        <asp:ListItem>R18</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <div class="form-group text-light w-auto">
                    <label for="mvCtg">Movie Category</label>
                    <br />
                    <asp:DropDownList ID="movieCategory" runat="server">
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
                <asp:Button ID="btnInsert" runat="server" class="btn btn-dark btn-outline-warning" Text="Insert" OnClick="btnInsert_Click" />
                <button type="reset" onclick="this.form.reset();return false" class="btn btn-dark btn-outline-warning">Reset</button>
                <button type="reset" onclick="window.location.href='AdminPanel.aspx';" class="btn btn-dark btn-outline-warning">Back</button>
                <br />
                <br />
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
