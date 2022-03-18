import { Controller } from "@hotwired/stimulus"
import lax from 'lax.js'
import imageLoading from "../packs/image-loading";

export default class extends Controller {

    static tags = [ "peter", "logo", "help"]

    // Peter's image starts 50/50 with logo
    // Logo shrinks and fixes position

    connect() {
        imageLoading();
        lax.init();
        lax.addDriver('scrollY', function () {
            return window.scrollY;
        })
    }
}