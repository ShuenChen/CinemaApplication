<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CinemaApplication1.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cartGv {
            width: 100%;
            border: solid 2px black;
            margin-left: auto;
            margin-right: auto;
            border-radius: 0px 0px 15px 15px;
        }

            .cartGv a /** FOR THE PAGING ICONS **/ {
                padding: 5px 5px 5px 5px;
                text-decoration: none;
                background: black;
                color: #ffc107;
            }

                .cartGv a:hover /** FOR THE PAGING ICONS HOVER STYLES**/ {
                    background: black;
                    color: #ffc107;
                }

            .cartGv span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
                background-color: black;
                color: #ffc107;
                padding: 5px 5px 5px 5px;
            }

            .cartGv td {
                padding: 5px;
                border: solid 2px black;
            }

            .cartGv th {
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
    <div class="container w-75 bg-dark" style="font-size: 21px; opacity: 0.9;">
        <div class="row">
            <div class="col-md-10 bg-dark text-light">
                <div class="form-group text-light w-auto table-responsive-lg">
                    <br />
                    <asp:GridView ID="cartGv" runat="server" CssClass="cartGv bg-dark text-light table-bordered table-condensed">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="CartNum" DataNavigateUrlFormatString="CartDelete.aspx?CartNum={0}" Text="Remove Ticket" />
                        </Columns>
                    </asp:GridView>
                </div>
                <br />
            </div>
            <div class="col-md-2 bg-dark text-light">
                <div class="form-group text-light w-auto table-responsive-sm">
                    <br />
                    <table border="0" class="table-responsive-md table-condensed">
                        <tr>
                            <td>Total : RM&nbsp;&nbsp;<asp:Label ID="totalPrice" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="Button2" CssClass="btn btn-warning text-dark" runat="server" Text="Paypal" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
