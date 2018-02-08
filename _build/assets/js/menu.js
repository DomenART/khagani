import React from 'react'
import ReactDOM from 'react-dom'
import Menu from './components/menu'

document.querySelectorAll('.js-mobile-menu').forEach((el) => {
    if (window.innerWidth > 768) return false

    const parseMenu = (el) => {
        let arr = []

        for (var i = 0; i < el.children.length; i++) {
            let link = el.children[i].querySelector('a')
            let submenu = el.children[i].querySelector('ul')
            let item = {
                href: link.getAttribute('href'),
                title: link.innerText,
                classes: el.children[i].getAttribute('class') || ''
            }

            if (submenu)
                item.children = parseMenu(submenu)

            arr.push(item)
        }

        return arr
    }

    let menu = parseMenu(document.querySelector('.js-menu-main'))
    menu.push({
        href: 'catalog',
        title: 'Каталог',
        classes: 'mobile-menu__catalog parent',
        children: parseMenu(document.querySelector('.js-menu-catalog'))
    })

    ReactDOM.render(
        <Menu items={menu} />,
        el
    )
})