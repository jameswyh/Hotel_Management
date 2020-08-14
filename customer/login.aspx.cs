using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx"); 
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String user = username.Text;
        String pwd = password.Text;
        string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string str;
        if (identity.SelectedItem.ToString() == "顾客")
        {
            str = "select count(*) from CustomerInfo where username='" + user + "' and password='" + pwd + "'";           
        }
        else
        {
            str = "select count(*) from AdminInfo where username='" + user + "' and password='" + pwd + "'";          
        }
        SqlCommand myCommand = new SqlCommand(str, myConnection);
        int usern = Convert.ToInt32(myCommand.ExecuteScalar());
        if (usern != 0 && identity.SelectedItem.ToString() == "顾客")
        {
            Session["username"] = user;
            Response.Write("<script language=javascript>alert('顾客登录成功！');window.location = 'homepage.aspx';</script>");   
        }
        else if (usern != 0 && identity.SelectedItem.ToString() == "前台服务员")
        {
            Session["username"] = user;
            Response.Write("<script language=javascript>alert('前台服务员登录成功！');window.location = '../management/Default.aspx';</script>"); 
        }
        else
        {
            Response.Write("<script language=javascript>alert('登录失败：用户名或密码错误！');window.location = 'login.aspx';</script>");
        }

    }
}