$(document).ready(function () { 
    var dm = document.getElementById("idmenu-btn");
    var aa = document.getElementById("aa");
    var menu = document.getElementById("menu");
    

    dm.onclick = function(){
        $(menu).toggleClass("active");
    }


})
