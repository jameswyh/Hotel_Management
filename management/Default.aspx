<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1">
        <DataBindings>
            <asp:TreeNodeBinding DataMember="Root" TextField="Name" />
            <asp:TreeNodeBinding DataMember="Detail" TextField="Item" />
            <asp:TreeNodeBinding DataMember="Option" TextField="Text" />
        </DataBindings>
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" SiteMapProvider="Web1SiteMap"/>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XMLFile.xml">
    </asp:XmlDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br/><br/><asp:Image ID="Image1"
        runat="server" Width="100%" />
</asp:Content>

