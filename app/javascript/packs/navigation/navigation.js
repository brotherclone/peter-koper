window.onscroll = function(){ navScroller() };
function navScroller(){
    let header = document.getElementById("peterKoperHeader");
    if(document.body.scrollTop > 50 || document.documentElement.scrollTop > 50){
        if(header.classList.contains("expanded")){
            header.classList.add("shrink");
            header.classList.remove("expanded");
        }
    }else{
        if(header.classList.contains("shrink")){
            header.classList.add("expanded");
            header.classList.remove("shrink");
        }
    }
}