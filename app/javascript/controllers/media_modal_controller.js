import { Controller } from "@hotwired/stimulus"
import cloudinary from 'cloudinary-core'
import MicroModal from 'micromodal'

export default class extends Controller {

    static targets = ["videoPlayerId", "documentReplaceId", "videoFileId", "apis", "pdf", "videoModalOpen", "documentModalOpen"]

    connect() {
        MicroModal.init();
    }

    showplyr(){
        let videoPlayerId = this.videoPlayerIdTarget.dataset.videplayerid
        let modal = this.videoPlayerIdTarget.dataset.modal
        let videoFile = this.videoFileIdTarget.dataset["videofileid"]
        let cloudName = this.apisTarget.dataset.cloud
        let cld = cloudinary.Cloudinary.new({ cloud_name: cloudName })
        MicroModal.show(modal)
        document.player = cld.videoPlayer(videoPlayerId)
        document.player.source(videoFile).play()
        document.getElementById("flanuerBody").classList.add("modal-open")
    }

    hideplyr(){
        let modal = this.videoModalOpenTarget.dataset.modal
        document.player.stop();
        MicroModal.close(modal);
        document.player.dispose();
        document.getElementById("flanuerBody").classList.remove("modal-open")
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
        let clientID =  this.apisTarget.dataset.clientid
        let pdfUrl = this.pdfTarget.dataset.pdfurl
        let modal = this.pdfTarget.dataset.modal
        pdfUrl = pdfUrl.replace(/^http:\/\//i, 'https://')
        let pdfFile = this.pdfTarget.dataset.pdffile
        let pdfView = this.pdfTarget.dataset.pdfview
        let adobeDCView = new AdobeDC.View({
            clientId: clientID,
            divId: pdfView,
        });

        adobeDCView.previewFile(
            {
                content: { promise: this.load() },
                metaData: { fileName: pdfFile}
            },viewerOptions);
        MicroModal.show(modal);
        document.getElementById("flanuerBody").classList.add("modal-open")
    }

    load(){
        let pdfUrl = this.pdfTarget.dataset.pdfurl;
        pdfUrl = pdfUrl.replace(/^http:\/\//i, 'https://')
        return new Promise((resolve, reject) => {
            fetch(pdfUrl).then((response)=> {
                if(response.ok && response.status === 200){
                    return response
                }
            }).then((response) => response.blob())
            .then((blob)=>{
                if(blob){
                    resolve(blob.arrayBuffer())
                }else{
                    reject("Unable to resolve PDF loading.");
                }
            }).catch((error)=> {
                reject(error)
            })
        })
    }
    hiderdr(){
        let modal = this.documentModalOpenTarget.dataset.modal
        document.getElementById("flanuerBody").classList.remove("modal-open")
        MicroModal.hide(modal);
    }
}