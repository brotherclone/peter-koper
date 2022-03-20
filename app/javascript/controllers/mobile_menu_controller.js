import {Controller} from "@hotwired/stimulus";
import MicroModal from 'micromodal'
export default class extends Controller {
    connect(){
        MicroModal.init();
        console.log("mobile connect")
    }
    show(){
        console.log("mobile show")
        document.getElementById("flanuerBody").classList.add("modal-open")
    }
    hide(){
        console.log("mobile hide")
        document.getElementById("flanuerBody").classList.remove("modal-open")
    }
}