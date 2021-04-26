<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.cs" Inherits="CinemaApplication1.WebForm27" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(../image/bkBlack.png);
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
    <script>
        function printpage() {
            var getPanel = document.getElementById("<%= printContent.ClientID %>");
            var MainWindow = window.open('', '', 'height=500,width=800');
            MainWindow.document.write("<html><head><title>Print Page</title>");
            MainWindow.document.write("</head><body>");
            MainWindow.document.write(getPanel.innerHTML);
            MainWindow.document.write('</body></html>');
            MainWindow.document.close();
            setTimeout(function () {
                MainWindow.print();
            }, 500);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <br />
    <div class="container d-flex justify-content-start">
        <asp:Button ID="btnBack" CssClass=" btn btn-warning text-dark" runat="server" Text="Back" OnClick="btnBack_Click" />&nbsp;
        <asp:Button ID="btnPrint" CssClass=" btn btn-warning text-dark" runat="server" Text="Print Ticket" OnClientClick="return printpage();" />
    </div>
    <div class="container d-flex justify-content-center" id="printContent" runat="server">
        <section class="text-center">
            <div class="row d-flex justify-content-center mb-4">
                <div class="row">
                    <div class="col-md-12 mb-4 px-sm-4 justify-content-center">
                        <br />
                        <br />
                        <table runat="server" class="bg-dark text-warning" style="width: 800px;">
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Scan ID Here</td>
                                <td style="text-align: left;">Movie Name:
                                    <asp:Label ID="mvName" runat="server" Text="Label"></asp:Label></td>
                                <td style="text-align: left;">Date:
                                    <asp:Label ID="tkDate" runat="server" Text="Label"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td rowspan="3">
                                    <asp:PlaceHolder ID="litResult2" runat="server"></asp:PlaceHolder>
                                </td>
                                <td style="text-align: left;">Seat:
                                    <asp:Label ID="tkSeat" runat="server" Text="Label"></asp:Label></td>
                                <td style="text-align: left;">Time:
                                    <asp:Label ID="tkTime" runat="server" Text="Label"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left;">Hall:
                                    <asp:Label ID="mvHall" runat="server" Text="Label"></asp:Label></td>
                                <td style="text-align: left;">Price:
                                    <asp:Label ID="tkPrice" runat="server" Text="Label"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>&nbsp;</td>
                                <td></td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/image/CompanyLogo4.png" /></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
