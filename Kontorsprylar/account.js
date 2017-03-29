/// <reference path="C:\Users\Administrator\Source\Repos\Kontorsprylar\Kontorsprylar\Scripts/jquery-1.9.1.js" />
/// <reference path="C:\Users\Administrator\Source\Repos\Kontorsprylar\Kontorsprylar\Scripts/jquery-1.9.1.intellisense.js" />

//$(document).ready(function() {
//    var email = $('#email').val();
//    var password = $('#pwd').val();
//    $.get('CheckLoggIn.aspx?email=' + email + '&pwd=' + password)
//    .done(function (data) {
//        alert(data + 'JIPPI!');
//    })
//    .fail(function () {
//        alert("Något gick superfel.. Eller så var det första gången du försökte?? Isf kanske allt gick bra ändå :)");
//    });
//});


function loggin() {
    var email = $('#email').val();
    var password = $('#pwd').val();
    $.get('CheckLoggIn.aspx?email=' + email + '&pwd=' + password)
    .done(function (data) {
        alert(data + 'JIPPI!');
    })
    .fail(function () {
        alert("Något gick superfel.. Eller så var det första gången du försökte?? Isf kanske allt gick bra ändå :)");
    });
};

function addCust() {
    var fname = document.getElementById("fname").value;
    var lname = document.getElementById("lname").value;
    var mail = document.getElementById("mail").value;
    var passw = document.getElementById("passw").value;
    var phone = document.getElementById("phone").value;
    var address = document.getElementById("address").value;
    var floor = document.getElementById("floor").value;
    var portcode = document.getElementById("portcode").value;
    var city = document.getElementById("city").value;
    var zip = document.getElementById("zip").value;

    $.get('AddCustomer.aspx?fname=' + fname + '&lname=' + lname + '&mail=' + mail + '&passw=' + passw + '&phone=' + phone + '&address=' + address + '&floor=' + floor + '&portcode=' + portcode + '&city=' + city + '&zip=' + zip)
    .done(function (data) {
        alert(data + 'Jippi!');
    })
    .fail(function () {
        alert("Något gick superfel.. Eller så var det första gången du försökte?? Isf kanske allt gick bra ändå :)");
    });
};
