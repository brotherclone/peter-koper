import { Controller } from "@hotwired/stimulus"
import cloudinary from 'cloudinary-core'
import MicroModal from 'micromodal'

export default class extends Controller {

    static targets = ["videoPlayerId", "documentReplaceId", "videoFileId", "apis", "pdf"]

    connect() {
        MicroModal.init();
    }

    showplyr(){
        let videoPlayerId = this.videoPlayerIdTarget.dataset.videplayerid;
        let videoFile = this.videoFileIdTarget.dataset["videofileid"];
        let cloudName = this.apisTarget.dataset.cloud;
        let cld = cloudinary.Cloudinary.new({ cloud_name: cloudName })
        document.player = cld.videoPlayer(videoPlayerId)
        document.player.source(videoFile).play();
    }

    hideplyr(){
        document.player.stop();
    }

    showrdr(){
        const viewerOptions = {
            embedMode: "IN_LINE",
            defaultViewMode: "FIT_PAGE",
            showDownloadPDF: false,
            showPrintPDF: false,
            showLeftHandPanel: true,
            showAnnotationTools: true
        };
        let clientID =  this.apisTarget.dataset.clientid;
        let pdfUrl = this.pdfTarget.dataset.pdfurl;
        let pdfFile = this.pdfTarget.dataset.pdffile;
        let pdfView = this.pdfTarget.dataset.pdfview;
        let adobeDCView = new AdobeDC.View({
            clientId: clientID,
            divId: pdfView,
        });
        console.log(pdfUrl,pdfFile);
        adobeDCView.previewFile(
            {
                content: { promise: this.load() },
                metaData: { fileName: pdfFile}
            },viewerOptions);
    }

    load(){
        return new Promise((resolve) => {
            fetch( this.pdfTarget.dataset.pdfurl)
                .then((resolve) => resolve.blob())
                .then((blob)=>{
                    resolve(blob.arrayBuffer())
                })
        })

    }

    hiderdr(){
        console.log("hiderdr")
    }

}