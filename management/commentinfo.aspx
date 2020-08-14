<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="commentinfo.aspx.cs" Inherits="commentmanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" SiteMapProvider="Web1SiteMap"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="orderno" HeaderText="订单号" >
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
                    <asp:BoundField DataField="score" HeaderText="评价" >
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
                    <asp:BoundField DataField="comment" HeaderText="内容" >
                    <ItemStyle HorizontalAlign="Center" Width="300px" />
            </asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="时间" >
                    <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
                    <asp:BoundField DataField="reply" HeaderText="回复" >
                    <ItemStyle HorizontalAlign="Center" Width="300px" />
            </asp:BoundField>
                    <asp:CommandField SelectText="回复" ShowSelectButton="True" />
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
    <asp:Panel ID="Panel1" runat="server" Visible = "false" style="padding:20px;">
    <br/>
        <strong><span style="font-size: x-large">填写回复 
        <br />
        </span></strong>
    <br/>
        <asp:TextBox ID="TextBox1" runat="server" Height="100px" TextMode="MultiLine" 
            Width="500px"></asp:TextBox>
        <br />
        <br/>
        <asp:Button ID="Button1" runat="server" Text="取 消" onclick="Button1_Click" />&nbsp;&nbsp; 
        <asp:Button ID="Button2" runat="server" Text="回 复" onclick="Button2_Click" />
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Content>

