<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="roominfo.aspx.cs" Inherits="roominfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" SiteMapProvider="Web1SiteMap"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HotelManagementConnectionString %>" 
    
        SelectCommand="SELECT rino AS 房号, rtname AS 房型, rifloor as 楼层, ristate as 状态, riother as 备注 FROM RoomInfo" 
        
        
        UpdateCommand="UPDATE RoomInfo SET rtname = @房型, rifloor=@楼层, riother= @备注, ristate = @状态 WHERE (rino = @房号)" 
        DeleteCommand="DELETE FROM RoomInfo WHERE (rino=@房号)" 
        InsertCommand="INSERT INTO RoomInfo(rino, rtname, rifloor, riother, ristate ) VALUES ( @房号,@房型,@楼层,@备注,@状态)">
        <DeleteParameters>
            <asp:Parameter Name="房号" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="房号" />
            <asp:Parameter Name="房型" />
            <asp:Parameter Name="楼层" />
            <asp:Parameter Name="备注" />
            <asp:Parameter Name="状态" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="房型" />
            <asp:Parameter Name="楼层" />
            <asp:Parameter Name="备注" />
            <asp:Parameter Name="状态" />
            <asp:Parameter Name="房号" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HotelManagementConnectionString %>" 
        SelectCommand="SELECT * FROM [RoomType]"></asp:SqlDataSource>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" DataKeyNames="房号">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="房号" HeaderText="房号" SortExpression="房号" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="房型" HeaderText="房型" SortExpression="房型" >
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="楼层" HeaderText="楼层" SortExpression="楼层" >
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="状态" HeaderText="状态" SortExpression="状态" >
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" >
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
        CellPadding="4" DataSourceID="SqlDataSource1" 
        DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
        HorizontalAlign="Left" Visible="False" Width="30%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="房号" HeaderText="房号" SortExpression="房号" />
            <asp:TemplateField HeaderText="房型" SortExpression="房型">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("房型") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="rtname" DataValueField="rtname" 
                        SelectedValue='<%# Bind("房型") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("房型") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="楼层" HeaderText="楼层" SortExpression="楼层" />
            <asp:BoundField DataField="状态" HeaderText="状态" SortExpression="状态" />
            <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
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

