<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="CinemaApplication1.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"></script>
    <style>
        body {
            background-image: url(../image/bkBlack.png);
            background-size: cover;
            background-repeat: no-repeat;
        }

        .title a {
            text-decoration-line: none;
            color: yellow;
        }

            .title a:hover {
                text-decoration-line: underline;
                color: yellow;
            }

        .vertical .carousel-inner {
            height: 100%;
        }

        .carousel.vertical .item {
            -webkit-transition: 0.6s ease-in-out top;
            -moz-transition: 0.6s ease-in-out top;
            -ms-transition: 0.6s ease-in-out top;
            -o-transition: 0.6s ease-in-out top;
            transition: 0.6s ease-in-out top;
            left: 0;
        }


        .carousel.vertical .active {
            top: 0;
        }

        .carousel.vertical .next {
            top: 100%;
        }

        .carousel.vertical .prev {
            top: -100%;
        }

            .carousel.vertical .next.left,
            .carousel.vertical .prev.right {
                top: 0;
            }

        .carousel.vertical .active.left {
            top: -100%;
        }

        .carousel.vertical .active.right {
            top: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/image/cinemaAds2.jpg" class="d-block w-100" alt="..." height="700">
                <div class="carousel-caption d-none d-md-block">
                    <a class="btn btn-warning text-dark" style="border-radius: 25px;" href="Movie.aspx">See More</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/image/cinemaAds3.jpg" class="d-block w-100" alt="..." height="700">
                <div class="carousel-caption d-none d-md-block">
                    <a class="btn btn-warning text-dark" style="border-radius: 25px;" href="Movie.aspx">See More</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/image/cinemaAds1.jpg" class="d-block w-100" alt="..." height="700">
                <div class="carousel-caption d-none d-md-block">
                    <a class="btn btn-warning text-dark" style="border-radius: 25px;" href="Movie.aspx">See More</a>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


    <%--        <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/image/cinemaAds3.jpg" alt="Cinema Ads 3" width="100%" height="600">
            </div>
            <div class="carousel-item">
                <img src="/image/cinemaAds1.jpg" alt="Cinema Ads 1" width="100%" height="600">
            </div>
            <div class="carousel-item">
                <img src="/image/cinemaAds2.jpg" alt="Cinema Ads 2" width="100%" height="600">
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>--%>

    <br />
    <br />

    <%--        <div class="container">
            <div class="row text-center">
                <div class="container col-sm-4">
                    <br>
                    <fieldset>
                        <legend class="text-light p-2 bg-danger">Hottest Movie</legend>
                        <br>
                        <div class="row text-center">

                            <div class="col-sm-6">
                                <img src="/image/moviePoster1.jpg" class="img-fluid img-thumbnail"><br>
                                <p class="text-light">Movie 1</p>
                            </div>
                            <div class="col-sm-6">
                                <img src="/image/moviePoster2.jpg" class="img-fluid img-thumbnail"><br>
                                <p class="text-light">Movie 2</p>
                            </div>
                        </div>
                    </fieldset>
                    <div class="text-center">
                        <a class="btn bg-danger text-light text-center btn-primary" href="MovieH.aspx">Book Now</a><br>
                    </div>
                </div>
                <div class="container col-sm-4">
                    <br>
                    <fieldset>
                        <legend class="text-dark p-2 bg-warning">Promotion Offer</legend>
                        <br>
                        <div class="row text-center">

                            <div class="col-sm-6">
                                <img src="/image/moviePoster3.jpg" class="img-fluid img-thumbnail"><br>
                                <p class="text-light">Movie 3</p>
                            </div>
                            <div class="col-sm-6">
                                <img src="/image/moviePoster4.jpg" class="img-fluid img-thumbnail"><br>
                                <p class="text-light">Movie 4</p>
                            </div>
                        </div>
                    </fieldset>
                    <div class="text-center">
                        <a class="btn bg-warning text-dark text-center btn-primary" href="MovieP.aspx">Book Now</a><br>
                    </div>
                </div>
            </div>
        </div>--%>

    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div style="width: 90%;">
                    <div class="card">
                        <asp:Image ID="Image1" CssClass="card-img-top" Height="300px" ImageUrl="~/image/hotSales.jpg" runat="server" />
                        <%--                        <div class="card-header bg-warning text-dark">
                            <h3>Hottest Movies</h3>
                        </div>
                        <div class="card-body text-dark" style="background-color: black;">
                            <a class="text-warning text-center text-decoration-none" href="MovieH.aspx">See more details ></a><br>
                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="col-md-7 d-flex align-items-center">
                <div class="title" style="padding: 15px 15px 15px 15px; border-radius: 19px; width: 95%;">
                    <h1 class="text-light border border-end-0 border-top-0 border-start-0 border-white">Hottest Movies</h1>
                    <h4 class="text-light">Do you want to know what film that people are watching in nowadays? Just click on the see more details to know the information.</h4>
                    <a href="MovieH.aspx">See more details ></a><br>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="container" data-aos="fade-left">
        <div class="row">
            <div class="col-md-7 d-flex align-items-center">
                <div class="title" style="padding: 25px 25px 25px 25px; border-radius: 10px; width: 95%;">
                    <h1 class="text-light border border-end-0 border-top-0 border-start-0 border-white">New Arrivals</h1>
                    <h4 class="text-light">We will keep updates our movies and add new movies. You can click the see more details and it will bring you to our new movies.</h4>
                    <a class="text-center" href="MovieN.aspx">See more details ></a><br>
                </div>
            </div>
            <div class="col-md-5">
                <div style="width: 100%;" class="ms-auto">
                    <div class="card">
                        <asp:Image ID="Image5" CssClass="card-img-top" Height="300px" ImageUrl="~/image/newArrival2.jpg" runat="server" />
                        <%--                        <div class="card-header bg-warning text-dark">
                            <h3>New Arrival</h3>
                        </div>
                        <div class="card-body text-light" style="background-color: black;">
                            <div class="me-auto">
                                
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="container" data-aos="fade-right">
        <div class="row">
            <div class="col-md-5">
                <div style="width: 90%;">
                    <div class="card">
                        <asp:Image ID="Image9" CssClass="card-img-top" Height="300px" ImageUrl="~/image/promo.png" runat="server" />
                        <%--                        <div class="card-header bg-warning text-black">
                            <h3>Promotion</h3>
                        </div>
                        <div class="card-body text-light" style="background-color: black;">
                            <a class="text-warning text-center text-decoration-none" href="MovieP.aspx">See more details ></a><br>
                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="col-md-7 d-flex align-items-center">
                <div class="title" style="padding: 15px 15px 15px 15px; border-radius: 19px; width: 95%;">
                    <h1 class="text-light border border-end-0 border-top-0 border-start-0 border-white">Promotion Offer</h1>
                    <h4 class="text-light">Sometimes we will update some movie prices and give some promotion to our customers. It is a kind of give back to our customers. We hope our customers can enjoy it. Good luck have fun.</h4>
                    <a class="text-center" href="MovieP.aspx">See more details ></a><br>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <%--                <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <asp:Image ID="Image10" CssClass="card-img-top" Height="200px" ImageUrl="~/image/hot.jpg" runat="server" />
                        <div class="card-header bg-danger text-dark">
                            <h3>Hottest Movie</h3>
                        </div>
                        <div class="card-body bg-dark text-dark">
                            <a class="btn text-dark text-center btn-danger" href="MovieH.aspx">See more details</a><br>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <asp:Image ID="Image11" CssClass="card-img-top" Height="200px" ImageUrl="~/image/welcome.jpg" runat="server" />
                        <div class="card-header bg-light text-dark">
                            <h3>New Arrival</h3>
                        </div>
                        <div class="card-body bg-dark text-light">
                            <a class="btn text-dark text-center btn-light" href="MovieN.aspx">See more details</a><br>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <asp:Image ID="Image12" CssClass="card-img-top" Height="200px" ImageUrl="~/image/welcome.jpg" runat="server" />
                        <div class="card-header bg-warning text-black">
                            <h3>Promotion</h3>
                        </div>
                        <div class="card-body bg-dark text-light">
                            <a class="btn text-center text-dark btn-warning" href="MovieP.aspx">See more details</a><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />--%>
    <main class="mt-5" style="background-color:antiquewhite" data-aos="fade-up">
        <div class="container">
            <section class="text-center text-dark py-5">
                <h1>Why Choose Us?</h1>
                <div class="row d-flex justify-content-center mb-4">
                </div>
                <div class="row">
                    <div class="col-md-3 mb-4 px-md-4 justify-content-center">
                        <div class="bg-warning text-dark" style="padding: 15px 15px 15px 15px;">
                            <i class="fas fa-users" style="font-size: 100px;"></i>
                            <h4 class="my-4 fw-bold">ONE-STOP SERVICE</h4>
                            <p>TICKETINFO has professional foreign trade team, 24 hours to provide customers with accurate,timely,quality service.You can find our contact way at Contact Us.</p>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4 px-md-4 justify-content-center">
                        <div class="bg-primary text-dark" style="padding: 15px 15px 15px 15px;">
                            <i class="fas fa-money-bill-alt" style="font-size: 100px;"></i>
                            <h4 class="my-4 fw-bold">LOWER COSTS</h4>
                            <p>TICKETINFO provides cheaper price of the tickets to our customers to ensure we are the best choice. We do promotion at the sometimes to give back to our customers to thanks customers supporting us.</p>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4 px-md-4 justify-content-center">
                        <div class="bg-warning text-dark" style="padding: 15px 15px 15px 15px;">
                            <i class="fab fa-cc-paypal" style="font-size: 100px;"></i>
                            <h4 class="my-4 fw-bold">PAYMENT</h4>
                            <p>TICKETINFO support the online payment by using paypal. Customers only need to login to their Paypal account and paid the checkout amout then the payment is done.</p>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4 px-md-4 justify-content-center">
                        <div class="bg-primary text-dark" style="padding: 15px 15px 15px 15px;">
                            <i class="fas fa-couch" style="font-size: 100px;"></i>
                            <h4 class="my-4 fw-bold">WELL-DESIGNED</h4>
                            <p>TICKETINFO has a strong design research and development team to develop products that will meet customer needs to let them feels comfortable and enjoy the movie at the same time.</p>
                        </div>
                    </div>
                </div>
                <br />
                <div>
                    <h5><a class="text-center btn btn-warning text-dark" href="Movie.aspx">Book Now ></a></h5><br>
                </div>
            </section>
        </div>
    </main>
<%--    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div style="width: 85%;" class="ms-auto">
                    <h2 class="text-light border border-end-0 border-top-0 border-start-0 border-white">Our Location</h2>
                    <p>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63815.033311522435!2d103.69661023083768!3d1.5063105187697627!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da72ff145e0e5b%3A0x730c47b82b08f3be!2sGSC%20Paradigm%20Mall%20Johor%20Bahru!5e0!3m2!1szh-CN!2smy!4v1611660578788!5m2!1szh-CN!2smy" class="img-fluid" style="border: 0; width: 400px; height: 300px;" aria-hidden="false" tabindex="0"></iframe>
                    </p>
                </div>
            </div>
            <div class="col-md-7">
                <div class="bg-dark" style="padding: 15px 15px 15px 15px;">
                    <h2 class="text-light border border-end-0 border-top-0 border-start-0 border-white">Why Choose Us?</h2>
                    <p class="text-light">We provide cheaper ticket prices to our consumers and also a good environment to out consumer to let them enjoy the movie on the same time.</p>
                </div>
            </div>
        </div>
    </div>--%>
    <br />
    <br />
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init({
            offset: 400,
            duration: 1000
        });
    </script>
</asp:Content>
