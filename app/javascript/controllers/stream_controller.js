import { Controller } from "@hotwired/stimulus"
import lax from 'lax.js'
import imageLoading from "../packs/image-loading";

export default class extends Controller {

    static targets =[]

    connect() {
        imageLoading();
        lax.init();
        lax.addDriver('scrollY', function () {
            return window.scrollY;
        })
    }

    rescroll(){
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }

}
