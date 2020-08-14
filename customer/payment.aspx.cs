using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Threading;

public partial class customer_payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Image1.ImageUrl = Session["pic"].ToString();
            ImageButton1.ImageUrl = "../pic/qrcode.jpg";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("orderform.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        DateTime canceldate = System.DateTime.Now;
        if (Session["canceldate"].ToString() == "12小时内可取消")
        {
            canceldate = canceldate.AddHours(12);
        }
        string sqlstr = "insert into OrderInfo(username,name,idcard,rtname,phone,email,checkin,checkout,arrivetime,pic,amount,state,price,comment,canceldate) values('" + Session["username"].ToString() + "','" + Session["customername"].ToString() + "','" + Session["customerid"].ToString() + "','" + Session["rtname"].ToString() + "','" + Session["phone"].ToString() + "','" + Session["email"].ToString() + "','" + Session["checkin"].ToString() + "','" + Session["checkout"].ToString() + "','" + Session["time"].ToString() + "','" + Session["pic_s"].ToString() + "','" + "1" + "','" + "未入住" + "','" + Session["price"].ToString() + "','" + "未评价" + "','" + canceldate + "')";
        SqlCommand com = new SqlCommand(sqlstr, myConnection);
        com.ExecuteNonQuery();
        Response.Write("<script language=javascript>alert('付款成功！');window.location = '../customer/orderlist.aspx';</script>");
    }
}