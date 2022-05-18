import { Controller } from "@hotwired/stimulus"
import imageLoading from "../packs/image-loading";
import tinyInit from "../packs/tinyInit";

export default class extends Controller {
    static targets = [ "lastname", "form", "question", "warning"]
    static classes = ["hide", "touched"]
    static values = {
        petersLastName: String,
        isTestEnv: Boolean
    }
    connect(){
        imageLoading();
        tinyInit();
        if (!this.isTestEnvValue){
            this.cookieCheck()
        }
    }

    cookieCheck(){
        let peterCheckCookie = this.getCookie("peter")
        if(peterCheckCookie === this.petersLastNameValue){
            this.formTarget.classList.remove(this.hideClass)
            this.questionTarget.classList.add(this.hideClass)
            this.warningTarget.classList.add(this.hideClass)
        }
    }

    check(){
        if (this.lastnameTarget.value.toLowerCase() === this.petersLastNameValue) {
            this.formTarget.classList.remove(this.hideClass)
            this.questionTarget.classList.add(this.hideClass)
            this.warningTarget.classList.add(this.hideClass)
            document.cookie = "peter="+this.petersLastNameValue;
        } else {
            if(this.lastnameTarget.value.length>=1){
                this.lastnameTarget.classList.remove(this.touchedClass)
                this.warningTarget.classList.remove(this.hideClass)
            }
            this.questionTarget.classList.remove(this.hideClass)
            this.formTarget.classList.add(this.hideClass)
        }
    }

    getCookie(cookieName){
        let desiredCookie = cookieName + "="
        let cookies = decodeURIComponent(document.cookie)
        cookies = cookies.split(';')
        for(let i=0; i<cookies.length; i++){
            let aCookie = cookies[i]
            while (aCookie.charAt(0) ===''){
                aCookie = aCookie.substr(1)
            }
            if (aCookie.indexOf(desiredCookie) === 0){
                return aCookie.substring(desiredCookie.length, aCookie.length)
            }
        }
        return ""
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