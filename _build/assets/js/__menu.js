// let main = document.querySelector('.js-menu-main')
// let catalog = document.querySelector('.js-menu-catalog')
// let ul = catalog.cloneNode(true)
// let a = document.createElement('a')
// a.href = 'catalog'
// a.innerHTML = 'Каталог'
// ul.className = 'toolbar-menu__catalog'
// li.appendChild(a)
// li.appendChild(ul)
// main.insertBefore(li, main.children[1])








// main.appendChild(li)

// document.querySelectorAll('.js-mobile-menu').forEach((el) => {
    // if (window.innerWidth > 768) return false

const parseMenu = (el) => {
    let arr = []

    for (var i = 0; i < el.children.length; i++) {
        let link = el.children[i].querySelector('a')
        let submenu = el.children[i].querySelector('ul')
        let item = {
            href: link.getAttribute('href'),
            title: link.innerHTML,
            classes: el.children[i].getAttribute('class') || ''
        }

        if (submenu)
            item.children = parseMenu(submenu)

        arr.push(item)
    }

    return arr
}
const renderMenu = (array) => {
    let ul = document.createElement('ul')

    for (var i = 0; i < array.length; i++) {
        let row = array[i]
        let li = document.createElement('li')
        let a = document.createElement('a')
        a.href = row.href
        a.innerHTML = row.title
        li.appendChild(a)
        if (row.children) {
            let submenu = renderMenu(row.children)
            submenu.classList.add('mobile-menu__submenu')
            li.appendChild(submenu)
        }
        ul.appendChild(li)
    }

    return ul
}
const toggleMenu = (e) => {
    // let wrapper = document.querySelector('.js-mobile-menu')
    if (!window.$mobileMenu) {
        let menuArray = parseMenu(document.querySelector('.js-menu-main'))
        menuArray.splice(1, 0, {
            href: 'catalog',
            title: 'Каталог',
            classes: 'mobile-menu__catalog parent',
            children: parseMenu(document.querySelector('.js-menu-catalog'))
        })
        let menuHtml = renderMenu(menuArray)
        menuHtml.classList.add('mobile-menu__menu')

        let wrapper = document.createElement('div')
        wrapper.classList.add('mobile-menu')
        wrapper.appendChild(menuHtml)
        window.$mobileMenu = wrapper
        document.body.appendChild(window.$mobileMenu)
    }
    
    document.documentElement.classList.toggle('uk-modal-page')
    document.documentElement.classList.toggle('mobile-menu-openened')
}

let toggle = document.querySelector('.js-mobile-menu-toggle')
toggle.addEventListener('click', toggleMenu)

// console.log(menu, renderMenu(menu))
// })