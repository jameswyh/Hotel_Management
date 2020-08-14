using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class management_chooseroom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand("select * from RoomInfo where rtname = '"+ Session["rtname"].ToString() + "' and ristate = '"+"空闲"+"'", myConnection);
            SqlDataAdapter Adapter = new SqlDataAdapter();
            Adapter.SelectCommand = myCommand;
            DataSet myDs = new DataSet();
            Adapter.Fill(myDs);
            GridView1.DataSource = myDs;
            GridView1.DataBind();

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        SqlCommand myCommand;
        if (DropDownList1.SelectedValue == "全部")
        {
            myCommand = new SqlCommand("select * from RoomInfo where rtname = '" + Session["rtname"].ToString() + "' and ristate = '" + "空闲" + "'", myConnection);
        }
        else
        {
            myCommand = new SqlCommand("select * from RoomInfo where rifloor = '" + DropDownList1.SelectedValue + "' and rtname = '" + Session["rtname"].ToString() + "' and ristate = '" + "空闲" + "'", myConnection);
        }
        SqlDataAdapter Adapter = new SqlDataAdapter();
        Adapter.SelectCommand = myCommand;
        DataSet myDs = new DataSet();
        Adapter.Fill(myDs);
        GridView1.DataSource = myDs;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int j = 0;
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if (cbox.Checked == true)
            {
                j++;
            }
        }
        if (j != int.Parse(Session["amount"].ToString()))
        {
            Response.Write("<script language=javascript>alert('请选择" + Session["amount"].ToString() + "间房间');</script>");
        }
        else
        {
            int k = 0;
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (cbox.Checked == true)
                {
                    k++;
                    string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
                    SqlConnection myConnection = new SqlConnection(sqlconn);
                    myConnection.Open();
                    string sqlstr = "update RoomInfo set ristate =  '" + "占用" + "', orderno = '" + Session["orderno"] + "' where rino = '" + GridView1.Rows[i].Cells[0].Text + "'";
                    SqlCommand com = new SqlCommand(sqlstr, myConnection);
                    com.ExecuteNonQuery();
                    if (k == 1)
                    {
                        Session["rino"] = GridView1.Rows[i].Cells[0].Text;
                    }
                    else
                    {
                        Session["rino"] = Session["rino"].ToString()+ "," + GridView1.Rows[i].Cells[0].Text;
                    }
                }
            }
            string sqlconn1 = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection1 = new SqlConnection(sqlconn1);
            myConnection1.Open();
            string sqlstr1 = "update OrderInfo set state =  '" + "已入住" + "',room = '" + Session["rino"] + "' where orderno = '" + Session["orderno"] + "'";
            SqlCommand com1 = new SqlCommand(sqlstr1, myConnection1);
            com1.ExecuteNonQuery();

            Response.Write("<script language=javascript>alert('入住成功！');window.location = 'checkinout.aspx';</script>");
        }
    }
}