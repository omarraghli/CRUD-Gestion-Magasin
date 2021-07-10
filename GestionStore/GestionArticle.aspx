<%@ Page validateRequest="false" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionArticle.aspx.cs" Inherits="GestionStore.GestionArticle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td style="width: 547px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center; width: 547px;">
                <asp:Label ID="Label4" runat="server" Text="Ajoutez un nouveau article!"></asp:Label>
            </td>
            <td rowspan="12" style="text-align:center" >
                <asp:GridView ID="grdarticle" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="grdarticle_SelectedIndexChanged" Height="353px" Width="764px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Numéro de l'article" InsertVisible="False" ReadOnly="True" SortExpression="Id" >
                        </asp:BoundField>
                        <asp:BoundField DataField="categorie_id" HeaderText="Numéro du catégorie" SortExpression="categorie_id" >
                        </asp:BoundField>
                        <asp:BoundField DataField="nom_article" HeaderText="Nom de l'article" SortExpression="nom_article" >
                        </asp:BoundField>
                        <asp:BoundField DataField="prix_article" HeaderText="Prix de l'article" SortExpression="prix_article" >
                        </asp:BoundField>
                        <asp:BoundField DataField="id_admin" HeaderText="Numéro Admin responsable sur la dernierre modification" SortExpression="id_admin" />
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM [article]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM [article]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM [article]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align:center; width: 547px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center; width: 547px;">
                <asp:Label ID="Label1" runat="server" Text="Nom article"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center; width: 547px;">
                <asp:TextBox ID="txtnomarticle" runat="server" Width="270px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 547px">&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px; width: 547px;">
                <asp:Label ID="Label2" runat="server" Text="Prix article"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center; height: 22px; width: 547px;">
                <asp:TextBox ID="txtprixarticle" runat="server" Width="270px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 547px">&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px; width: 547px;">
                <asp:Label ID="Label3" runat="server" Text="Catégorie"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center; width: 547px; height: 23px;">
                <asp:DropDownList ID="ddlcategorie" runat="server" Height="26px" OnSelectedIndexChanged="ddlcategorie_SelectedIndexChanged" Width="151px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 547px">&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center; width: 547px;">
                <asp:Button ID="btnaarticle" runat="server" OnClick="btnaarticle_Click" Text="Ajouter" Width="146px" />
                <asp:Button ID="btnearticle" runat="server" OnClick="btnearticle_Click" Text="Modifier" Width="148px" />
                <asp:Button ID="btndarticle" runat="server" OnClick="btndarticle_Click" Text="Supprimer" Width="146px" />
            </td>
        </tr>
        <tr>
            <td style="text-align:center; width: 547px;">
                <asp:Label ID="m" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Label ID="identifiant" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
