/// <reference path="C:\Users\Administrator\Source\Repos\Kontorsprylar\Kontorsprylar\Scripts/jquery-1.9.1.js" />
/// <reference path="C:\Users\Administrator\Source\Repos\Kontorsprylar\Kontorsprylar\Scripts/jquery-1.9.1.intellisense.js" />


function loggin() {
    var email = $('#email').val();
    var pwd = $('#pwd').val();
    //alert("Loggin metod anropad!");

    //$.get('CheckLogIn.aspx?email=' + email + '&pwd=' + pwd)
    //.done(function (data) {
    //    alert(data)
    //});

    //$.getJSON('http://localhost:60227/CheckLogIn.aspx?email=kalle').done(function (data) { alert("hej") });

    $.post("CheckLoggIn.aspx",
        { name: "Donald Duck", city: "Duckburg" },
        function (data, status) {
            alert("Data: " + data + "\nStatus: " + status);
        });

}





