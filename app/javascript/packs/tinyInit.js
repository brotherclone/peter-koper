//= require tinymce

const tinyInit = function(){
    document.addEventListener('DOMContentLoaded', function () {
        tinymce.init({
            selector: 'textarea',
            height: 400
        })
    }, false)
}

export default tinyInit;