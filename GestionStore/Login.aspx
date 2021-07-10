<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GestionStore.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px;">
                <asp:Label ID="lble" runat="server" Text="Email"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:TextBox ID="txte" runat="server" style="margin-left: 0px" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="lblmotdepasse" runat="server" Text="Mot de passe"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:TextBox ID="txtmotdepasse" runat="server" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Button ID="btnconnecter" runat="server" Text="se connecter!" OnClick="btnconnecter_Click" Width="183px" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="err" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
