import UIkit from 'uikit'

class ColorViews {

    constructor(selector) {
        this.selector = selector
        this.init()
    }

    init() {
        document.querySelectorAll(this.selector).forEach(color => {
                let target = document.querySelector(color.dataset.target)
                target.dataset.origin = target.src

                color.addEventListener('mouseover', el => {
                        target.dataset.src = target.src
                        target.src = color.dataset.thumb
                })
                color.addEventListener('mouseout', el => {
                        target.src = target.dataset.src
                })
                color.addEventListener('click', el => {
                        if(target.dataset.active == color.dataset.thumb) {
                                target.dataset.active = ''
                                target.dataset.src = target.dataset.origin
                        } else {
                                target.dataset.active = color.dataset.thumb
                                target.dataset.src = color.dataset.thumb
                        }
                })
        })

    }

    update() {
        this.init()
    }

}

class ColorOptions {

    constructor(wrap) {
        this.wrap = wrap
        this.inputs = wrap.querySelectorAll('.js-options-color')
        this.labels = wrap.querySelectorAll('.js-options-color-label')
        
        let slideshow = wrap.querySelector('.js-options-color-images')
        if(slideshow) {
                this.slideshow = UIkit.slideshow(slideshow)
        }
        
        this.init()
    }

    init() {
        this.inputs.forEach(el => {
                el.addEventListener('change', e => {
                        this.setLabel(el.value)
                        this.setSlide(el.dataset.id)
                })
        })
    }

    setLabel(label) {
        this.labels.forEach(el => {
                el.innerHTML = label
        })
    }

    setSlide(id) {
        if(!this.slideshow) return false

        let slide = this.wrap.querySelector('.js-options-color-image-' + id)
        let index = this.slideshow.slides.indexOf(slide)
        this.slideshow.show(index)
    }

}

export { ColorViews, ColorOptions }