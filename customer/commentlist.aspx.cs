using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class customer_commentlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand("select * from OrderInfo where username = '" + Session["username"].ToString() + "' and state = '" + "已退房" + "'", myConnection);
            SqlDataAdapter Adapter = new SqlDataAdapter();
            Adapter.SelectCommand = myCommand;
            DataSet myDs = new DataSet();
            Adapter.Fill(myDs);
            GridView1.DataSource = myDs;
            GridView1.DataBind();
        }
        int i = 0;
        foreach (GridViewRow myrow in GridView1.Rows)
        {
            if (myrow.Cells[8].Text == "已评价")
            {
                ((LinkButton)myrow.Cells[9].Controls[0]).Text = "查看评价";
            }
            i++;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (((LinkButton)GridView1.SelectedRow.Cells[9].Controls[0]).Text == "填写评价")
        {
            Session["orderno"] = GridView1.SelectedRow.Cells[0].Text;
            Session["rtname"] = GridView1.SelectedRow.Cells[2].Text;
            Session["pic"] = ((Image)GridView1.SelectedRow.Cells[1].Controls[0]).ImageUrl;
            Session["checkin"] = GridView1.SelectedRow.Cells[5].Text;
            Session["checkout"] = GridView1.SelectedRow.Cells[6].Text;
            Session["price"] = GridView1.SelectedRow.Cells[7].Text;
            Response.Redirect("commentform.aspx");
        }
        else
        {
            string sqlconn1 = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection1 = new SqlConnection(sqlconn1);
            myConnection1.Open();
            SqlCommand myCommand1 = new SqlCommand("select * from CommentInfo where username = '" + Session["username"].ToString() + "' and orderno =  '" + GridView1.SelectedRow.Cells[0].Text + "'", myConnection1);
            SqlDataAdapter Adapter1 = new SqlDataAdapter();
            Adapter1.SelectCommand = myCommand1;
            DataSet myDs1 = new DataSet();
            Adapter1.Fill(myDs1);
            GridView2.DataSource = myDs1;
            GridView2.DataBind();
            GridView2.Visible = true;
            Button1.Visible = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView2.Visible = false;
        Button1.Visible = false;
    }
}