<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Kontorsprylar.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1>Varukorg</h1>
    <div id="showCart" runat="server"></div>
    <asp:Button Text="Gå till kassan" runat="server" CssClass="button" />
</asp:Content>
