<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="commentlist.aspx.cs" Inherits="customer_commentlist" %>

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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="orderno" HeaderText="订单号" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:ImageField DataImageUrlField="pic" HeaderText="房型" ControlStyle-Height="50px" ControlStyle-Width="50px">
                <ControlStyle Height="50px" Width="50px" />
            </asp:ImageField>
            <asp:BoundField DataField="rtname" >
            <ItemStyle HorizontalAlign="Left" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="amount" HeaderText="间数" >
            <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="住客姓名" >
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="checkin" HeaderText="入住日期" 
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="checkout" HeaderText="退房日期" 
                DataFormatString="{0:yyyy-MM-dd}" >
                <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="价格" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="comment" HeaderText="评价状态" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:CommandField SelectText="填写评价" ShowSelectButton="True" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:CommandField>
            <asp:CommandField SelectText="查看评价" ShowSelectButton="True" Visible="False" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    
    <ContentTemplate>
        <asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="orderno" HeaderText="订单号" >
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
                    <asp:BoundField DataField="score" HeaderText="评价" >
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
                    <asp:BoundField DataField="comment" HeaderText="内容" >
                    <ItemStyle HorizontalAlign="Center" Width="500px" />
            </asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="时间" >
                    <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
                    <asp:BoundField DataField="reply" HeaderText="回复" >
                    <ItemStyle HorizontalAlign="Center" Width="300px" />
            </asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="╳" 
            Visible="False"/>
        </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

