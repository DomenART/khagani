/**
 * Include UIkit
 */
import UIkit from 'uikit';
import Icons from 'uikit/dist/js/uikit-icons';
UIkit.use(Icons);
window.UIkit = UIkit
window.$ = $

import './menu.js'
import './products.js'
import './quickview.js'
import './ajaxform.js'

/**
 * scrolltop
 */
window.addEventListener('scroll', (e) => {
    let button = document.querySelector('.scrolltop')

    if (window.scrollY > 300)
        button.classList.add('scrolltop--visible')
    else
        button.classList.remove('scrolltop--visible')
})

let $slideshow = document.querySelector('.js-slideshow')
if ($slideshow) {
    let slideshow = UIkit.slideshow($slideshow, {
        "min-height": 268,
        "max-height": 500,
        animation: 'push'
    })
    let items = $slideshow.querySelectorAll('.js-slideshow-item')
    $slideshow.addEventListener('beforeitemshow', e => {
        for (let i = 0; i < items.length; i++) {
            items[i].style.display = 'none'
        }
        items[slideshow.index].style.display = 'block'
    })
}