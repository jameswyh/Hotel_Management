using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class commentmanagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sqlconn1 = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection1 = new SqlConnection(sqlconn1);
            myConnection1.Open();
            SqlCommand myCommand1 = new SqlCommand("select * from CommentInfo", myConnection1);
            SqlDataAdapter Adapter1 = new SqlDataAdapter();
            Adapter1.SelectCommand = myCommand1;
            DataSet myDs1 = new DataSet();
            Adapter1.Fill(myDs1);
            GridView1.DataSource = myDs1;
            GridView1.DataBind();
            GridView1.Visible = true;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (((LinkButton)GridView1.SelectedRow.Cells[5].Controls[0]).Text == "回复")
        {
            Panel1.Visible = true;
            Session["comid"] = GridView1.SelectedRow.Cells[0].Text;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
            ScriptManager.RegisterClientScriptBlock(UpdatePanel2, this.GetType(), "click", "alert('回复不得为空')", true);
        else
        {
            string sqlconn1 = @"Data Source=JAMESWANG\SQLEXPRESS;Database=HotelManagement;Integrated Security=True";
            SqlConnection myConnection1 = new SqlConnection(sqlconn1);
            myConnection1.Open();
            SqlCommand com = new SqlCommand("update CommentInfo set reply = '" + TextBox1.Text + "' where orderno='" + Session["comid"].ToString() + "'", myConnection1);
            com.ExecuteNonQuery();
            SqlCommand myCommand1 = new SqlCommand("select * from CommentInfo", myConnection1);
            SqlDataAdapter Adapter1 = new SqlDataAdapter();
            Adapter1.SelectCommand = myCommand1;
            DataSet myDs1 = new DataSet();
            Adapter1.Fill(myDs1);
            GridView1.DataSource = myDs1;
            GridView1.DataBind();
            GridView1.Visible = true;
            Panel1.Visible = false;
        }

    }
}