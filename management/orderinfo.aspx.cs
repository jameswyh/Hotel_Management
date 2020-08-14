using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class orderinfo1 : System.Web.UI.Page
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
                ((Label)(myrow.Cells[4].FindControl("Label1"))).Text = myDs.Tables[0].Rows[i]["name"].ToString();
                ((Label)(myrow.Cells[4].FindControl("Label2"))).Text = myDs.Tables[0].Rows[i]["name"].ToString();
                ((Label)(myrow.Cells[4].FindControl("Label3"))).Text = ((Label)(myrow.Cells[1].FindControl("Label3"))).Text + myDs.Tables[0].Rows[i]["idcard"].ToString();
                ((Label)(myrow.Cells[4].FindControl("Label4"))).Text = ((Label)(myrow.Cells[1].FindControl("Label4"))).Text + myDs.Tables[0].Rows[i]["phone"].ToString();
                ((Label)(myrow.Cells[4].FindControl("Label5"))).Text = ((Label)(myrow.Cells[1].FindControl("Label5"))).Text + myDs.Tables[0].Rows[i]["email"].ToString();

                if (myrow.Cells[9].Text != "未入住")
                {
                    ((LinkButton)myrow.Cells[10].Controls[0]).Visible = false;
                }
              
                i++;
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string sqlstr = "update OrderInfo set state =  '" + "已取消" + "' where orderno = '" + GridView1.SelectedRow.Cells[0].Text + "'";
        SqlCommand com = new SqlCommand(sqlstr, myConnection);
        com.ExecuteNonQuery();
        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('订单已取消！')", true);
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
            ((Label)(myrow.Cells[4].FindControl("Label1"))).Text = myDs.Tables[0].Rows[i]["name"].ToString();
            ((Label)(myrow.Cells[4].FindControl("Label2"))).Text = myDs.Tables[0].Rows[i]["name"].ToString();
            ((Label)(myrow.Cells[4].FindControl("Label3"))).Text = ((Label)(myrow.Cells[1].FindControl("Label3"))).Text + myDs.Tables[0].Rows[i]["idcard"].ToString();
            ((Label)(myrow.Cells[4].FindControl("Label4"))).Text = ((Label)(myrow.Cells[1].FindControl("Label4"))).Text + myDs.Tables[0].Rows[i]["phone"].ToString();
            ((Label)(myrow.Cells[4].FindControl("Label5"))).Text = ((Label)(myrow.Cells[1].FindControl("Label5"))).Text + myDs.Tables[0].Rows[i]["email"].ToString();

            if (myrow.Cells[9].Text != "未入住")
            {
                ((LinkButton)myrow.Cells[10].Controls[0]).Visible = false;
            }

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
            myCommand = new SqlCommand("select * from OrderInfo where rtname like '%" + TextBox3.Text + "%' or name like '%" + TextBox3.Text + "%'or checkin like '%" + TextBox3.Text + "%'", myConnection);
        }
        else
        {
            myCommand = new SqlCommand("select * from OrderInfo where state = '" + DropDownList1.SelectedValue.ToString() + "'and (rtname like '%" + TextBox3.Text + "%' or name like '%" + TextBox3.Text + "%'or checkin like '%" + TextBox3.Text + "%')", myConnection);
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
            ((Label)(myrow.Cells[4].FindControl("Label1"))).Text = myDs.Tables[0].Rows[i]["name"].ToString();
            ((Label)(myrow.Cells[4].FindControl("Label2"))).Text = myDs.Tables[0].Rows[i]["name"].ToString();
            ((Label)(myrow.Cells[4].FindControl("Label3"))).Text = ((Label)(myrow.Cells[1].FindControl("Label3"))).Text + myDs.Tables[0].Rows[i]["idcard"].ToString();
            ((Label)(myrow.Cells[4].FindControl("Label4"))).Text = ((Label)(myrow.Cells[1].FindControl("Label4"))).Text + myDs.Tables[0].Rows[i]["phone"].ToString();
            ((Label)(myrow.Cells[4].FindControl("Label5"))).Text = ((Label)(myrow.Cells[1].FindControl("Label5"))).Text + myDs.Tables[0].Rows[i]["email"].ToString();

            if (myrow.Cells[9].Text != "未入住")
            {
                ((LinkButton)myrow.Cells[10].Controls[0]).Visible = false;
            }
            i++;
        }
    }
}