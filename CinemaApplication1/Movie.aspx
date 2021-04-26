<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="CinemaApplication1.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(../image/bkBlack.png);
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .title a {
            text-decoration-line: none;
            padding: 0px 20px;
        }

        .link::after {
            content: '';
            display: block;
            width: 0%;
            height: 2px;
            transition: width .3s;
            background: #fff;
        }

        .link:hover::after {
            width: 100%;
            transition: width .3s;
        }
        .title li a{
            text-decoration-line: none;
            color: white;
        }
        .title li a:hover {
            text-decoration-line: none;
            color: gold;
        }
        .searchBox {
            width:60%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <br />
    <div class="container">
        <div class="row">
            <div class="title col-md-2 border-end border-warning">
                <ul style="list-style:none;">
                    <li class="py-4"><asp:TextBox ID="TextBox1" runat="server" CssClass="searchBox" OnTextChanged="TextBox1_TextChanged" placeholder="Search"></asp:TextBox> <asp:LinkButton ID="LinkButton1" runat="server" CssClass="text-warning border py-md-2 searchBtn" OnClick="LinkButton1_Click"><i class="fas fa-search"></i></asp:LinkButton></li>
                    <li><a class="link" href="Movie.aspx" style="color: yellow;">All movies</a></li>
                    <li><a class="link" href="MovieH.aspx">Hottest Movies</a></li>
                    <li><a class="link" href="MovieN.aspx">New Movies</a></li>
                    <li><a class="link" href="MovieP.aspx">Promotion Movies</a></li>
                </ul>
            </div>
            <div class="col-md-10 ps-5">
                <br />
                <asp:DataList ID="DataList1" RepeatDirection="Horizontal" RepeatColumns="5" CssClass="container text-center container1" runat="server" HorizontalAlign="Center">
                    <ItemTemplate>
                        <div class="row">
                            <div class=" pagination-centered">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "TicketBook.aspx?MovieId=" + Eval("MovieId") %>'><asp:Image ID="imagePhoto" runat="server" Width="140px" Height="200px" BorderColor="White" BorderWidth="1px" ImageUrl='<%# Bind("image_path") %>'></asp:Image></asp:HyperLink><br />
                                <asp:Label ID="Label3" runat="server" CssClass="text-light fw-bold" Text='<%# Bind("MovieName") %>'></asp:Label><br />
                                <%--                    <asp:Label ID="Label2" runat="server" Text="Language:"></asp:Label><asp:Label ID="lblMovieLanguage" runat="server" Text='<%# Bind("MovieLanguage") %>'></asp:Label><br />
                    <asp:Label ID="Label4" runat="server" Text="Hours   :"></asp:Label><asp:Label ID="lblMovieHour" runat="server" Text='<%# Bind("MovieHour") %>'></asp:Label><br />
                    <asp:Label ID="Label5" runat="server" Text="Type    :"></asp:Label><asp:Label ID="lblMovieType" runat="server" Text='<%# Bind("MovieType") %>'></asp:Label><br />--%>
                                <%--<asp:HyperLink ID="HyperLink6" runat="server" CssClass="btn btn-warning text-dark fw-bold" NavigateUrl='<%# "TicketBook.aspx?MovieId=" + Eval("MovieId") %>'>Book</asp:HyperLink>--%>
                                <br />
                                <br />
                                <br />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <br />
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
