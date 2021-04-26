<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CaptureImage.aspx.cs" Inherits="CinemaApplication1.WebForm30" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            background-image: url(../image/bkBlack.png);
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial;
            font-size: 10pt;
        }
        
        table
        {   
            margin-left:auto; 
            margin-right:auto;
            border: 1px solid #ccc;
            border-collapse: collapse;
        }

        table th, table td
        {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
   <!DOCTYPE html>
    <html>
<body>
    <br />
    <table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <th align="center" class="text-warning bg-dark"><u>Live Camera</u></th>
        <th align="center" class="text-warning bg-dark"><u>Captured Picture</u></th>
    </tr>
    <tr>
        <td><div id="webcam"></div></td>
        <td><img id = "imgCapture" /></td>
    </tr>
    <tr>
        <td align = "center" >
            <input type="button" class="btn btn-dark btn-outline-warning" id="btnCapture" value="Capture" />
        </td>
        <td align = "center" >
            <input type="button" class="btn btn-dark btn-outline-warning" id="btnUpload"  value="Upload" disabled = "disabled" />
        </td>
        </tr>
    <tr>
        <td colspan="2" style="vertical-align : middle;text-align:center;">
            <asp:Button ID="Button1" CssClass="btn btn-dark btn-outline-warning" runat="server" Text="Remove Current Picture" OnClick="Button1_Click" />
        </td>
    </tr>
    </table>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="js/WebCam.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function ()
        {
            Webcam.set({
                width: 320,
                height: 240,
                image_format: 'jpeg',
                jpeg_quality: 90
            });
            Webcam.attach('#webcam');
            $("#btnCapture").click(function () {
                Webcam.snap(function (data_uri) {
                    $("#imgCapture")[0].src = data_uri;
                    $("#btnUpload").removeAttr("disabled");
                });
            });
            $("#btnUpload").click(function () {
                $.ajax({
                    type: "POST",
                    url: "CaptureImage.aspx/SaveCapturedImage",
                    data: "{data: '" + $("#imgCapture")[0].src + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) { }
                });
            });
        });
           
 
    </script>
</body>
</html>
</asp:Content>
