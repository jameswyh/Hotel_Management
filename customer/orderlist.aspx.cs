using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class customer_orderlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand("select * from OrderInfo where username = '" + Session["username"].ToString() + "'", myConnection);
            SqlDataAdapter Adapter = new SqlDataAdapter();
            Adapter.SelectCommand = myCommand;
            DataSet myDs = new DataSet();
            Adapter.Fill(myDs);
            GridView1.DataSource = myDs;
            GridView1.DataBind();
            int i = 0;
            foreach (GridViewRow myrow in GridView1.Rows)
            {
                if (myrow.Cells[9].Text == "已取消" || myrow.Cells[9].Text == "已退房" || myrow.Cells[9].Text == "已入住")
                {
                    ((LinkButton)myrow.Cells[11].Controls[0]).Visible = false;
                }
                else if (myrow.Cells[9].Text == "未入住" && Convert.ToDateTime(myDs.Tables[0].Rows[i]["canceldate"].ToString()) <= System.DateTime.Now)
                {
                    ((Label)(myrow.Cells[10].FindControl("Label1"))).Text = "不可取消";
                    ((LinkButton)myrow.Cells[11].Controls[0]).Visible = false;
                }
                else if(myrow.Cells[9].Text == "未入住" && Convert.ToDateTime(myDs.Tables[0].Rows[i]["canceldate"].ToString()) > System.DateTime.Now)
                    ((Label)(myrow.Cells[10].FindControl("Label1"))).Text = "可在'" + myDs.Tables[0].Rows[i]["canceldate"].ToString() + "'前取消";
                i++;
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('退房成功！房费将于三日内全额返还至您的支付宝账户')", true); 
        string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        SqlCommand com = new SqlCommand("update OrderInfo set state = '" + "已取消" + "'where  orderno = '" + GridView1.SelectedRow.Cells[0].Text + "'", myConnection);
        com.ExecuteNonQuery();
        SqlCommand myCommand = new SqlCommand("select * from OrderInfo where username = '" + Session["username"].ToString() + "'", myConnection);
        SqlDataAdapter Adapter = new SqlDataAdapter();
        Adapter.SelectCommand = myCommand;
        DataSet myDs = new DataSet();
        Adapter.Fill(myDs);
        GridView1.DataSource = myDs;
        GridView1.DataBind();

        int i = 0;
        foreach (GridViewRow myrow in GridView1.Rows)
        {
            if (myrow.Cells[9].Text == "已取消" || myrow.Cells[9].Text == "已退房" || myrow.Cells[9].Text == "已入住")
            {
                ((LinkButton)myrow.Cells[11].Controls[0]).Visible = false;
            }
            else if (myrow.Cells[9].Text == "未入住" && Convert.ToDateTime(myDs.Tables[0].Rows[i]["canceldate"].ToString()) <= System.DateTime.Now)
            {
                ((Label)(myrow.Cells[10].FindControl("Label1"))).Text = "不可取消";
                ((LinkButton)myrow.Cells[11].Controls[0]).Visible = false;
            }
            else if (myrow.Cells[9].Text == "未入住" && Convert.ToDateTime(myDs.Tables[0].Rows[i]["canceldate"].ToString()) > System.DateTime.Now)
                ((Label)(myrow.Cells[10].FindControl("Label1"))).Text = "可在'" + myDs.Tables[0].Rows[i]["canceldate"].ToString() + "'前取消";
            i++;
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
            myCommand = new SqlCommand("select * from OrderInfo where username = '" + Session["username"].ToString() + "' and rtname like '%" + TextBox3.Text + "%'", myConnection);
        }
        else
        {
            myCommand = new SqlCommand("select * from OrderInfo where username = '" + Session["username"].ToString() + "' and state = '" + DropDownList1.SelectedValue.ToString() + "'and rtname like '%" + TextBox3.Text + "%'", myConnection);
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
            if (myrow.Cells[9].Text == "已取消" || myrow.Cells[9].Text == "已退房" || myrow.Cells[9].Text == "已入住")
            {
                ((LinkButton)myrow.Cells[11].Controls[0]).Visible = false;
            }
            else if (myrow.Cells[9].Text == "未入住" && Convert.ToDateTime(myDs.Tables[0].Rows[i]["canceldate"].ToString()) <= System.DateTime.Now)
            {
                ((Label)(myrow.Cells[10].FindControl("Label1"))).Text = "不可取消";
                ((LinkButton)myrow.Cells[11].Controls[0]).Visible = false;
            }
            else if (myrow.Cells[9].Text == "未入住" && Convert.ToDateTime(myDs.Tables[0].Rows[i]["canceldate"].ToString()) > System.DateTime.Now)
                ((Label)(myrow.Cells[10].FindControl("Label1"))).Text = "可在'" + myDs.Tables[0].Rows[i]["canceldate"].ToString() + "'前取消";
            i++;
        }
    }
}