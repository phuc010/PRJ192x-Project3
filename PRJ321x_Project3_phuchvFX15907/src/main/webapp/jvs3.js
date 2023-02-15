$(document).ready(function(){
    var login = document.getElementById("formLogin");
    var openLogin = document.getElementById("openLoginPage");
    var btnLogin = document.getElementById("btnLogin");
    var closeLogin = document.getElementById("close");
    //var close = document.getElementById("bntCancel")
    //var hidemenu = document.getElementById("barsicon")

    
    //function click open Login
    openLogin.onclick = function(){
        login.style.display = "block";
    };
    closeLogin.onclick = function(){
        login.style.display = "none"
    };
    btnLogin.onclick = function(){
        var username = $("#username").val();
        var password = $("#password").val();
        if (username =="" || password == "" ) {
            alert('Please enter Username and Password');
            return false;
        };
    };

})/**
 * 
 *//**
 * 
 */