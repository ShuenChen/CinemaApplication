<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="CinemaApplication1.WebForm21" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(../image/bkBlack.png);
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <main role="main" class="pb-3">
            <section>
                <div class="en section_container text-white">
                    <div id="md_en" data-target="out_en" class="agreement_md">
                        <br>
                        <h1>Contact Us</h1>
                        <p>If you have any questions about this Privacy Policy, You can contact us:</p>
                        <ul>
                            <li>By phone number: 07-9898267</li>
                        </ul>
                        <br />
                        <br />
                        <h1>Our Location</h1>
                        <p>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63815.033311522435!2d103.69661023083768!3d1.5063105187697627!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da72ff145e0e5b%3A0x730c47b82b08f3be!2sGSC%20Paradigm%20Mall%20Johor%20Bahru!5e0!3m2!1szh-CN!2smy!4v1611660578788!5m2!1szh-CN!2smy" class="img-fluid" style="border: 0; width: 400px; height: 300px;" aria-hidden="false" tabindex="0"></iframe>
                        </p>
                    </div>
                </div>
            </section>
        </main>
    </div>
</asp:Content>
