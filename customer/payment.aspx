<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="customer_payment" %>

<script runat="server">
</script>
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
<asp:Panel ID="Panel1" runat="server" style="width: 60%;height: 350px;float:left;">
    <table style="width: 100%;">

        <tr>

            <td style="width:200px;">
                <strong style="font-size: x-large;">&nbsp;&nbsp;&nbsp;&nbsp;完成预订</strong></td>
           

        </tr>
        <tr>

            <td style="width: 531px; text-align: center;">
                打开手机支付宝，扫一扫二维码继续付款</td>
            
        <tr>
            <td style="height: 27px; width: 531px;text-align: center;" >
                <asp:ImageButton ID="ImageButton1" runat="server" Height="200px" 
                    onclick="ImageButton1_Click" Width="200px" />
                </td>
            
           
        </tr>
        <tr>

            <td style="width: 531px;text-align: center;" >
                交易完成后，我们可能需要几分钟的时间来确认支付是否成功</td>
            
        </tr>
    </table>
    <br/>
    <div style="text-align:center">
    <asp:Button ID="Button1" runat="server" Text="返 回" onclick="Button1_Click"/>
    </div>
    <br/>
    <br/>

</asp:Panel>
    <asp:Panel ID="Panel2" runat="server" style="width: 40%;float:right;">
        &nbsp;<strong style="font-size: xx-large">您正在预定</strong>
        <br/>
        &nbsp;<asp:Image ID="Image1" runat="server"/>
<table style="width: 100%;">
        <tr>
            <td colspan="2">
                &nbsp;<strong style="font-size: x-large"><%=Session["rtname"] %></strong></td>
        </tr>
        <tr>
        <td>
                &nbsp;<strong>总额：</strong><%=Session["price"]%>&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<strong>退房政策：</strong>&nbsp;<%=Session["canceldate"]%></td>
        </tr>
    </table>

    </asp:Panel>
    
</asp:Content>

