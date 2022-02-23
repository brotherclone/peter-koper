import { Controller } from "@hotwired/stimulus"

console.log("Resetter is here")

export default class extends Controller {
    test(){
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }
}