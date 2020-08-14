<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="homepage.aspx.cs" Inherits="customer_homepage" %>

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
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br/><br/><asp:Image ID="Image1"
        runat="server" Width="100%" />
</asp:Content>

