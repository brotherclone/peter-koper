import { Controller } from "@hotwired/stimulus"
import imageLoading from "../packs/image-loading";
import tinyInit from "../packs/tinyInit";

export default class extends Controller {
    static targets = [ "lastname", "form", "question", "warning" ]
    static classes = ["hide", "touched"]
    static values = {
        petersLastName: String
    }
    connect(){
        imageLoading();
        tinyInit();
    }
    check(){
        if (this.lastnameTarget.value.toLowerCase() === this.petersLastNameValue) {
            this.formTarget.classList.remove(this.hideClass)
            this.questionTarget.classList.add(this.hideClass)
            this.warningTarget.classList.add(this.hideClass)
        } else {
            if(this.lastnameTarget.value.length>=1){
                this.lastnameTarget.classList.remove(this.touchedClass)
                this.warningTarget.classList.remove(this.hideClass)
            }
            this.questionTarget.classList.remove(this.hideClass)
            this.formTarget.classList.add(this.hideClass)
        }
    }

    checkKey(event){
        if(event.keyCode){
            if(event.keyCode === 13){
                event.preventDefault();
                this.check()
            }
        }
    }
}