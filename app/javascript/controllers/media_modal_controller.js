import { Controller } from "@hotwired/stimulus"
import MicroModal from 'micromodal'

export default class extends Controller {

    static targets = ["memory", "mediaModal"]

    connect(){
        MicroModal.init();
    }

    openModal(modal){
        document.getElementById("flanuerBody").classList.add("modal-open")
        MicroModal.show(modal)
    }


    showplyr(){
        let modal = this.memoryTarget.dataset.modal
        this.openModal(modal)
        let videoPlayerId = this.memoryTarget.dataset.videoplayerid
        let videoFile = this.memoryTarget.dataset.videofileid
    }

    hideplyr(){
        location.reload()
    }

    nowthatssecure(pdf){
        return pdf.replace(/^http:\/\//i, 'https://')
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
        let clientID =  this.memoryTarget.dataset.clientid
        let pdfUrl = this.nowthatssecure(this.memoryTarget.dataset.pdfurl)
        let modal = this.memoryTarget.dataset.modal
        let pdfFile = this.memoryTarget.dataset.pdfurl.split("/").pop()
        console.log(pdfFile)
        let pdfView = this.memoryTarget.dataset.pdfview
        let adobeDCView = new AdobeDC.View({
            clientId: clientID,
            divId: pdfView,
        });
        try {
            adobeDCView.previewFile({content: { promise: this.load(pdfUrl) }, metaData: { fileName: pdfFile}}, viewerOptions);
        }catch (e) {
            console.log("Adobe PDF Error: "+e);
        }
       this.openModal(modal)
    }

    load(pdfUrl){
        return new Promise((resolve, reject) => {
            fetch(pdfUrl).then((response)=> {
                if(response.ok && response.status === 200){
                    return response
                }else{
                    reject("File not found")
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

    readerhide(){
        location.reload()
    }
}