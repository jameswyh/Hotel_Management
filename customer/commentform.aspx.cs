using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class customer_commentform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Image1.ImageUrl = Session["pic"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string sqlstr = "insert into CommentInfo(orderno,username,date,score,comment,reply) values('" + Session["orderno"].ToString() + "','" + Session["username"].ToString() + "','" + System.DateTime.Now + "','" + RadioButtonList1.SelectedValue.ToString() + "','" + TextBox1.Text + "','" + "暂无" + "')";
        SqlCommand com = new SqlCommand(sqlstr, myConnection);
        com.ExecuteNonQuery();
        string sqlstr1 = "update OrderInfo set comment = '" + "已评价" + "' where orderno = '" + Session["orderno"].ToString() + "'";
        SqlCommand com1 = new SqlCommand(sqlstr1, myConnection);
        com1.ExecuteNonQuery();
        Response.Redirect("commentlist.aspx");
    }
}