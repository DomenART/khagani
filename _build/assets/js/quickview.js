import axios from 'axios'
import UIkit from './uikit.js'
import { ColorOptions } from './colors.js'
import { FormNumber, FormProductValidation } from "./form.js"

document.querySelector('.js-products').addEventListener('click', e => {
    if(e.target && e.target.classList.contains('js-product-view')) {
        let button = e.target

        axios.get(assets_url + 'action.php?action=product/quickview&id=' + button.dataset.id)
        .then(response => {
            if(!window.QuickView) {
                let modal = document.createElement('div')
                let close = document.createElement('button')
                let body = document.createElement('div')
                let content = document.createElement('div')

                // add classes
                modal.classList.add('uk-flex-top')
                close.classList.add('uk-modal-close','modal-close')
                body.classList.add('uk-modal-dialog','uk-modal-body','uk-margin-auto-vertical','quickview')

                // appends
                body.appendChild(close)
                body.appendChild(content)
                modal.appendChild(body)
                document.body.appendChild(modal)

                // create modal
                window.QuickView = UIkit.modal(modal)
                window.QuickView['$content'] = content
            }

            window.QuickView.$content.innerHTML = response.data.html
            new ColorOptions(window.QuickView.$content)
            new FormNumber({
                wrap: '.js-form-number',
                plus: '.js-form-number-plus',
                minus: '.js-form-number-minus',
                input: '.js-form-number-input'
            }, {
                min: 1
            })
            new FormProductValidation(window.QuickView.$content.querySelector('.ms2_form'), {
                'options[size]': {
                    presence: { message: '^Выберите размер' }
                }
            })
            window.QuickView.show()
        })
    }
 })