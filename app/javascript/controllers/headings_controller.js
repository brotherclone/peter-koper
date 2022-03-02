import { Controller } from "@hotwired/stimulus"
import lax from 'lax.js'

export default class extends Controller {
    static targets = [ "peter" ]
    connect(){
        lax.init();
        lax.addDriver('scrollY', function(){
            return window.scrollY;
        })
        lax.addElements('.peter-heading',{

            scrollY:{
                scale: [
                    ["elCenterY", "elOutY"],
                    [1, .6],   // Animation value map
                    {
                        inertia: 10        // Options
                    }
                ]
            }
        }, {
            onUpdate: function (driverValues, domElement) {
                const scrollY = driverValues.scrollY[0];
                const logo = document.getElementById("logo")
                if(Math.floor(scrollY) > Math.floor(domElement.offsetHeight)){
                    domElement.classList.add('retract')
                    logo.classList.add('retract')
                }else{
                    domElement.classList.remove('retract')
                    logo.classList.remove('retract')
                }
            }
        })
    }
}

