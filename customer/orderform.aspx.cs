using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class customer_orderform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Image1.ImageUrl = Session["pic"].ToString();
            DateTime checkin = Convert.ToDateTime(Session["checkin"].ToString());
            DateTime checkout = Convert.ToDateTime(Session["checkout"].ToString());
            double day = (checkout - checkin).Days;
            Label2.Text = "¥" + (Convert.ToDouble(Session["rtprice"].ToString()) * day).ToString() + ".00";
            Session["price"] = Label2.Text;
            if (Session["rtpeople"].ToString() == "2")
            {
                customername3.Visible = false;
                customername4.Visible = false;

                customerid3.Visible = false;
                customerid4.Visible = false;
                Label1.Text = "至少填写1人，最多填写2人。所填姓名需与入住时所持证件一致。";
                
            }
            else if (Session["rtpeople"].ToString() == "1")
            {
                customername2.Visible = false;
                customername3.Visible = false;
                customername4.Visible = false;
                customerid2.Visible = false;
                customerid3.Visible = false;
                customerid4.Visible = false;
                Label1.Text = "所填姓名需与入住时所持证件一致。";
            }
            else
            {
                customername3.Visible = true;
                customername4.Visible = true;
                customerid3.Visible = true;
                customerid4.Visible = true;
                Label1.Text = "至少填写1人，最多填写4人。所填姓名需与入住时所持证件一致。";
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String customername = customername1.Text;
        String customerid = customerid1.Text;
        if (!String.IsNullOrEmpty(customername2.Text))
        {
            customername = customername1.Text + "," + customername2.Text;
            customerid = customerid1.Text + "," + customerid2.Text;
        }
        else if (!String.IsNullOrEmpty(customername2.Text) && !String.IsNullOrEmpty(customername3.Text))
        {
            customername = customername1.Text + "," + customername2.Text + "," + customername3.Text;
            customerid = customerid1.Text + "," + customerid2.Text + "," + customerid3.Text;
        }
        else if (!String.IsNullOrEmpty(customername2.Text) && !String.IsNullOrEmpty(customername3.Text) && !String.IsNullOrEmpty(customername4.Text))
        {
            customername = customername1.Text + "," + customername2.Text + "," + customername3.Text + "," + customername4.Text;
            customerid = customerid1.Text + "," + customerid2.Text + "," + customerid3.Text + "," + customerid4.Text;
        }
        Session["customername"] = customername;
        Session["customerid"] = customerid;
        Session["phone"] = TextBox3.Text;
        Session["email"] = TextBox4.Text;
        Session["time"] = DropDownList2.SelectedValue.ToString();

        
        Response.Redirect("payment.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("roomlist.aspx");
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {

    }
}
