using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class roomtype1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DetailsView1.Visible == false)
        {
            Button1.Text = "取消";
            DetailsView1.Visible = true;
        }
        else
        {
            Button1.Text = "新增";
            DetailsView1.Visible = false;
        }
    }
}