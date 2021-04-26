<%@ Page Language="C#" EnableSessionState="True" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="System.Drawing.Text" %>
<%@ Import Namespace="System.Drawing.Imaging" %>

<script runat="server">
    //This webform is just for creating the image of captcha
    protected void Page_Init(object sender, EventArgs e)
    {
        Bitmap _bmp = new Bitmap(60, 20);
		
        Graphics _graphics = Graphics.FromImage(_bmp);
        _graphics.Clear(Color.Black);
        Font _font = new Font("Courier New", 12, FontStyle.Bold);

        string allowedChars = "";

        allowedChars = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";

        allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";

        char[] sep = { ',' };

        string[] arr = allowedChars.Split(sep);

        string passwordString = "";

        string temp = "";

        Random rand = new Random();

        for (int i = 0; i < 4; i++)

        {

            temp = arr[rand.Next(0, arr.Length)];

            passwordString += temp;

        }

    
        Session["Captcha"] = passwordString;

        
        _graphics.DrawString(Convert.ToString(Session["Captcha"]), 
            _font, Brushes.White, 3, 3);


        Response.ContentType = "image/gif";
        _bmp.Save(Response.OutputStream, ImageFormat.Gif);
		

        _font.Dispose();
        _graphics.Dispose();
        _bmp.Dispose();

        Response.End();
    }
</script>