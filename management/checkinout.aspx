<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkinout.aspx.cs" Inherits="management_checkinout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" SiteMapProvider="Web1SiteMap"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <asp:Panel ID="Panel3" runat="server" style="padding:10px;">
        &nbsp;订单状态：<asp:DropDownList ID="DropDownList1" runat="server" 
            AutoPostBack="True">
            <asp:ListItem>未入住</asp:ListItem>
            <asp:ListItem>已入住</asp:ListItem>
            <asp:ListItem>已退房</asp:ListItem>
            <asp:ListItem>已取消</asp:ListItem>
            <asp:ListItem Value="全部" Selected="True">全部</asp:ListItem>
        </asp:DropDownList>
        &nbsp;关键字：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="Button1"
            runat="server" Text="搜索" onclick="Button1_Click" Height="27px" />          
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
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
            <ItemStyle HorizontalAlign="Center" Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="checkin" HeaderText="入住日期" 
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="checkout" HeaderText="退房日期" 
                DataFormatString="{0:yyyy-MM-dd}" >
                <ItemStyle HorizontalAlign="Center" Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="arrivetime" HeaderText="到达时间" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="价格" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="state" HeaderText="订单状态" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="room" HeaderText="房间" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="押金">
            <ItemStyle HorizontalAlign="Center" Width="100px" />
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField SelectText="收取押金" ShowSelectButton="True" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:CommandField>
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
</asp:Content>

