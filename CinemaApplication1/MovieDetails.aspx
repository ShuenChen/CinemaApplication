<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="CinemaApplication1.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gvMovie {
            width: 100%;
            border: solid 2px black;
            margin-left: auto;
            margin-right: auto;
            border-radius: 0px 0px 15px 15px;
        }

            .gvMovie a /** FOR THE PAGING ICONS **/ {
                padding: 5px 5px 5px 5px;
                text-decoration: none;
            }

                .gvMovie a:hover /** FOR THE PAGING ICONS HOVER STYLES**/ {
                    background: cornflowerblue;
                    color: blue;
                }

            .gvMovie span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
                background-color: #fff;
                color: #000;
                padding: 5px 5px 5px 5px;
            }

            .gvMovie td {
                padding: 5px;
                border: solid 2px black;
            }

            .gvMovie th {
                padding: 5px;
                border: solid 2px black;
            }

        body {
            background-image: url(../image/cinemaBk4.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <br />
    <div class="container">
        <button type="reset" onclick="window.location.href='AdminPanel.aspx';" class="btn-dark text-light btn-outline-warning px-5 py-1">Back</button>
        <br />
        <br />
        <div class="panel panel-info">
<%--            <div class="panel-heading bg-dark text-warning p-md-2" style="border-left:2px solid black;border-radius: 15px 15px 0px 0px;border-right:2px solid black;border-top:2px solid black;">
                <h2>Movie Details</h2>
            </div>--%>
            <div class="panel-body bg-dark">
                <asp:GridView ID="gvMovie" runat="server" CssClass="auto-style1 gvMovie bg-dark text-light" >
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="MovieId" DataNavigateUrlFormatString="Ticket.aspx?MovieId={0}" Text="View" HeaderText="Ticket Info" ControlStyle-Width="80px">
                            <HeaderStyle Height="50px" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="MovieId" DataNavigateUrlFormatString="AdminUpdate.aspx?MovieId={0}" Text="Update" HeaderText="Update"></asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="MovieId" DataNavigateUrlFormatString="AdminDelete.aspx?MovieId={0}" Text="Delete" HeaderText="Delete"></asp:HyperLinkField>
                        <asp:ImageField DataImageUrlField="image_path" HeaderText="Movie Poster" ControlStyle-Width="140" ControlStyle-Height="200" ItemStyle-HorizontalAlign="Center">
                        </asp:ImageField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
