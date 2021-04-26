<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TicketAdd.aspx.cs" Inherits="CinemaApplication1.WebForm15" %>

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
    <div class="container w-75 mx-auto my-5 py-4 bg-dark" style="font-size: 21px; opacity: 0.9;">
        <div class="row">
            <div class="col-md-6 bg-dark text-light d-flex justify-content-center my-2 py-2">
                <div class="form-group text-light w-auto">
                    <asp:Image ID="imagePhoto" runat="server" Width="250px" Height="400px" ImageUrl='<%# Bind("image_path") %>' CssClass="float-end"></asp:Image>
                </div>
                <br />
            </div>
            <div class="col-md-6 bg-dark text-light float-start px-md-2 my-2 py-4 align-self-center">
                <table>
                    <tr>
                        <td>Movie ID</td>
                        <td style="padding-left: 10px;">
                            <asp:Label ID="lblTicketID" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Movie Name</td>
                        <td style="padding-left: 10px;">
                            <asp:Label ID="movieName" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Hall</td>
                        <td style="padding-left: 10px;">
                            <asp:DropDownList ID="hall" runat="server">
                                <asp:ListItem>H01</asp:ListItem>
                                <asp:ListItem>H02</asp:ListItem>
                                <asp:ListItem>H03</asp:ListItem>
                                <asp:ListItem>H04</asp:ListItem>
                                <asp:ListItem>H05</asp:ListItem>
                                <asp:ListItem>H06</asp:ListItem>
                                <asp:ListItem>H07</asp:ListItem>
                                <asp:ListItem>H08</asp:ListItem>
                                <asp:ListItem>H09</asp:ListItem>
                                <asp:ListItem>H10</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Seat</td>
                        <td style="padding-left: 10px;">
                            <asp:Label ID="seat" runat="server" Text="30"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Time</td>
                        <td style="padding-left: 10px;">
                            <asp:TextBox ID="time" runat="server" TextMode="Time"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="time" CssClass="error" Display="Dynamic" ErrorMessage="Please enter the time"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td style="padding-left: 10px;">
                            <asp:TextBox ID="date" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="date" CssClass="error" ErrorMessage="Please enter date"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td style="padding-left: 10px;">
                            <asp:TextBox ID="price" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Price" ControlToValidate="price" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="The price format is wrong" CssClass="error" Display="Dynamic" ValidationExpression="\d{1,20}(\.\d{1,2})?" ControlToValidate="price"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:Button ID="btnInsert" runat="server" Text="Save" OnClick="btnInsert_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnBack" runat="server" class="btn btn-primary" Text="Back" OnClick="btnBack_Click" CausesValidation="false" />
            </div>
        </div>
    </div>
</asp:Content>
