<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionCommande.aspx.cs" Inherits="GestionStore.GestionCommande" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px;">
            </td>
        </tr>
        <tr>
            <td style="text-align:center; height: 20px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px">
                <asp:Label ID="Label1" runat="server" Text="Selectionnez des articles disponible:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <div class="text-center">
                    
                <asp:GridView ID="grdaffarticles" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ForeColor="#333333" GridLines="None" Height="398px" Width="1038px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns >
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Ref de l'article" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="nom_article" HeaderText="Nom de article" SortExpression="nom_article" />
                        <asp:BoundField DataField="prix_article" HeaderText="Prix de l'article" SortExpression="prix_article" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#666666" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT [Id], [nom_article], [prix_article] FROM [article]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM [article]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM [article]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT [Id], [nom_article], [prix_article] FROM [article]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px; text-align:center">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Commander!" style="height: 26px" />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Commandes associé a ce compte" />
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="er" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
    
</asp:Content>
