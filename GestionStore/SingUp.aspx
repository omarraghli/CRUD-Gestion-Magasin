<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SingUp.aspx.cs" Inherits="GestionStore.SingUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px;">
                <asp:Label ID="lblnom" runat="server" Text="Nom:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:TextBox ID="txtnom" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px;">
                <asp:Label ID="lblprenom" runat="server" Text="Prénom:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:TextBox ID="txtprenom" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px;">
                <asp:Label ID="lblemail" runat="server" Text="Email:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:TextBox ID="txtemail" runat="server" Width="401px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="lbldob" runat="server" Text="Date de naissance:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:TextBox ID="txtdob" runat="server" Width="400px" type="date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px;">
                <asp:Label ID="lblmdp" runat="server" Text="Mot de passe:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:TextBox ID="txtmdp" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="msgError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Button ID="btninscire" runat="server" Text="S'inscrire" OnClick="btninscire_Click" Width="147px" />
            </td>
        </tr>
    </table>
</asp:Content>
