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