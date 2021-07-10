<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="GestionStore.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center" colspan="3">
                <strong>
                <asp:Label ID="Label1" runat="server" Text="Bienvenue sur notre site de gestion de store! Choisissez une option:" style="font-family: Arial; font-size: large; color: #993333"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px">
                &nbsp;</td>
            <td style="height: 20px; text-align:center ">
                <asp:Button ID="btnGcategories" runat="server" Text="Gestion catégories" OnClick="btnGcategories_Click" />
                <asp:Button ID="btnGarticles" runat="server" Text="Gestion d'articles" OnClick="btnGarticles_Click" />
            </td>
            <td style=" text-align:center; height: 20px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                &nbsp;</td>
            <td style="text-align:center">
                <asp:Button ID="btnGcommandes" runat="server" Text="Gestion de commandes" OnClick="btnGcommandes_Click" />
            </td>
            <td style="text-align:center">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="text-align:center">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td style="text-align:center">
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
