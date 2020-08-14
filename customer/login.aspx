<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width:600px;" align="center" cellpadding="10px">
        <tr>
            <td colspan="2" style="font-weight: 700; font-size: x-large">
                登录</td>
        </tr>
        <tr>
            <td style="width: 100px">
                用户名：</td>
            <td>
                <asp:TextBox ID="username" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                密 码：</td>
            <td>
                <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                身 份：</td>
            <td>
                <asp:RadioButtonList ID="identity" runat="server" AutoPostBack="True" 
                    RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Selected="True">顾客</asp:ListItem>
                    <asp:ListItem>前台服务员</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="Button1" runat="server" Text="登 录" Height="39px" 
                    Width="104px" onclick="Button1_Click" />
&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">没有账号？立即注册！</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>

