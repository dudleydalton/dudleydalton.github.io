<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Fill The Form Out To Register</h3>

        <asp:Label ID="Label1" runat="server" Text="Register Name"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" BorderColor="#0000CC"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Register Password"></asp:Label>
        <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" BorderColor="#0000CC"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" BorderColor="#0000CC" />

</asp:Content>

