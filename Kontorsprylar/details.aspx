<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="Kontorsprylar.details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 481px;
        }

        .auto-style2 {
            width: 4px;
        }

        .auto-style3 {
            width: 960px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="detail" id="detail" runat="server">
        <h1>Namn på produkt</h1>
        <table class="nav-justified">
            <tr>
                <td class="auto-style1">
                    <img ID="detailsImg" src="img/KAB-logo.png" alt="img/KAB-logo.png"/>
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3"><h2>Pris</h2>
                    <asp:TextBox ID="Antal" runat="server" Height="38px" Width="124px"></asp:TextBox>
                    <asp:Button class="button" ID="Add" runat="server" Height="38px" Text="Lägg i varukorg" Width="120px" />
                    <br />
                    <p>Varor kvar i lager</p></td>
            </tr>
            <tr>
                <td class="auto-style1">
                   <p>Produktbeskrivning</p></td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
