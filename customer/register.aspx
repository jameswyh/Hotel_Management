<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width:600px;" align="center" cellpadding="10px">
        <tr>
            <td colspan="2" style="font-weight: 700; font-size: x-large">
                新用户注册</td>
        </tr>
        <tr>
            <td style="width: 100px">
                用户名：</td>
            <td>
                <asp:TextBox ID="username" runat="server" AutoPostBack="True"> </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="username" Display="Dynamic" ErrorMessage="请输入用户名"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ControlToValidate="username" Display="Dynamic" 
                    onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                密 码：</td>
            <td>
                <asp:TextBox ID="password1" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="password1" Display="Dynamic" ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                确认密码：</td>
            <td>
                <asp:TextBox ID="password2" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="password1" ControlToValidate="password2" Display="Dynamic" 
                    ErrorMessage="两次输入不一致，请重新输入"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                Email:</td>
            <td>
                <asp:TextBox ID="email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="email" Display="Dynamic" ErrorMessage="请输入Email"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="email" Display="Dynamic" ErrorMessage="Email格式错误" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                验证码:</td>
            <td>
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                <asp:Image ID="Image1" runat="server" src="checkcode.aspx"/>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="Button1" runat="server" Text="注 册" Height="39px" 
                    Width="104px" onclick="Button1_Click" />
&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" onclick="LinkButton1_Click">已有账号？立即登录！</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>

