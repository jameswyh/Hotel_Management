<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="commentform.aspx.cs" Inherits="customer_commentform" %>

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
                <strong style="font-size: x-large;">评价内容</strong></td>
            <td style="width:130px">
                评价
            </td>
            <td style="width:600px;">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal" Width="300px">
                    <asp:ListItem Selected="True">好评</asp:ListItem>
                    <asp:ListItem>中评</asp:ListItem>
                    <asp:ListItem>差评</asp:ListItem>
                </asp:RadioButtonList>
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                内容
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" Height="100px" 
                    TextMode="MultiLine" Width="500px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br/>
    <br/>
    <div style="text-align:center">
    <asp:Button ID="Button1" runat="server" Text="提 交" onclick="Button1_Click"/>
    </div>
    <br/>
    <br/>

</asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>
    <asp:Panel ID="Panel2" runat="server" style="width: 40%;float:right;">
        &nbsp;<strong style="font-size: xx-large">您的订单</strong>
        <br/>
        &nbsp;<asp:Image ID="Image1" runat="server"/>
<table style="width: 100%;">
        <tr>
            <td colspan="2">
                &nbsp;<strong style="font-size: x-large"><%=Session["rtname"] %></strong></td>
        </tr>
        <tr>
            <td style="width: 200px">
                &nbsp;<strong>订单号：</strong><%=Session["orderno"]%></td>
            <td>
                &nbsp;<strong>入住日期：</strong><%=Session["checkin"]%></td>
        </tr>
        <tr>
            <td style="width: 200px">
                &nbsp;<strong>退房日期：</strong><%=Session["checkout"]%></td>
            <td>
                &nbsp;<strong>价格：</strong><%=Session["price"]%>&nbsp;
            </td>
        </tr>
    </table>

    </asp:Panel>
</asp:Content>

