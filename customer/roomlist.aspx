<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="roomlist.aspx.cs" Inherits="customer_roomlist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
     <div style="text-align:center;">
    <center>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:Panel ID="Panel3" runat="server" style="padding:10px;">
        入住：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;退房：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        &nbsp;人数：<asp:DropDownList ID="DropDownList1" runat="server" 
            AutoPostBack="True">
            <asp:ListItem Selected="True" Value="1">1人</asp:ListItem>
            <asp:ListItem Value="2">2人</asp:ListItem>
            <asp:ListItem Value="3">3人</asp:ListItem>
            <asp:ListItem Value="4">4人</asp:ListItem>
        </asp:DropDownList>
         &nbsp;价格：<asp:DropDownList ID="DropDownList2" runat="server" 
            AutoPostBack="True">
            <asp:ListItem Selected="True" Value="不限">不限</asp:ListItem>
            <asp:ListItem Value="300以下">300以下</asp:ListItem>
            <asp:ListItem Value="300~600">300~600</asp:ListItem>
            <asp:ListItem Value="600~900">600~900</asp:ListItem>
            <asp:ListItem Value="900以上">900以上</asp:ListItem>
        </asp:DropDownList>
        &nbsp;关键字：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="Button1"
            runat="server" Text="搜索" onclick="Button1_Click" /> 
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
            onselectionchanged="Calendar1_SelectionChanged" Width="200px" 
            ondayrender="Calendar1_DayRender">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>
        <asp:Calendar ID="Calendar2" runat="server" BackColor="White" 
            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
            onselectionchanged="Calendar2_SelectionChanged" Width="200px" 
            ondayrender="Calendar2_DayRender">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>
        <ajaxToolkit:HoverMenuExtender ID="HoverMenuExtender3" runat="server" TargetControlID="TextBox1"
               PopupControlID="Calendar1" PopupPosition="Bottom">            
        </ajaxToolkit:HoverMenuExtender>
        <ajaxToolkit:HoverMenuExtender ID="HoverMenuExtender4" runat="server" TargetControlID="TextBox2"
               PopupControlID="Calendar2" PopupPosition="Bottom">
        </ajaxToolkit:HoverMenuExtender>           
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" AutoGenerateColumns="False" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="房型">
                <ItemTemplate>
                    <asp:Image runat="server" ID="picimage1" style="width:50px;height:50px;">
                    </asp:Image>
                     <ajaxToolkit:HoverMenuExtender ID="HoverMenuExtender1" runat="server" TargetControlID="picimage1"
                             PopupControlID="Panel1" PopupPosition="Right">
                    </ajaxToolkit:HoverMenuExtender>
                    <asp:Panel ID="Panel1" runat="server">
                    <asp:Image ID="Image1" runat="server"  style="height:225px;width:300px" BorderWidth="3px" BorderStyle="Double" />
                    </asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
             <ItemTemplate>
             <asp:Label ID="Label1" runat="server" Text="房型" Width="70px"></asp:Label>
             <ajaxToolkit:HoverMenuExtender ID="HoverMenuExtender2" runat="server" TargetControlID="Label1"
                             PopupControlID="Panel2" PopupPosition="Right">
                    </ajaxToolkit:HoverMenuExtender>
                <asp:Panel ID="panel2" runat="server" style="height:200px;width:600px;padding:20px;" BorderWidth="3px" BorderStyle="Solid" BorderColor="#999999" BackColor="White">
                    <div style="margin-bottom:20px;">
                        <asp:Label ID="Label2" runat="server" Text="房型" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                    <br/>
                    </div>
                    <div style="margin-bottom:20px;">
                        <asp:Label ID="Label3" runat="server" Text="便利设施："></asp:Label>
                    <br/>
                    </div>
                    <asp:Label ID="Label4" runat="server" Text="浴室："></asp:Label>
                </asp:Panel>
                 </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="rtarea" HeaderText="面积">
            <ItemStyle HorizontalAlign="Center" Width="150px" Wrap="True" />
            </asp:BoundField>
            <asp:BoundField DataField="rtpeople" HeaderText="入住人数">
            <ItemStyle HorizontalAlign="Center" Width="150px" Wrap="True" />
            </asp:BoundField>
            <asp:BoundField DataField="rtnet" HeaderText="宽带">
            <ItemStyle HorizontalAlign="Center" Width="150px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="退房政策">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text="退房期限"></asp:Label>
                </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="房量">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text="数量"></asp:Label>
                </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="150px" />
            </asp:TemplateField>
            <asp:BoundField DataField="rtprice" HeaderText="单价/晚">
            <ItemStyle HorizontalAlign="Center" Width="150px" />
            </asp:BoundField>
            
            <asp:CommandField ButtonType="Button" SelectText="预订" 
                ShowSelectButton="True" />
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
        </center>
    </div>
</asp:Content>

