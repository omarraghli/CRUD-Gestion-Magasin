<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="GestionStore.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td style="text-align:center">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="Label1" runat="server" Text="se connecter en tant qu'un admin"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px;" style="height: 20px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="adminemail" runat="server" Text="Email:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:TextBox ID="txtadminemail" runat="server" Width="355px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="adminpwd" runat="server" Text="Mot de passe:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center" style="height: 22px">
                <asp:TextBox ID="txtadminpwd" runat="server" style="margin-left: 0" Width="355px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:center" style="height: 20px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Button ID="btnco" runat="server" Text="Se connecter " Width="218px" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="errormessage" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
