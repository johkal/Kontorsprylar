<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="Kontorsprylar.account" %>

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
                <button id="login" type="submit" class="btn-loggin" onclick="loggin()">Log In</button>
            </form>
        </div>
    </nav>
    <h2>Skapa konto</h2>
    <div class="col-xs-4">
        <label for="ex3">Förnamn</label>
        <input class="form-control" id="fname" type="text" placeholder="Obligatorisk">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Efternamn</label>
        <input class="form-control" id="lname" type="text" placeholder="Obligatorisk">
    </div>
    <div class="col-xs-4">
        <label for="ex3">e-mail</label>
        <input class="form-control" id="mail" type="text" placeholder="Obligatorisk">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Password</label>
        <input class="form-control" id="passw" type="text" placeholder="Obligatorisk">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Telefon</label>
        <input class="form-control" id="phone" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Adress</label>
        <input class="form-control" id="address" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Våning</label>
        <input class="form-control" id="floor" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Portkod</label>
        <input class="form-control" id="portcode" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Postort</label>
        <input class="form-control" id="city" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Postnummer</label>
        <input class="form-control" id="zip" type="text">
    </div>
    <div class="col-xs-4">
        <label for="ex3">Skapa konto</label>
        <br />
        <button type="button" class="btnOK" id="addCust" onclick="addCust()">Ok</button>
    </div>


</asp:Content>
