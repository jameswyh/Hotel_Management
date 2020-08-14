<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="roomtype.aspx.cs" Inherits="roomtype1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" SiteMapProvider="Web1SiteMap"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HotelManagementConnectionString %>" 
    
        SelectCommand="SELECT rtid AS 编号, rtname AS 名称, rtarea AS 面积, rtpeople AS 可住人数, rtnet AS 宽带, rtfacility as 设施, rtbath as 浴室,rtprice as 价格,rtpic_s as 小图,rtpic_l as 大图 FROM RoomType" 
        UpdateCommand="UPDATE RoomType SET rtname = @名称, rtarea = @面积, rtpeople = @可住人数, rtnet = @宽带, rtfacility = @设施, rtbath = @浴室, rtprice = @价格,rtpic_s = @小图, rtpic_l = @大图  WHERE (rtid = @编号)" 
        DeleteCommand="DELETE FROM RoomType WHERE rtid=@编号" 
        
    InsertCommand="INSERT INTO RoomType(rtname, rtarea, rtpeople, rtnet, rtfacility, rtbath, rtprice,rtpic_s, rtpic_l) VALUES ( @名称,@面积,@可住人数,@宽带,@设施,@浴室,@价格,@小图,@大图 )">
        
        <DeleteParameters>
            <asp:Parameter Name="编号" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="名称" />
            <asp:Parameter Name="面积" />
            <asp:Parameter Name="可住人数" />
            <asp:Parameter Name="宽带" />
            <asp:Parameter Name="设施" />
            <asp:Parameter Name="浴室" />
            <asp:Parameter Name="价格" />
            <asp:Parameter Name="小图" />
            <asp:Parameter Name="大图" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="名称" />
            <asp:Parameter Name="面积" />
            <asp:Parameter Name="可住人数" />
            <asp:Parameter Name="宽带" />
            <asp:Parameter Name="设施" />
            <asp:Parameter Name="浴室" />
            <asp:Parameter Name="价格" />
            <asp:Parameter Name="小图" />
            <asp:Parameter Name="大图" />
            <asp:Parameter Name="编号" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="编号" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="编号" HeaderText="编号" SortExpression="编号" 
                InsertVisible="False" ReadOnly="True" >
            <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:BoundField>
            <asp:BoundField DataField="名称" HeaderText="名称" SortExpression="名称" >
            <ItemStyle HorizontalAlign="Center" Width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="面积" HeaderText="面积" SortExpression="面积" >
            <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:BoundField>
            <asp:BoundField DataField="可住人数" HeaderText="可住人数" SortExpression="可住人数" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="宽带" HeaderText="宽带" SortExpression="宽带" >
            <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:BoundField>
            <asp:BoundField DataField="设施" HeaderText="设施" SortExpression="设施" >
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="浴室" HeaderText="浴室" SortExpression="浴室" >
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="价格" HeaderText="价格" SortExpression="价格" >
            <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="小图" HeaderText="小图" SortExpression="小图" >
            <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="大图" HeaderText="大图" SortExpression="大图" >
            <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:BoundField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
            <asp:BoundField DataField="编号" HeaderText="编号" InsertVisible="False" 
                ReadOnly="True" SortExpression="编号" />
            <asp:BoundField DataField="名称" HeaderText="名称" SortExpression="名称" />
            <asp:BoundField DataField="面积" HeaderText="面积" SortExpression="面积" />
            <asp:BoundField DataField="可住人数" HeaderText="可住人数" SortExpression="可住人数" />
            <asp:BoundField DataField="宽带" HeaderText="宽带" SortExpression="宽带" />
            <asp:BoundField DataField="设施" HeaderText="设施" SortExpression="设施" />
            <asp:BoundField DataField="浴室" HeaderText="浴室" SortExpression="浴室" />
            <asp:BoundField DataField="价格" HeaderText="价格" SortExpression="价格" />
            <asp:BoundField DataField="小图" HeaderText="小图" SortExpression="小图" />
            <asp:BoundField DataField="大图" HeaderText="大图" SortExpression="大图" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle BorderStyle="None" Width="100%" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

