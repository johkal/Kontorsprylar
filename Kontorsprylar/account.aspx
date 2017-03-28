<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="Kontorsprylar.account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <nav>
        <div class="container">
            <h2>Logga in</h2>
            <form class="form-inline">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" placeholder="e-mail">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Password">
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox">Kom ihåg mig</label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
    </nav>
    <h2>Skapa konto</h2>
    <div class="col-xs-4">
        <label for="ex3">Förnamn</label>
        <input class="form-control" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Efternamn</label>
        <input class="form-control" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">e-mail</label>
        <input class="form-control" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Password</label>
        <input class="form-control" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Telefon</label>
        <input class="form-control" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Adress</label>
        <input class="form-control" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Våning</label>
        <input class="form-control" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Portkod</label>
        <input class="form-control" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Postort</label>
        <input class="form-control" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Postnummer</label>
        <input class="form-control" type="text">
    </div>

</asp:Content>
