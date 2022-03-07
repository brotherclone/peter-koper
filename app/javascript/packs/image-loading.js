const imageLoading = function(){
    document.addEventListener("DOMContentLoaded", function(){
        let loadingImages
        if("InteractionObserver" in window ) {
            loadingImages = document.querySelectorAll(".loading")
            const imageObserver = new IntersectionObserver(function (entries, observer) {
                entries.forEach(function (entry) {
                    if (entry.isIntersecting) {
                        let image = entry.target;
                        image.classList.remove("loading");
                        imageObserver.unobserve(image);
                    }
                });
            });
            loadingImages.forEach(function (img) {
                imageObserver.observe(img)
            })
        }else{
            let loadingTimeOut
            loadingImages = document.querySelectorAll(".loading")
            function doLoad(){
                if (loadingTimeOut){
                    clearTimeout(loadingTimeOut)
                }
            }
            loadingTimeOut = setTimeout(function(){
                let scrollTop = window.pageYOffset
                loadingImages.forEach(function(img){
                    if(img.offsetTop < window.innerHeight + scrollTop){
                        img.src = img.dataset.src
                        img.classList.remove('loading')
                    }
                })
                if (loadingImages.length ===0){
                    document.removeEventListener("scroll",doLoad)
                    window.removeEventListener("resize", doLoad)
                    window.removeEventListener("orientationchange", doLoad)
                }
            }, 25)
        }
        document.addEventListener("scroll", doLoad)
        window.addEventListener("resize", doLoad)
        window.addEventListener("orientationchange", doLoad)
    })
}

export default imageLoading;