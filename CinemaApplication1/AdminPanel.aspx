<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="CinemaApplication1.WebForm22" %>

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
    </style>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", { packages: ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var box1Value = parseFloat(document.getElementById('<%= box1Value.ClientID %>').textContent);
            var box2Value = parseFloat(document.getElementById('<%= box2Value.ClientID %>').textContent);
            var box3Value = parseFloat(document.getElementById('<%= box3Value.ClientID %>').textContent);
            var box4Value = parseFloat(document.getElementById('<%= box4Value.ClientID %>').textContent);
            var box1 = document.getElementById('<%= box1.ClientID %>').textContent;
            var box2 = document.getElementById('<%= box2.ClientID %>').textContent;
            var box3 = document.getElementById('<%= box3.ClientID %>').textContent;
            var box4 = document.getElementById('<%= box4.ClientID %>').textContent;
            var data = google.visualization.arrayToDataTable([
                ["Element", "Density", { role: "style" }],
                [box1, box1Value, "#b87333"],
                [box2, box2Value, "silver"],
                [box3, box3Value, "gold"],
                [box4, box4Value, "#87CEEB"]
            ]);

            var view = new google.visualization.DataView(data);
            view.setColumns([0, 1,
                {
                    calc: "stringify",
                    sourceColumn: 1,
                    type: "string",
                    role: "annotation"
                },
                2]);

            var options = {
                title: "Admin Report",
                width: 1080,
                height: 595,
                backgroundColor: '#faebd7',
                bar: { groupWidth: "60%" },
                legend: { position: "none" },
            };
            var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
            chart.draw(view, options);
        }
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
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="wrapper px-5 pt-4">
        <div class="sidebar bg-dark h-50" style="border-radius: 10px;background-color:antiquewhite">
            <div class="text-center text-light">
                <i class="fas fa-user-circle" style="font-size: 100px"></i>
                <br>
                <br>
                <h5>
                    <asp:Label ID="txtUsername" runat="server" Text="" CssClass="text-warning"></asp:Label></h5>
            </div>
            <ul>
                <li>
                    <asp:LinkButton ID="LinkButton1" class="text-decoration-none" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-home"></i>DashBoard Home</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="LinkButton2" class="text-decoration-none" runat="server" OnClick="LinkButton2_Click"><i class="fas fa-ticket-alt"></i>Movie Management</asp:LinkButton></li>
                                <li>
                    <asp:LinkButton ID="LinkButton3" class="text-decoration-none" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-user-shield"></i>Admin Management</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="LinkButton5" class="text-decoration-none" runat="server" OnClick="LinkButton5_Click"><i class="fas fa-sign-out-alt"></i>Logout</asp:LinkButton></li>
            </ul>
        </div>
        <div class="main_content">
            <div class="info" runat="server" id="home">
                <div class="container">
                    <section class="text-center text-dark">
                        <div class="row d-flex justify-content-center mb-4">
                            <div class="row">
                                <div class="col-lg-3 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <%--<i class="fas fa-film" style="font-size: 100px;"></i>--%>
                                        <asp:Label ID="box1" runat="server" Text=""></asp:Label>
                                        <br />
                                        <br />
                                        <h3>
                                            <asp:Label ID="box1Value" runat="server" Text="Label"></asp:Label></h3>
                                        <%--<p>TICKETINFO has professional foreign trade team, 24 hours to provide customers with accurate,timely,quality service.You can find our contact way at Contact Us.</p>--%>
                                    </div>
                                </div>
                                <div class="col-lg-3 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <%--<i class="fas fa-file-video" style="font-size: 100px;"></i>--%>
                                        <asp:Label ID="box2" runat="server" Text=""></asp:Label>
                                        <br />
                                        <br />
                                        <h3>
                                            <asp:Label ID="box2Value" runat="server" Text="Label"></asp:Label></h3>
                                        <%--<p>TICKETINFO provides cheaper price of the tickets to our customers. We do promotion at the sometimes to give back to our customers to thanks for supporting.</p>--%>
                                    </div>
                                </div>
                                <div class="col-lg-3 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <%--<i class="fas fa-ticket-alt" style="font-size: 100px;"></i>--%>
                                        <asp:Label ID="box3" runat="server" Text=""></asp:Label>
                                        <br />
                                        <br />
                                        <h3>
                                            <asp:Label ID="box3Value" runat="server" Text="Label"></asp:Label></h3>
                                        <%--<p>TICKETINFO support the online payment by using paypal. Customers only need to login to their Paypal account and paid the checkout amout then the payment is done.</p>--%>
                                    </div>
                                </div>
                                <div class="col-lg-3 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <%--<i class="fas fa-ticket-alt" style="font-size: 100px;"></i>--%>
                                        <asp:Label ID="box4" runat="server" Text=""></asp:Label>
                                        <br />
                                        <br />
                                        <h3>
                                            <asp:Label ID="box4Value" runat="server" Text="Label"></asp:Label></h3>
                                        <%--<p>TICKETINFO support the online payment by using paypal. Customers only need to login to their Paypal account and paid the checkout amout then the payment is done.</p>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <asp:DropDownList ID="reportChoice" CssClass="btn btn-dark btn-outline-warning" runat="server"  >
                        <asp:ListItem Value="normal">Normal Report</asp:ListItem>
                        <asp:ListItem Value="day">Daily Report</asp:ListItem>
                        <asp:ListItem Value="month">Monthly Report</asp:ListItem>
                        <asp:ListItem Value="year">Yearly Report</asp:ListItem>
                    </asp:DropDownList>&nbsp;
                    <asp:Button ID="confirmReport" CssClass="btn btn-dark btn-outline-warning" runat="server" Text="Confirm" OnClick="confirmReport_Click" />&nbsp;
                    <asp:Button ID="btnPrint" CssClass="btn btn-dark btn-outline-warning" runat="server" Text="Print Report" OnClientClick="return printpage();" />&nbsp;
                    <br /><br />
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </div>
                <%--<asp:Button ID="btnPrint" CssClass="btn btn-warning text-dark" runat="server" Text="Print Report" OnClientClick="return printpage();" />--%>
                <div class="container" ID="printContent" runat="server" data-aos="fade-up">
                    <section class="text-center text-dark">
                        <div class="row d-flex justify-content-center mb-4">
                            <div class="row">
                                <div class="col-md-12 mb-4 px-sm-4 justify-content-center">
                                    <div id="columnchart_values" style="height: 100%; width: 595px;"></div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <br />
                <br />
            </div>
            <div class="info" runat="server" id="movieMng">
                <div class="container">
                    <section class="text-center text-dark">
                        <div class="row d-flex justify-content-center mb-4">
                            <div class="row">
                                <div class="col-md-6 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <i class="fas fa-film" style="font-size: 100px;"></i>
                                        <h4 class="my-4 fw-bold">INSERT MOVIE</h4>
                                        <asp:LinkButton ID="LinkButton6" CssClass="middle btn btn-dark btn-outline-warning" PostBackUrl="~/MovieInsert.aspx" runat="server">Insert Now</asp:LinkButton>
                                        <%--<p>TICKETINFO has professional foreign trade team, 24 hours to provide customers with accurate,timely,quality service.You can find our contact way at Contact Us.</p>--%>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <i class="fas fa-file-video" style="font-size: 100px;"></i>
                                        <h4 class="my-4 fw-bold">VIEW MOVIE DETAILS</h4>
                                        <asp:LinkButton ID="LinkButton7" CssClass="middle btn btn-dark btn-outline-warning" PostBackUrl="~/MovieDetails.aspx" runat="server">View Now</asp:LinkButton>
                                        <%--<p>TICKETINFO provides cheaper price of the tickets to our customers. We do promotion at the sometimes to give back to our customers to thanks for supporting.</p>--%>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <i class="fas fa-ticket-alt" style="font-size: 100px;"></i>
                                        <h4 class="my-4 fw-bold">VIEW TICKET INFO</h4>
                                        <asp:LinkButton ID="LinkButton8" CssClass="middle btn btn-dark btn-outline-warning" PostBackUrl="~/Ticket.aspx" runat="server">View Now</asp:LinkButton>
                                        <%--<p>TICKETINFO support the online payment by using paypal. Customers only need to login to their Paypal account and paid the checkout amout then the payment is done.</p>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="info" runat="server" id="adminMng">
                <div class="container">
                    <section class="text-center text-dark">
                        <div class="row d-flex justify-content-center mb-4">
                            <div class="row">
                                <div class="col-md-6 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <i class="fas fa-eye" style="font-size: 100px;"></i>
                                        <h4 class="my-4 fw-bold">VIEW ADMIN DETAILS</h4>
                                        <asp:LinkButton ID="LinkButton9" CssClass="middle btn btn-dark btn-outline-warning" PostBackUrl="~/AdminList.aspx" runat="server">View Now</asp:LinkButton>
                                        <%--<p>TICKETINFO provides cheaper price of the tickets to our customers. We do promotion at the sometimes to give back to our customers to thanks for supporting.</p>--%>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <i class="fas fa-user-plus" style="font-size: 100px;"></i>
                                        <h4 class="my-4 fw-bold">ADD NEW ADMIN</h4>
                                        <asp:LinkButton ID="LinkButton4" CssClass="middle btn btn-dark btn-outline-warning" PostBackUrl="~/AdminRegister.aspx" runat="server">Add Now</asp:LinkButton>
                                        <%--<p>TICKETINFO has professional foreign trade team, 24 hours to provide customers with accurate,timely,quality service.You can find our contact way at Contact Us.</p>--%>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <i class="fas fa-user-edit" style="font-size: 100px;"></i>
                                        <h4 class="my-4 fw-bold">UPDATE ADMIN INFO</h4>
                                        <asp:LinkButton ID="LinkButton10" CssClass="middle btn btn-dark btn-outline-warning" PostBackUrl="~/AdminList.aspx" runat="server">Update Now</asp:LinkButton>
                                        <%--<p>TICKETINFO support the online payment by using paypal. Customers only need to login to their Paypal account and paid the checkout amout then the payment is done.</p>--%>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4 px-sm-4 justify-content-center">
                                    <div class="containerAnimation bg-dark text-warning py-md-5" style="padding: 15px 15px 15px 15px;">
                                        <i class="fas fa-user-times" style="font-size: 100px;"></i>
                                        <h4 class="my-4 fw-bold">DELETE ADMIN</h4>
                                        <asp:LinkButton ID="LinkButton11" CssClass="middle btn btn-dark btn-outline-warning" PostBackUrl="~/AdminList.aspx" runat="server">Delete Now</asp:LinkButton>
                                        <%--<p>TICKETINFO support the online payment by using paypal. Customers only need to login to their Paypal account and paid the checkout amout then the payment is done.</p>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init({
            offset: 400,
            duration: 1000
        });
    </script>
</asp:Content>
