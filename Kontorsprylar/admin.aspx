<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Kontorsprylar.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <div id="adminMenu" class="adminMenu" runat="server">
        <input type="button" onclick="" value="Lägg till produkt" />
    </div>

    <div id="addProduct" class="addProduct" runat="server">
        <p>Produktnamn: <asp:TextBox ID="TextBoxProductName" runat="server"></asp:TextBox>
        <p>Artikelnummer: <asp:TextBox ID="TextBoxProductNumber" runat="server"></asp:TextBox></p>
        <p>Lagersaldo: <asp:TextBox ID="TextBoxNrInStock" runat="server"></asp:TextBox></p>
        <p>Nettopris: <asp:TextBox ID="TextBoxNetPrice" runat="server"></asp:TextBox></p>
        <p>Momssats: <asp:DropDownList ID="DropDownListVAT" runat="server"></asp:DropDownList></p>
        <p>Kategori: <asp:DropDownList ID="DropDownListCategory" runat="server"></asp:DropDownList></p>

        <p>Beskrivning: <asp:TextBox ID="TextBoxProductDescription" runat="server" TextMode="MultiLine"></asp:TextBox></p>
        <p>Bild: <asp:FileUpload ID="FileUploadImage" runat="server" /></p>
        <asp:Button ID="ButtonSubmit" runat="server" Text="Button" />
    </div>
</asp:Content>
