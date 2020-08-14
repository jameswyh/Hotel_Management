<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="orderform.aspx.cs" Inherits="customer_orderform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="text-align:center;">
    <center>
    <asp:Menu ID="Menu1" runat="server" DataSourceID="SiteMapDataSource1" 
        Orientation="Horizontal" RenderingMode="Table">
        <StaticMenuItemStyle HorizontalPadding="100px" />
    </asp:Menu>
    </center>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<asp:Panel ID="Panel1" runat="server" style="width: 60%;height: 350px;float:left;">
    <table style="width: 100%;">
        <tr>
            <td style="width:200px; text-align: center;">
                <strong style="font-size: x-large;">预订信息</strong></td>
            <td style="width:130px">
                入离日期
            </td>
            <td style="width:600px;">
                <%=Session["checkin"]%>&nbsp;至&nbsp;<%=Session["checkout"]%></td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                房间数量
            </td>
            <td>
            1间
                &nbsp;房费:<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td style="vertical-align: text-top">
                住客姓名
            </td>
            <td>
                <asp:TextBox ID="customername1" runat="server" Width="100px"></asp:TextBox>&nbsp;<asp:TextBox ID="customername2" runat="server" Width="100px"></asp:TextBox>
                <asp:TextBox ID="customername3" runat="server" Width="100px" Visible="false"></asp:TextBox>&nbsp;<asp:TextBox ID="customername4" runat="server" Width="100px" Visible="false"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="customername1" Display="Dynamic" ErrorMessage="请输入姓名"></asp:RequiredFieldValidator>
                <br/><asp:Label ID="Label1" runat="server" Text="至少填写1人，最多填写2人。所填姓名需与入住时所持证件一致。"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                身份证号
                </td>
            <td style="width:550px">
                <asp:TextBox ID="customerid1" runat="server" Width="120px"></asp:TextBox>&nbsp;<asp:TextBox ID="customerid2" runat="server" Width="120px"></asp:TextBox>
                <asp:TextBox ID="customerid3" runat="server" Width="120px" Visible="false"></asp:TextBox>&nbsp;<asp:TextBox ID="customerid4" runat="server" Width="120px" Visible="false"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="customerid1" Display="Dynamic" ErrorMessage="请输入身份证号"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="customerid1" Display="Dynamic" ErrorMessage="身份证号格式错误" 
                    ValidationExpression="\d{18}"></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" 
                    ErrorMessage="CustomValidator" 
                    onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>

        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                预计到店</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>12:00</asp:ListItem>
                    <asp:ListItem>13:00</asp:ListItem>
                    <asp:ListItem>14:00</asp:ListItem>
                    <asp:ListItem>15:00</asp:ListItem>
                    <asp:ListItem>16:00</asp:ListItem>
                    <asp:ListItem>17:00</asp:ListItem>
                    <asp:ListItem>18:00</asp:ListItem>
    </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="height: 27px">
                </td>
            <td style="height: 27px">
                手机号码</td>
            <td style="height: 27px">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="请输入手机号码"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="手机号码格式错误" 
                    ValidationExpression="^[1][4358]\d{9}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                Email</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="请输入Email"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Email格式错误" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
</td>
        </tr>
    </table>
    <br/>
    <br/>
    <div style="text-align:center">
    <div style="text-align:center">
    <asp:Button ID="Button2" runat="server" Text="返 回" onclick="Button2_Click"/>
     &nbsp; &nbsp; &nbsp;
    <asp:Button ID="Button1" runat="server" Text="付 款" onclick="Button1_Click"/>
    </div>
    <br/>
    <br/>

</asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>

    <asp:Panel ID="Panel2" runat="server" style="width: 40%;float:right;">
        &nbsp;<strong style="font-size: xx-large">您的选择</strong>
        <br/>
        &nbsp;<asp:Image ID="Image1" runat="server"/>
<table style="width: 100%;">
        <tr>
            <td colspan="2">
                &nbsp;<strong style="font-size: x-large"><%=Session["rtname"] %></strong></td>
        </tr>
        <tr>
            <td style="width: 200px">
                &nbsp;<strong>面积：</strong><%=Session["rtarea"]%></td>
            <td>
                &nbsp;<strong>入住人数：</strong><%=Session["rtpeople"]%></td>
        </tr>
        <tr>
            <td style="width: 200px">
                &nbsp;<strong>宽带：</strong><%=Session["rtnet"]%></td>
            <td>
                &nbsp;<strong>价格/晚：¥</strong><%=Session["rtprice"]%>&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<strong>其他：</strong>&nbsp;<%=Session["rtfacility"]%></td>
        </tr>
        <tr>
            <td colspan="2">
                <%=Session["rtbath"]%></td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<strong>退房政策：</strong>&nbsp;<%=Session["canceldate"]%></td>
        </tr>
    </table>

    </asp:Panel>
    
</asp:Content>


