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
        alert(email);
    });
};


//    .done(function (data) {
//        $("#LabelWhatever").text(data);
//    })
//    .fail(function () {
//        alert("Fail!")
//    });
//});

//function loggin() {
//    alert("HEJ");
//    var email = $('#email').val();
//    var pwd = $('#pwd').val();

//    $.post("CheckLoggIn.aspx",
//    { name: "Donald Duck", city: "Duckburg" },
//    function (data, status) {
//        alert("Data: " + data + "\nStatus: " + status);
//    });
//}