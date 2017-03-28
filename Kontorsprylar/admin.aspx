<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Kontorsprylar.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <div id="adminMenu" class="adminMenu" runat="server">
        <asp:Button ID="ButtonAdd" runat="server" Text="Lägg till produkt" />
    </div>

    <div id="addProduct" class="addProduct" runat="server">
        <h3>Lägg till produkt</h3>
        <p>Produktnamn*: <asp:TextBox ID="TextBoxProductName" runat="server"></asp:TextBox>
        <p>Artikelnummer*: <asp:TextBox ID="TextBoxProductNumber" runat="server"></asp:TextBox></p>
        <p>Lagersaldo*: <asp:TextBox ID="TextBoxNrInStock" runat="server"></asp:TextBox></p>
        <p>Nettopris*: <asp:TextBox ID="TextBoxNetPrice" runat="server"></asp:TextBox></p>
        <p>Momssats*: <asp:DropDownList ID="DropDownListVAT" runat="server"></asp:DropDownList></p>
        <p>Kategori*: <asp:DropDownList ID="DropDownListCategory" runat="server"></asp:DropDownList></p>

        <p>Beskrivning: <asp:TextBox ID="TextBoxProductDescription" runat="server" TextMode="MultiLine"></asp:TextBox></p>
        <p>Bild: <asp:FileUpload ID="FileUploadImage" runat="server" /></p>
        <asp:Button ID="ButtonSubmit" runat="server" Text="Lägg till" OnClick="ButtonSubmit_Click" />
        <asp:Label ID="LabelSubmit" runat="server" Text="Alla fält märkta med asterisk * måste fyllas i."></asp:Label>
    </div>
</asp:Content>
