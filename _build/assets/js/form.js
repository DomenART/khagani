import { validate } from "validate.js"

class FormNumber {

    constructor(selectors, config) {
        this.selectors = Object.assign({
            wrap: '.js-form-number',
            plus: '.js-form-number-plus',
            minus: '.js-form-number-minus',
            input: '.js-form-number-input'
        }, selectors)
        this.config = Object.assign({
            min: false,
            max: false
        }, config)
        this.init()
    }

    init() {
        document.querySelectorAll(this.selectors.wrap).forEach(el => {
            let minus = el.querySelector(this.selectors.minus)
            let plus = el.querySelector(this.selectors.plus)
            let input = el.querySelector(this.selectors.input)

            minus.addEventListener('click', () => {
                if (this.config.min !== false) {
                    if (input.value > this.config.min) {
                        input.value--
                    }
                } else {
                    input.value--
                }
            })
            plus.addEventListener('click', () => {
                if (this.config.max !== false) {
                    if (input.value < this.config.max) {
                        input.value++
                    }
                } else {
                    input.value++
                }
            })
        })
    }

}

class FormProductValidation {
    
    constructor(form, rules) {
        this.form = form
        this.rules = rules
        this.id = this.random()
        this.button = this.form.querySelector('[value="cart/add"]')

        form.addEventListener('submit', (e) => {
            if (this.button.$alert) {
                this.button.$alert.parentNode.removeChild(this.button.$alert)
            }

            miniShop2.Callbacks.add('Cart.add.before', 'validate_product_form_' + this.id, () => {
                miniShop2.Callbacks.remove('Cart.add.before', 'validate_product_form_' + this.id)
                
                let errors = validate(validate.collectFormValues(form), rules)

                if (errors) {
                    let alert = document.createElement('div')
                    let close = document.createElement('div')
                    let list = document.createElement('ul')

                    alert.classList.add('form-error')
                    close.classList.add('form-error__close')
                    list.classList.add('form-error__list')

                    close.addEventListener('click', () => {
                        alert.style.display = 'none'
                    })

                    alert.appendChild(close)
                    alert.appendChild(list)
                    
                    Object.keys(errors).forEach(key => {
                        let row = document.createElement('li')
                        row.innerHTML = errors[key]
                        list.appendChild(row)
                    })

                    this.button.$alert = alert
                    this.button.parentNode.insertBefore(alert, this.button.nextSibling)

                    return false;
                }
            })
        })
    }

    random() {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
    }

}

export { FormNumber, FormProductValidation }