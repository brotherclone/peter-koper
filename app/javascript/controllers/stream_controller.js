import { Controller } from "@hotwired/stimulus"
import lax from 'lax.js'


export default class extends Controller {

    static targets =["id", "url"]

    //ToDo: combine so there's only one driver when experimentation is over.
    connect() {
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
                ]
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
}
