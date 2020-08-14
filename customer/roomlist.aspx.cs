using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class customer_roomlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Timeout = 1440;
        if (!IsPostBack)
        {
            string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand("select * from RoomType", myConnection);
            SqlDataAdapter Adapter = new SqlDataAdapter();
            Adapter.SelectCommand = myCommand;
            DataSet myDs = new DataSet();
            Adapter.Fill(myDs);
            GridView1.DataSource = myDs;
            GridView1.DataBind();
            int i = 0;
            foreach (GridViewRow myrow in GridView1.Rows)
            {
                ((Image)(myrow.Cells[0].FindControl("picimage1"))).ImageUrl = myDs.Tables[0].Rows[i]["rtpic_s"].ToString();
                ((Image)(myrow.Cells[0].FindControl("Image1"))).ImageUrl = myDs.Tables[0].Rows[i]["rtpic_l"].ToString();
                ((Label)(myrow.Cells[1].FindControl("Label1"))).Text = myDs.Tables[0].Rows[i]["rtname"].ToString();
                ((Label)(myrow.Cells[1].FindControl("Label2"))).Text = myDs.Tables[0].Rows[i]["rtname"].ToString();
                ((Label)(myrow.Cells[1].FindControl("Label3"))).Text = ((Label)(myrow.Cells[1].FindControl("Label3"))).Text + myDs.Tables[0].Rows[i]["rtfacility"].ToString();
                ((Label)(myrow.Cells[1].FindControl("Label4"))).Text = ((Label)(myrow.Cells[1].FindControl("Label4"))).Text + myDs.Tables[0].Rows[i]["rtbath"].ToString();
                ((Label)(myrow.Cells[5].FindControl("Label5"))).Text = "可取消";
                ((Label)(myrow.Cells[6].FindControl("Label6"))).Text = "房量充足";
                i++;
            }
        }
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox1.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
        TextBox2.Text = "";
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        TextBox2.Text = Calendar2.SelectedDate.ToString("yyyy-MM-dd");
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date < System.DateTime.Now)
        {
            e.Day.IsSelectable = false;
        }
    }
    protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date < System.DateTime.Now)
        {
            e.Day.IsSelectable = false;
        } 
        if (e.Day.Date <= Calendar1.SelectedDate)
        {
            e.Day.IsSelectable = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(TextBox1.Text) || String.IsNullOrEmpty(TextBox2.Text))
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('请填写入住及退房时间')", true);
        }
        else
        {
            string sqlconn = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            int max = 9999, min = 0;
            if (DropDownList2.SelectedValue == "300以下")
                max = 300;
            else if (DropDownList2.SelectedValue == "300~600")
            {
                min = 300; max = 600;
            }
            else if (DropDownList2.SelectedValue == "600~900")
            {
                min = 600; max = 900;
            }
            else if (DropDownList2.SelectedValue == "900以上")
            {
                min = 900;
            }
            SqlCommand myCommand = new SqlCommand("select * from RoomType  where rtpeople >= '" + DropDownList1.SelectedValue + "' and rtprice>='" + min + "'and rtprice<='" + max + "' and rtname like '%" + TextBox3.Text + "%'", myConnection);
            SqlDataAdapter Adapter = new SqlDataAdapter();
            Adapter.SelectCommand = myCommand;
            DataSet myDs = new DataSet();
            Adapter.Fill(myDs);
            GridView1.DataSource = myDs;
            GridView1.DataBind();
            string cancel;
            int i = 0;
            int canceldays = (Calendar1.SelectedDate - System.DateTime.Now).Days;
            if (canceldays >= 3)
                cancel = "12小时内可取消";
            else
                cancel = "不可取消";
            Session["canceldate"] = cancel;
            foreach (GridViewRow myrow in GridView1.Rows)
            {
                String str = myDs.Tables[0].Rows[i]["rtpic_s"].ToString();
                String str1 = myDs.Tables[0].Rows[i]["rtpic_l"].ToString();
                ((Image)(myrow.Cells[0].FindControl("picimage1"))).ImageUrl = myDs.Tables[0].Rows[i]["rtpic_s"].ToString();
                ((Image)(myrow.Cells[0].FindControl("Image1"))).ImageUrl = myDs.Tables[0].Rows[i]["rtpic_l"].ToString();
                ((Label)(myrow.Cells[1].FindControl("Label1"))).Text = myDs.Tables[0].Rows[i]["rtname"].ToString();
                ((Label)(myrow.Cells[1].FindControl("Label2"))).Text = myDs.Tables[0].Rows[i]["rtname"].ToString();
                ((Label)(myrow.Cells[1].FindControl("Label3"))).Text = ((Label)(myrow.Cells[1].FindControl("Label3"))).Text + myDs.Tables[0].Rows[i]["rtfacility"].ToString();
                ((Label)(myrow.Cells[1].FindControl("Label4"))).Text = ((Label)(myrow.Cells[1].FindControl("Label4"))).Text + myDs.Tables[0].Rows[i]["rtbath"].ToString();
                ((Label)(myrow.Cells[5].FindControl("Label5"))).Text = cancel;

                SqlCommand myCommand1 = new SqlCommand("select * from OrderInfo where rtname = '" + ((Label)(myrow.Cells[1].FindControl("Label1"))).Text + "'and state <> '" + "已取消" + "'and state <> '" + "已退房" + "'", myConnection);
                SqlDataAdapter Adapter1 = new SqlDataAdapter();
                Adapter1.SelectCommand = myCommand1;
                DataSet myDs1 = new DataSet();
                Adapter1.Fill(myDs1);
                int amount = Convert.ToInt32(myDs.Tables[0].Rows[i]["rtamount"].ToString());
                foreach (DataRow dr in myDs1.Tables[0].Rows)
                {
                    DateTime checkin = Convert.ToDateTime(dr["checkin"].ToString());
                    DateTime checkout = Convert.ToDateTime(dr["checkout"].ToString());
                    DateTime starttime = Calendar1.SelectedDate;
                    DateTime endtime = Calendar2.SelectedDate;
                    if (checkin < endtime && checkout > starttime)
                        amount--;
                }

                if (amount >= 3)
                {
                    ((Label)(myrow.Cells[6].FindControl("Label6"))).Text = "房量充足";
                }
                else if (amount == 2)
                {
                    ((Label)(myrow.Cells[6].FindControl("Label6"))).Text = "房量紧缺";
                }
                else if (amount == 1)
                {
                    ((Label)(myrow.Cells[6].FindControl("Label6"))).Text = "仅剩1间";
                }
                else
                {
                    ((Label)(myrow.Cells[6].FindControl("Label6"))).Text = "暂无房间";
                    myrow.Cells[8].Enabled=false;
                }
                i++;
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(TextBox1.Text)||String.IsNullOrEmpty(TextBox2.Text))
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(),"click","alert('请填写入住及退房时间')",true); 
        }
        else
        {
            Session["checkin"] = TextBox1.Text;
            Session["checkout"] = TextBox2.Text;
            Session["rtname"] = ((Label)GridView1.SelectedRow.Cells[1].FindControl("Label1")).Text;
            Session["pic"] = ((Image)GridView1.SelectedRow.Cells[0].FindControl("Image1")).ImageUrl;
            Session["pic_s"] = ((Image)GridView1.SelectedRow.Cells[0].FindControl("picimage1")).ImageUrl;
            Session["rtarea"] = GridView1.SelectedRow.Cells[2].Text;
            Session["rtpeople"] = GridView1.SelectedRow.Cells[3].Text;
            Session["rtnet"] = GridView1.SelectedRow.Cells[4].Text;
            Session["rtprice"] = GridView1.SelectedRow.Cells[7].Text;
            Session["rtfacility"] = ((Label)(GridView1.SelectedRow.Cells[1].FindControl("Label3"))).Text;
            Session["rtbath"] = ((Label)(GridView1.SelectedRow.Cells[1].FindControl("Label4"))).Text;
            Response.Redirect("orderform.aspx");
        }
    }
}