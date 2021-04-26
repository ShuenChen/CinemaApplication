<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberPanel.aspx.cs" Inherits="CinemaApplication1.WebForm25" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(../image/bkBlack.png);
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .containerAnimation:hover {
            opacity: 0.8;
        }

        .wrapper {
            display: flex;
            position: relative;
        }

            .wrapper .sidebar {
                width: 350px;
                height: auto;
                background: #4b4276;
                padding: 30px 0px;
                position: relative;
            }

                .wrapper .sidebar h2 {
                    color: #fff;
                    text-transform: uppercase;
                    text-align: center;
                    margin-bottom: 30px;
                }

                .wrapper .sidebar ul li {
                    padding: 15px;
                    border-bottom: 1px solid #bdb8d7;
                    border-bottom: 1px solid rgba(0,0,0,0.05);
                    border-top: 1px solid rgba(255,255,255,0.05);
                }

                    .wrapper .sidebar ul li a {
                        color: #bdb8d7;
                        display: block;
                    }

                        .wrapper .sidebar ul li a .fas {
                            width: 25px;
                        }

                    .wrapper .sidebar ul li:hover {
                        background-color: #594f8d;
                    }

                        .wrapper .sidebar ul li:hover a {
                            color: #fff;
                        }

                .wrapper .sidebar .social_media {
                    position: absolute;
                    bottom: 0;
                    left: 50%;
                    transform: translateX(-50%);
                    display: flex;
                }

                    .wrapper .sidebar .social_media a {
                        display: block;
                        width: 40px;
                        background: #594f8d;
                        height: 40px;
                        line-height: 45px;
                        text-align: center;
                        margin: 0 5px;
                        color: #bdb8d7;
                        border-top-left-radius: 5px;
                        border-top-right-radius: 5px;
                    }

            .wrapper .main_content {
                width: 100%;
            }

                .wrapper .main_content .header {
                    padding: 20px;
                    background: #fff;
                    color: #717171;
                    border-bottom: 1px solid #e0e4e8;
                }

                .wrapper .main_content .info div {
                    margin-bottom: 20px;
                }

        .gvTicket {
            width: 100%;
            border: solid 2px black;
            margin-left: auto;
            margin-right: auto;
            border-radius: 0px 0px 15px 15px;
        }

            /*            .gvTicket a * FOR THE PAGING ICONS * {
                padding: 5px 5px 5px 5px;
                text-decoration: none;
                background: black;
                color: #ffc107;
            }*/

            /*.gvTicket a:hover*/ /** FOR THE PAGING ICONS HOVER STYLES**/ /*{
                    background: black;
                    color: #ffc107;
                }*/

            .gvTicket span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
                background-color: black;
                color: #ffc107;
                padding: 5px 5px 5px 5px;
            }

            .gvTicket td {
                padding: 5px;
                border: solid 2px black;
            }

            .gvTicket th {
                padding: 5px;
                border: solid 2px black;
            }
            .imgRound
            {
                border-radius: 50%;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="wrapper px-5 pt-4">
        <div class="sidebar bg-dark h-50" style="border-radius: 10px; background-color: antiquewhite">
            <div class="text-center text-light">
                <div id="defaultImg" runat="server">
                    <i class="fas fa-user-circle" style="font-size: 100px"></i>
                </div>
                <div ID="userImg" runat="server">
                    <asp:Image ID="imagePhoto" CssClass="imgRound" runat="server"  Width="140px" Height="200px" ImageUrl=""></asp:Image>
                </div>
                <br />
                <h5>
                    <asp:Label ID="txtUsername" runat="server" Text="" CssClass="text-warning"></asp:Label></h5>
                <asp:LinkButton ID="BrowseUserPic" CssClass="btn btn-dark btn-outline-warning" runat="server" OnClick="BrowseUserPic_Click" Text="Edit Profile Picture"></asp:LinkButton>
                <br />
                <br />
            </div>
            <ul>
<%--                <li>
                    <asp:LinkButton ID="LinkButton1" class="text-decoration-none" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-home"></i>DashBoard Home</asp:LinkButton></li>--%>
                <li>
                    <asp:LinkButton ID="LinkButton2" class="text-decoration-none" runat="server" OnClick="LinkButton2_Click"><i class="fas fa-ticket-alt"></i>Ticket Info</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="LinkButton3" class="text-decoration-none" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-user-shield"></i>User Management</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="LinkButton5" class="text-decoration-none" runat="server" OnClick="LinkButton5_Click"><i class="fas fa-sign-out-alt"></i>Logout</asp:LinkButton></li>
            </ul>
        </div>
        <div class="main_content">
            <div class="info" runat="server" id="home">
            </div>
            <div class="info" runat="server" id="ticketMng">
                <div class="container">
                    <section class="text-center text-dark">
                        <div class="row d-flex justify-content-center mb-4">
                            <div class="row">
                                <div class="col-md-12 bg-dark text-light">
                                    <div class="form-group text-light w-auto table-responsive-lg">
                                        <br /><h1 class="text-warning">Welcome to User Panel</h1>
                                        <br />
                                        <asp:GridView ID="gvTicket"  runat="server" CssClass="auto-style1 gvTicket bg-dark text-warning">
                                            <Columns>
                                                <asp:HyperLinkField DataNavigateUrlFields="CartNum" ControlStyle-CssClass="btn btn-dark btn-outline-warning" DataNavigateUrlFormatString="TicketDetails.aspx?CartNum={0}" Text="Show Ticket" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="info" runat="server" id="memberMng">
                <div class="container d-flex justify-content-center">
                    <section class="text-center text-dark px-5">
                        <div class="row">
                            <div class=" d-flex justify-content-center bg-dark text-light text-start px-5">
                                <div class="form-group text-light table-responsive-lg">
                                    <br>
                                    <h2 class="text-warning text-left">Member Information <i class="fa fa-user" style="font-size: 35px"></i></h2>
                                    <br>
                                    <table>
                                        <tr class="form-group text-warning w-auto">
                                            <td>
                                                <label for="uname"><i class="fa fa-user" style="font-size: 24px"></i> Member Name:</label>
                                            </td>
                                            <td class="ps-5">
                                                <asp:Label ID="mmbName" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr class="form-group text-warning w-auto">
                                            <td>
                                                <label for="uname"><i class="fa fa-user" style="font-size: 24px"></i> Member Email:</label>
                                            </td>
                                            <td class="ps-5">
                                                <asp:Label ID="mmbEml" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr class="form-group text-warning w-auto">
                                            <td>
                                                <label for="uname"><i class="fa fa-user" style="font-size: 24px"></i> Date Join:</label>
                                            </td>
                                            <td class="ps-5">
                                                <asp:Label ID="dateJoin" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr class="form-group text-warning w-auto">
                                            <td>
                                                <label for="uname"><i class="fa fa-user" style="font-size: 24px"></i> Forget Password Question:</label>
                                            </td>
                                            <td class="ps-5">
                                                <asp:Label ID="fgtPassQ" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr class="form-group text-warning w-auto">
                                            <td>
                                                <label for="uname"><i class="fa fa-user" style="font-size: 24px"></i> Forget Password Answer:</label>
                                            </td>
                                            <td class="ps-5">
                                                <asp:Label ID="fgtPassA" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:LinkButton ID="LinkButton4" CssClass="btn btn-dark btn-outline-warning" runat="server" PostBackUrl="~/MemberUpdate.aspx">Update Information</asp:LinkButton>
                                </div>
                            <br />
                        </div>
                </div>
                </section>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
