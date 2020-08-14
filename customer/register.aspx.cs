using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["CheckCode"];
        if (cookie.Value != this.txtCode.Text.Trim())
        {
            Label1.Text="验证码错误";     
        }
        else if (Page.IsValid)
        {
            string str = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection = new SqlConnection(str);
            myConnection.Open();
            string sqlstr = "insert into CustomerInfo(username,password,email) values('" + this.username.Text + "','" + this.password1.Text + "','" + this.email.Text + "')";
            SqlCommand com = new SqlCommand(sqlstr, myConnection);
            com.ExecuteNonQuery();
            Session["username"] = this.username.Text;
            Response.Write("<script language=javascript>alert('恭喜您，注册已成功！');window.location = '../customer/homepage.aspx';</script>");
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string user = args.Value;
        string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string str = "select count(*) from CustomerInfo where username='" + user + "'";
        SqlCommand myCommand = new SqlCommand(str, myConnection);

        int usern = Convert.ToInt32(myCommand.ExecuteScalar());

        if (usern != 0 )
        {
            args.IsValid = false;
            CustomValidator1.ErrorMessage = "用户名已存在，请重新输入";
        }
        else
        {
            args.IsValid = true;
        }
    }
}