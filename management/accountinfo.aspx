<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="accountinfo.aspx.cs" Inherits="accountinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" 
    SiteMapProvider="Web1SiteMap" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HotelManagementConnectionString %>" 
    
        SelectCommand="SELECT userid AS 编号, username AS 用户名, password AS 密码, email as 邮箱 FROM CustomerInfo" 
        
        UpdateCommand="UPDATE CustomerInfo SET username = @用户名, password = @密码, email = @邮箱 WHERE (userid = @编号)
" 
        DeleteCommand="DELETE FROM CustomerInfo WHERE userid=@编号" 
        
        InsertCommand="INSERT INTO CustomerInfo(username, password, email) VALUES ( @用户名, @密码, @邮箱)">
        <DeleteParameters>
            <asp:Parameter Name="编号" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="用户名" />
            <asp:Parameter Name="密码" />
            <asp:Parameter Name="邮箱" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="用户名" />
            <asp:Parameter Name="密码" />
            <asp:Parameter Name="邮箱" />
            <asp:Parameter Name="编号" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="编号" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="用户名" HeaderText="用户名" SortExpression="用户名" >
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="密码" HeaderText="密码" SortExpression="密码" >
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="邮箱" HeaderText="邮箱" SortExpression="邮箱" >
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
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
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="新增" />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataKeyNames="编号" DataSourceID="SqlDataSource1" 
        DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
        HorizontalAlign="Left" Visible="False" Width="30%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="用户名" HeaderText="用户名" SortExpression="用户名" />
            <asp:BoundField DataField="密码" HeaderText="密码" SortExpression="密码" />
            <asp:BoundField DataField="邮箱" HeaderText="邮箱" SortExpression="邮箱" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle BorderStyle="None" Width="100%" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
</asp:Content>

