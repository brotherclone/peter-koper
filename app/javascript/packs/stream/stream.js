import lax from 'lax.js'

window.onload = function(){
    lax.init();

    lax.addDriver('scrollY', function () {
        console.log("Lax scroll = ", window.scrollY);
        return window.scrollY
    })

}
