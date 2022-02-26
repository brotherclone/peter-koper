import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "lastname", "form", "question", "warning" ]
    static classes = ["hide"]
    static values = {
        petersLastName: String
    }
    connect(){
        this.check()
    }
    check(){

        if (this.lastnameTarget.value.toLowerCase() === this.petersLastNameValue) {
            this.formTarget.classList.remove(this.hideClass)
            this.questionTarget.classList.add(this.hideClass)
            this.warningTarget.classList.add(this.hideClass)
        } else {
            if(this.lastnameTarget.value.length> 1){
                this.warningTarget.classList.remove(this.hideClass)
            }
            this.questionTarget.classList.remove(this.hideClass)
            this.formTarget.classList.add(this.hideClass)
        }
    }
}