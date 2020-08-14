using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class customer_homepage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "上海中心气象台2018年12月28日11时发布：多云，今天白天到夜间东部沿海地区有零星小雪，明天多云。偏北风4-5级阵风6级。";
        //localhost.WeatherWebService lw = new localhost.WeatherWebService();
        //string[] str = lw.getWeatherbyCityName("上海");
        //for (int i = 4; i < 20; i++)
        //{
         //   if (str[i].Contains("gif"))
          //  {
            //    i = i + 2;
          //  }
          //  Label1.Text += str[i] + "   ";
         //   i++;
       // }
        Image1.ImageUrl = "../pic/home.jpg";
    }
}