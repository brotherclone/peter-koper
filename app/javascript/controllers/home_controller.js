import { Controller } from "@hotwired/stimulus"
import lax from 'lax.js'
import imageLoading from "./../packs/image-loading"

export default class extends Controller {

    static tags = [ "peter", "logo", "help"]

    // Peter's image starts 50/50 with logo
    // Logo shrinks and fixes position

    connect() {
        imageLoading();
        lax.init();
        console.log("home controller connected, lax init")
        lax.addDriver('scrollY', function () {
            return window.scrollY;
        })
        lax.addElements("#peterHome",{
            scrollY:{
                scale: [
                    [0, "elOutY"],
                    [1, 0.5],
                    {
                        inertia: 100
                    }
                ]
            }
        })
        lax.addElements("#logoHome",{
            scrollY:{
                scale: [
                    ["elInY","elCenterY", "elOutY"],
                    [1, 1.2, 1],
                    {
                        inertia: 100
                    }
                ]
            }
        })
        lax.addElements("#scrollHelp",{
            scrollY:{
                opacity: [
                    [0, "elOutY"],
                    [1, 0],
                    {
                        inertia: 20
                    }
                ]
            }
        })
    }
}