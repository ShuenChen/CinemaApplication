<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TicketBook.aspx.cs" Inherits="CinemaApplication1.WebForm16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/sweetalert2.js"></script>
    <script>
        function alertAddToCart() {
            Swal.fire({
                icon: 'success',
                title: 'Add To Cart Successfully',
                showConfirmButton: false,
                timer: 1500
            })
        }
        function alertAlreadyAddToCart() {
            Swal.fire({
                icon: 'success',
                title: 'This Ticket Already Add To Cart Before',
                showConfirmButton: false,
                timer: 5000
            })
        }
    </script>
    <style>
        body {
            background-image: url(../image/cinemaBk2.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container w-75 mx-auto my-5 py-4 bg-dark" style="font-size: 21px; opacity: 0.9;">
        <div class="row">
            <div class="col-md-5 bg-dark text-light d-flex justify-content-center my-2 py-2">
                <div class="form-group text-light w-auto">
                    <asp:Image ID="image" runat="server" Width="250px" Height="400px" ImageUrl='<%# Bind("image_path") %>' CssClass="float-end"></asp:Image>
                </div>
                <br />
            </div>
            <div class="col-md-7 bg-dark text-light float-start px-md-2 my-2 py-4 align-self-center">
                <table>
                    <tr>
                        <td>Name:
                        </td>
                        <td style="padding-left: 10px;">
                            <asp:Label ID="movieName" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Description:
                        </td>
                        <td style="padding-left: 10px;">
                            <asp:Label ID="descript" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Date:
                        </td>
                        <td style="padding-left: 10px;">
                            <asp:DropDownList ID="movieDate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="movieDate_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Time:
                        </td>
                        <td style="padding-left: 10px;">
                            <asp:DropDownList ID="movieTime" runat="server" AutoPostBack="True" OnSelectedIndexChanged="movieTime_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Hall:
                        </td>
                        <td style="padding-left: 10px;">
                            <asp:DropDownList ID="movieHall" runat="server" AutoPostBack="True" OnSelectedIndexChanged="movieHall_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Seat Number:
                        </td>
                        <td style="padding-left: 10px;">
                            <asp:DropDownList ID="movieSeat" runat="server"></asp:DropDownList>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/image/movieSeat.png" CssClass="img-responsive" Width="450px" Height="300px" />
                        </td>
                    </tr>
                    <tr>
                        <td>Price(RM):
                        </td>
                        <td style="padding-left: 10px;">
                            <asp:Label ID="price" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>

                <asp:Button ID="Button2" CssClass="btn btn-warning text-dark" runat="server" Text="Login First" OnClick="Button2_Click" />
                <asp:Button ID="Button1" CssClass="btn btn-warning text-dark" runat="server" OnClick="Button1_Click1" Text="Add to Cart" />
                <asp:Button ID="Button3" CssClass="btn btn-warning text-dark" runat="server" Text="Back" OnClick="Button3_Click" />
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
