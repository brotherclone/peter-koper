import { Controller } from "@hotwired/stimulus"
import lax from 'lax.js'

export default class extends Controller {
    static targets =["id"]

    //ToDo: combine so there's only one driver when experimentation is over.
    connect() {
        lax.init();
        lax.addDriver('scrollY', function () {
            return window.scrollY;
        })
        let id = this.idTarget.id
        lax.addElements("#"+id,{

            scrollY:{
                opacity: [
                    ["elCenterY", "elOutY"],
                    [1, .6],   // Animation value map
                    {
                        inertia: 10        // Options
                    }
                ]
            }
        })

    }
}