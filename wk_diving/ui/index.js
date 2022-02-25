$(function(){

    window.addEventListener('message', function(event){
        var item = event.data;
        var hud = item.h;
        if (hud=="true") {
            document.getElementById('container').style.opacity = 1;
        } else {
            document.getElementById('container').style.opacity = 0;
        }
    })

});






