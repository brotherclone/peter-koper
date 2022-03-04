import { Controller } from "@hotwired/stimulus"
import lax from 'lax.js'

export default class extends Controller {

    static targets =["id", "url"]

    //ToDo: combine so there's only one driver when experimentation is over.
    connect() {
        lax.init();
        lax.addDriver('scrollY', function () {
            return window.scrollY;
        })

        lax.addElements('.memory-container',{
            scrollY:{
                scale: [
                    ["elInY","elCenterY", "elOutY"],
                    [0.85, 1, 0.85],   // Animation value map
                    {
                        inertia: 20        // Options
                    }
                ]
            }
        })
    }
}