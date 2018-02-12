import "jquery-validation"
import "jquery-validation/dist/localization/messages_ru.js"

class FormNumber {

    constructor(wrap, config) {
        this.config = Object.assign({
            selectors: {
                plus: '.js-form-number-plus',
                minus: '.js-form-number-minus',
                input: '.js-form-number-input'
            }
        }, config)
        this.wrap = wrap
        this.init()
    }

    init() {
        let el = this.wrap
        let minus = el.querySelector(this.config.selectors.minus)
        let plus = el.querySelector(this.config.selectors.plus)
        let input = el.querySelector(this.config.selectors.input)
        let min = input.min || false
        let max = input.max || false
        let step = input.step || 1

        minus.addEventListener('click', () => {
            input.value = Number(input.value) - step

            if (min !== false && Number(input.value) < min) {
                input.value = min
            }
        })
        plus.addEventListener('click', () => {
            input.value = Number(input.value) + step

            if (max !== false && Number(input.value) > max) {
                input.value = max
            }
        })
    }

}

class FormProductValidation {
    
    constructor(form) {
        // form validation
        let submit = form.querySelector('[name="ms2_action"]')

        $(form).validate({
            errorClass: 'uk-form-danger',
            validClass: 'uk-form-success',
            messages: {
                "options[size]": {
                    required: "Выберите размер"
                }
            },
            errorPlacement(error, element) {
                switch (element.attr("name")) {
                    case "options[size]":
                        error.insertAfter(submit)
                        break
                    default:
                        error.insertAfter(element)
                        break
                }
            }
        })
    }

}

export { FormNumber, FormProductValidation }