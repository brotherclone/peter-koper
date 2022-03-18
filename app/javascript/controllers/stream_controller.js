import { Controller } from "@hotwired/stimulus"
import lax from 'lax.js'
import imageLoading from "../packs/image-loading";

export default class extends Controller {

    connect() {
        imageLoading();
        lax.init();
        lax.addDriver('scrollY', function () {
            return window.scrollY;
        })
        lax.addElements('.memory-container',{
            scrollY:{
                scale: [
                    ["elInY","elCenterY", "elOutY"],
                    [0.85, 1, 0.85],
                    {
                        inertia: 20
                    }
                ]
            }
        })
    }

}
