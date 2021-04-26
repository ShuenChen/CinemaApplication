<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TicketBot.aspx.cs" Inherits="CinemaApplication1.WebForm29" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      body {
            background-image: url(../image/bkBlack.png);
            /*background-image: url(../image/cinemaBk1.jpg);*/
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            text-align:center;

        }

      .maindiv {
    height: 100%;
    width: 100%;
}

.maintable {
    height: 100%;
    width: 100%;
    padding: 50px;
}

.bordereffect {
    color: #1abc9c;
    background-color: Transparent;
    height: 50px;
    width: 340px;
    padding: 10px;
    border: solid 2px #1abc9c;
    font-size: 20px;
    font-weight: lighter;
    font-family: Consolas;
    webkit-border-radius: 0px 0px 0px 0px;
    -moz-border-radius: 0px 0px 0px 0px;
    border-radius: 0px 0px 0px 0px;
}

    .bordereffect:hover {
        color: #fff;
        border: solid 5px #fff;
        cursor: pointer;
    }

    .bordereffect:focus {
    }



    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    
    <div class="size" style="font-family: Bradley Hand, cursive; font-style: italic;  color:white;">
    <h2>Have questions ?</h2>
    
         </div> 

     
           <iframe src='https://webchat.botframework.com/embed/intendsection01-bot?s=l08n0l_xDq4.leQDsvgWqE3M0p57MnPURk0hI9hJhzZOZGfYm6h7RYo' 
               style="min-width: 400px; width:60%; min-height: 500px;"></iframe>
    
       <div class="maindiv">
<table class="maintable">
    <tr>
<td>
<asp:Button Text="Back to Home" ID="TextBox1" CssClass="bordereffect" runat="server" OnClick="TextBox1_Click"  />
</td>
</tr>
  

</table>
</div>

</asp:Content>
