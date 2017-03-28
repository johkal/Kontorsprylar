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
    <script>
        function PostThisShit()
        {
            $.post(window.location.href, { antal: $("#main_Antal").val(), action: $("#action").val() })
            .done(function () { alert("woohoo"); });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="detail" id="detail" runat="server">
    </div>
</asp:Content>
