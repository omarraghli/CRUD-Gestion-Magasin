<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionCategorie.aspx.cs" Inherits="GestionStore.GestionCategorie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
            <td rowspan="8">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="categorie_id" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="324px" Width="523px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="categorie_id" HeaderText="Numéro catégorie" InsertVisible="False" ReadOnly="True" SortExpression="categorie_id" />
                        <asp:BoundField DataField="nom_categorie" HeaderText="Nom du catégorie" SortExpression="nom_categorie" />
                        <asp:BoundField DataField="admin_id" HeaderText="Numéro Admin responsable sur la dernierre modification" SortExpression="admin_id" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM [categorie]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT [categorie_id], [nom_categorie] FROM [categorie]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM [categorie]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="Label1" runat="server" Text="Ajoutez une nouvelle catégorie!"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px;">
                <asp:Label ID="Label2" runat="server" Text="Nom catégorie:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 22px; text-align:center">
                <asp:TextBox ID="txtcat" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px; text-align:center">
                <asp:Label ID="msger" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center; height: 26px">
                <asp:Button ID="btncat" runat="server" Text="Ajouter" OnClick="btncat_Click" Width="170px" />
                <asp:Button ID="btnmodif" runat="server" OnClick="Button1_Click" Text="Modifier" Width="170px" />
                <asp:Button ID="btnsupp" runat="server" OnClick="btnsupp_Click" Text="Supprimer" Width="170px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblidentify" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
