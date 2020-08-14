using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
    //    localhost.WeatherWebService lw = new localhost.WeatherWebService();
    //    string[] str = lw.getWeatherbyCityName("上海");
    //    for (int i = 4; i < 20; i++)
    //    {
    //        if (str[i].Contains("gif"))
    //        {
    //            i = i + 2;
    //       }
    //        Label1.Text += str[i] + "   ";
    //        i++;
    //    }

        Image1.ImageUrl = "../pic/home.jpg";
    }
}