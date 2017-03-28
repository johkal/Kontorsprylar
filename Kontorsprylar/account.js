/// <reference path="C:\Users\Administrator\Source\Repos\Kontorsprylar\Kontorsprylar\Scripts/jquery-1.9.1.js" />
/// <reference path="C:\Users\Administrator\Source\Repos\Kontorsprylar\Kontorsprylar\Scripts/jquery-1.9.1.intellisense.js" />


function loggin() {
    var email = $('#email').val();
    var password = $('#pwd').val();
    $.get('CheckLoggIn.aspx?email=' + email + '&pwd=' + password)
    .done(function (data) {
        alert(data + 'JIPPI!');
    })
    .fail(function () {
        alert("Något gick superfel.. Försök igen!");
    });
};
