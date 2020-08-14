using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class management_checkinout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand("select * from OrderInfo ", myConnection);
            SqlDataAdapter Adapter = new SqlDataAdapter();
            Adapter.SelectCommand = myCommand;
            DataSet myDs = new DataSet();
            Adapter.Fill(myDs);
            GridView1.DataSource = myDs;
            GridView1.DataBind();
            int i = 0;
            foreach (GridViewRow myrow in GridView1.Rows)
            {
                ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = myDs.Tables[0].Rows[i]["deposit"].ToString();
                if (myrow.Cells[9].Text == "已取消")
                {
                    ((LinkButton)myrow.Cells[12].Controls[0]).Visible = false;
                    ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "";
                }
                else if (myrow.Cells[9].Text == "未入住" && myDs.Tables[0].Rows[i]["deposit"].ToString()=="")
                {
                    ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "未收取";
                    ((LinkButton)myrow.Cells[12].Controls[0]).Text = "收取押金";
                }
                else if (myrow.Cells[9].Text == "未入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "已收取")
                {
                    ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "已收取";
                    ((LinkButton)myrow.Cells[12].Controls[0]).Text = "入住";
                }
                else if (myrow.Cells[9].Text == "已入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "已收取")
                {
                    ((LinkButton)myrow.Cells[12].Controls[0]).Text = "退还押金";
                }
                else if (myrow.Cells[9].Text == "已入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "已退还")
                {
                    ((LinkButton)myrow.Cells[12].Controls[0]).Text = "退房";
                    ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "已退还";
                }
                else if (myrow.Cells[9].Text == "已退房")
                {
                    ((LinkButton)myrow.Cells[12].Controls[0]).Visible = false;
                    ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "已退还";
                }
                i++;
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (((LinkButton)GridView1.SelectedRow.Cells[12].Controls[0]).Text == "收取押金" )
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('请收取押金200元')", true);
            ((Label)(GridView1.SelectedRow.Cells[11].FindControl("Label1"))).Text = "已收取";
            ((LinkButton)GridView1.SelectedRow.Cells[12].Controls[0]).Text = "入住";
            string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            string sqlstr = "update OrderInfo set deposit =  '" + "已收取" + "' where orderno = '" + GridView1.SelectedRow.Cells[0].Text + "'";
            SqlCommand com = new SqlCommand(sqlstr, myConnection);
            com.ExecuteNonQuery();
        }
        else if (((LinkButton)GridView1.SelectedRow.Cells[12].Controls[0]).Text == "入住")
        {
            Session["orderno"] = GridView1.SelectedRow.Cells[0].Text;
            Session["rtname"] = GridView1.SelectedRow.Cells[2].Text;
            Session["amount"] = GridView1.SelectedRow.Cells[3].Text;
            Response.Redirect("chooseroom.aspx");
        }
        else if (((LinkButton)GridView1.SelectedRow.Cells[12].Controls[0]).Text == "退还押金")
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('请退还押金200元')", true);
            string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            string sqlstr = "update OrderInfo set deposit =  '" + "已退还" + "' where orderno = '" + GridView1.SelectedRow.Cells[0].Text + "'";
            SqlCommand com = new SqlCommand(sqlstr, myConnection);
            com.ExecuteNonQuery();
            ((LinkButton)GridView1.SelectedRow.Cells[12].Controls[0]).Text = "退房";
            ((Label)(GridView1.SelectedRow.Cells[11].FindControl("Label1"))).Text = "已退还";
        }

        else if (((LinkButton)GridView1.SelectedRow.Cells[12].Controls[0]).Text == "退房")
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('退房成功！已通知清洁工清理房间！')", true);
            string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            string sqlstr = "update RoomInfo set ristate =  '" + "空闲" + "' where orderno = '" + GridView1.SelectedRow.Cells[0].Text + "'";
            SqlCommand com = new SqlCommand(sqlstr, myConnection);
            com.ExecuteNonQuery();
            string sqlconn1 = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection1 = new SqlConnection(sqlconn1);
            myConnection1.Open();
            string sqlstr1 = "update OrderInfo set state =  '" + "已退房" + "'where orderno = '" + GridView1.SelectedRow.Cells[0].Text + "'";
            SqlCommand com1 = new SqlCommand(sqlstr1, myConnection1);
            com1.ExecuteNonQuery();
            SqlCommand myCommand = new SqlCommand("select * from OrderInfo ", myConnection);
            SqlDataAdapter Adapter = new SqlDataAdapter();
            Adapter.SelectCommand = myCommand;
            DataSet myDs = new DataSet();
            Adapter.Fill(myDs);
            GridView1.DataSource = myDs;
            GridView1.DataBind();
            int i = 0;
            foreach (GridViewRow myrow in GridView1.Rows)
            {
                if (myrow.Cells[9].Text == "已取消")
                {
                    ((LinkButton)myrow.Cells[12].Controls[0]).Visible = false;
                    ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "";
                }
                else if (myrow.Cells[9].Text == "未入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "")
                {
                    ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "未收取";
                    ((LinkButton)myrow.Cells[12].Controls[0]).Text = "收取押金";
                }
                else if (myrow.Cells[9].Text == "未入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "已收取")
                {
                    ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "已收取";
                    ((LinkButton)myrow.Cells[12].Controls[0]).Text = "入住";
                }
                else if (myrow.Cells[9].Text == "已入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "已收取")
                {
                    ((LinkButton)myrow.Cells[12].Controls[0]).Text = "退还押金";
                }
                else if (myrow.Cells[9].Text == "已入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "已退还")
                {
                    ((LinkButton)myrow.Cells[12].Controls[0]).Text = "退房";
                }
                else if (myrow.Cells[9].Text == "已退房")
                {
                    ((LinkButton)myrow.Cells[12].Controls[0]).Visible = false;
                    ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "已退还";
                }
                i++;
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        SqlCommand myCommand;
        if (DropDownList1.SelectedValue.ToString() == "全部")
        {
            myCommand = new SqlCommand("select * from OrderInfo where rtname like '%" + TextBox3.Text + "%' or name like '%" + TextBox3.Text + "%'or room like '%" + TextBox3.Text + "%'or checkin like '%" + TextBox3.Text + "%'", myConnection);
        }
        else
        {
            myCommand = new SqlCommand("select * from OrderInfo where state = '" + DropDownList1.SelectedValue.ToString() + "'and (rtname like '%" + TextBox3.Text + "%' or name like '%" + TextBox3.Text + "%'or room like '%" + TextBox3.Text + "%'or checkin like '%" + TextBox3.Text + "%')", myConnection);
        }
        SqlDataAdapter Adapter = new SqlDataAdapter();
        Adapter.SelectCommand = myCommand;
        DataSet myDs = new DataSet();
        Adapter.Fill(myDs);
        GridView1.DataSource = myDs;
        GridView1.DataBind();
        int i = 0;
        foreach (GridViewRow myrow in GridView1.Rows)
        {
            if (myrow.Cells[9].Text == "已取消")
            {
                ((LinkButton)myrow.Cells[12].Controls[0]).Visible = false;
                ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "";
            }
            else if (myrow.Cells[9].Text == "未入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "")
            {
                ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "未收取";
                ((LinkButton)myrow.Cells[12].Controls[0]).Text = "收取押金";
            }
            else if (myrow.Cells[9].Text == "未入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "已收取")
            {
                ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "已收取";
                ((LinkButton)myrow.Cells[12].Controls[0]).Text = "入住";
            }
            else if (myrow.Cells[9].Text == "已入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "已收取")
            {
                ((LinkButton)myrow.Cells[12].Controls[0]).Text = "退还押金";
            }
            else if (myrow.Cells[9].Text == "已入住" && myDs.Tables[0].Rows[i]["deposit"].ToString() == "已退还")
            {
                ((LinkButton)myrow.Cells[12].Controls[0]).Text = "退房";
            }
            else if (myrow.Cells[9].Text == "已退房")
            {
                ((LinkButton)myrow.Cells[12].Controls[0]).Visible = false;
                ((Label)(myrow.Cells[11].FindControl("Label1"))).Text = "已退还";
            }
            i++;
        }
    }
}