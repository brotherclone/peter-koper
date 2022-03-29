import {Controller} from "@hotwired/stimulus";
import MicroModal from 'micromodal'
export default class extends Controller {
    connect(){
        MicroModal.init();
    }
    show(){
        MicroModal.show('mobileMenu')
        document.getElementById("flanuerBody").classList.add("modal-open")
    }
    hide(){
        MicroModal.close('mobileMenu')
        document.getElementById("flanuerBody").classList.remove("modal-open")
    }
}