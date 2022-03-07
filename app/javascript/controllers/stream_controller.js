import { Controller } from "@hotwired/stimulus"
import lax from 'lax.js'
import imageLoading from "../packs/image-loading";

export default class extends Controller {

    static targets =["id", "url", "peter"]

    connect() {
        imageLoading();
        lax.init();
        lax.addDriver('scrollY', function () {
            return window.scrollY;
        })
        lax.addElements('.memory-container',{
            scrollY:{
                scale: [
                    ["elInY","elCenterY", "elOutY"],
                    [0.85, 1, 0.85],
                    {
                        inertia: 20
                    }
                ],
                opacity: [
                    ["elInY","elCenterY", "elOutY"],
                    [1, 1, 0],
                    {
                        inertia: 10
                    }
                ]
            }
        })
        lax.addElements('.peter-heading',{
            scrollY:{
                scale: [
                    ["elCenterY", "elOutY"],
                    [1, .6],
                    {
                        inertia: 10
                    }
                ]
            }
        }, {
            onUpdate: function (driverValues, domElement) {
                const scrollY = driverValues.scrollY[0];
                const logo = document.getElementById("logo")
                if(Math.floor(scrollY) > Math.floor(domElement.offsetHeight)){
                    domElement.classList.add('retract')
                    logo.classList.add('retract')
                }else{
                    domElement.classList.remove('retract')
                    logo.classList.remove('retract')
                }
            }
        })
    }
    set(){
        let id = this.idTarget.id;
        id = id.split("_");
        id = id[1];
        if(this.urlTarget.dataset.url && id){
            const url = this.urlTarget.dataset.url
            let csrfToken = document.head.querySelector("[name='csrf-token']")
            csrfToken = csrfToken["content"]
            const headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/html',
                'X-CSRF-Token': csrfToken
            }
            const body = JSON.stringify({viewing: id})

            // ToDo: Pass in ref
            fetch(url, {
                method: 'POST',
                body: body,
                headers: headers
            }) .then(response => response.text())
                .then(html => document.getElementById("stream_nav").innerHTML = html)
        }

    }
    rescroll(){
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }
}
