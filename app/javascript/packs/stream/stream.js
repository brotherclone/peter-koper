import lax from 'lax.js'

window.onload = function(){
    lax.init();

    lax.addDriver('scrollY', function () {
        return window.scrollY
    })
    lax.addElements('.memory-container', {
        scrollY: {
            translateX: [
                ["elInY", "elCenterY", "elOutY"],
                [0, 'screenWidth/2', 'screenWidth'],
                {
                    easing: 'easeInOutQuart'
                }
            ]
        }
    })

}



// window.onload = function () {
//     lax.init()
//
//     const container = document.querySelector('.container')
//
//     lax.addDriver('containerScrollX', function () {
//         return container.scrollLeft
//     })
//
//     lax.addElements(".bg", {
//         containerScrollX: {
//             "opacity": [
//                 ["screenWidth * (index-1)", "screenWidth * index", "screenWidth * (index+1)"],
//                 [0, 1, 0],
//             ],
//         }
//     })
//
//     const imageAnimationMap = ["elCenterX-elWidth", "elCenterX", "elCenterX+elWidth"]
//     const textAnimationMap = ["elCenterX-(elWidth/3)", "elCenterX", "elCenterX+(elWidth/3)"]
//
//     lax.addElements(".page h1", {
//         containerScrollX: {
//             translateY: [
//                 textAnimationMap,
//                 [200, 0, 200],
//                 {
//                     easing: 'easeInOutQuad',
//                 }
//             ],
//             opacity: [
//                 textAnimationMap,
//                 [0, 1, 0],
//             ],
//         }
//     })
//
//     lax.addElements(".page p", {
//         containerScrollX: {
//             translateY: [
//                 textAnimationMap,
//                 [500, 0, 500],
//                 {
//                     easing: 'easeInOutQuad',
//                 }
//             ],
//             opacity: [
//                 textAnimationMap,
//                 [0, 1, 0],
//             ],
//         }
//     })
//
//     lax.addElements(".page .image", {
//         containerScrollX: {
//             translateY: [
//                 imageAnimationMap,
//                 [-100, 0, -100],
//                 {
//                     easing: 'easeInOutQuad',
//                 }
//             ],
//             scale: [
//                 imageAnimationMap,
//                 [0.8, 1, 0.8],
//                 {
//                     easing: 'easeInOutQuad',
//                 }
//             ],
//         }
//     })
// }
//