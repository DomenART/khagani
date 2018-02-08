document.querySelectorAll('.js-product-color').forEach(color => {
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