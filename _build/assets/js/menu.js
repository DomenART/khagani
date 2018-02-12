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
                title: link.innerHTML,
                classes: el.children[i].getAttribute('class') || ''
            }

            if (submenu)
                item.children = parseMenu(submenu)

            arr.push(item)
        }

        return arr
    }

    let menu = parseMenu(document.querySelector('.js-menu-main'))
    menu.splice(1, 0, {
        href: '/catalog',
        title: 'Каталог',
        showChildren: true,
        children: parseMenu(document.querySelector('.js-menu-catalog'))
    })
    console.log(menu);

    ReactDOM.render(
        <Menu items={menu} />,
        el
    )
})