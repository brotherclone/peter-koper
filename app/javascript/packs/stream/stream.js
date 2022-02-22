import lax from 'lax.js'

window.onload = function(){
    lax.init();
    lax.addDriver('scrollY', function () {
        return window.scrollY
    })
}
