import { Controller } from "@hotwired/stimulus"
import htmlpdfviewer from "html-pdf-viewer";
import cloudinary from 'cloudinary-core'
import MicroModal from 'micromodal'

export default class extends Controller {



    connect() {
        MicroModal.init();
        console.log("connect");
        // const html = document.getElementById('html');
        // htmlpdfviewer(html, { output: { mode: 'display', container: '#iframeId', height: 800 } });
    }

    set(){
        console.log("set")
    }

    showplyr(){
        // console.log("video id", this.videoPlayerInfoTarget.dataset.videoId)
        // console.log("video file id", this.videoPlayerInfoTarget.dataset.videoFileId)
        // console.log("modal id", this.videoPlayerInfoTarget.dataset.modalId)
        // let videoPlayerId = "video_player_"+this.videoPlayerInfoTarget.dataset.videoId;
        // let cld = cloudinary.Cloudinary.new({ cloud_name: 'hodsx14x9' })
        // document.player = cld.videoPlayer(videoPlayerId)
        // document.player.source(this.videoPlayerInfoTarget.dataset.videoFileId).play();
    }
}