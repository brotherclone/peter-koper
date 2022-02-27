import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    test(){
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }
}