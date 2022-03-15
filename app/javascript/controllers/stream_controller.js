import { Controller } from "@hotwired/stimulus"
import 'dotenv/config'
import lax from 'lax.js'
import imageLoading from "../packs/image-loading";
import cloudinary from 'cloudinary-core'
import MicroModal from 'micromodal'

export default class extends Controller {

    static targets =["id", "url", "peter", "videoPlayerInfo"]

    connect() {
        imageLoading();
        MicroModal.init();
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
            // ToDo: Move to side? Remove?
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
        // ToDo: This should go to sub-nav/mobile nav
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }

    showplyr(){
        console.log("video id", this.videoPlayerInfoTarget.dataset.videoId)
        console.log("video file id", this.videoPlayerInfoTarget.dataset.videoFileId)
        console.log("modal id", this.videoPlayerInfoTarget.dataset.modalId)
        let videoPlayerId = "video_player_"+this.videoPlayerInfoTarget.dataset.videoId;
        let cld = cloudinary.Cloudinary.new({ cloud_name: 'hodsx14x9' })
        document.player = cld.videoPlayer(videoPlayerId)
        document.player.source(this.videoPlayerInfoTarget.dataset.videoFileId).play();
    }

    hideplyr(){
        document.player.stop();
    }

    showvwr(){
        console.log("show")
    }

    hidevwr(){
        console.log("hide")
    }

}
