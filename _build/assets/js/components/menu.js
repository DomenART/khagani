import React from 'react'

class Menu extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            menu: [],
            self: false,
            parent: false
        }

        this.getBack = this.getBack.bind(this)
    }

    componentDidMount() {
        this.lists = []
        this.key = 1
        this.items = this.prepareKeys(this.props.items)
        this.prepareMenu(this.items)
        this.setMenu(0)
    }

    prepareKeys(list) {
        return list.map((row) => {
            row.key = this.key++

            if (row.children)
                row.children = this.prepareKeys(row.children)

            return row
        })
    }

    prepareMenu(list, self, parent) {
        let key = self ? self.key : 0

        this.lists[key] = {
            self: self || false,
            parent: parent !== undefined ? parent : false
        }

        this.lists[key].menu = list.map((row) => {
            if (row.children) {
                row.onClick = (e) => {
                    e.preventDefault()
                    this.setMenu(row.key)
                }

                this.prepareMenu(row.children, row, key)
            }

            return row
        })
    }

    setMenu(key) {
        this.setState(this.lists[key])
    }

    getBack() {
        this.setMenu(this.state.parent)
    }

    render() {
        let menu = this.state.menu.map((row, i) => (
            <li className={row.classes} key={i}>
                <a href={row.href} onClick={row.onClick}>{row.title}</a>
            </li>
        ))

        return (
            <div id="mobile-menu" className="mobile-menu">
                <div className="mobile-menu__head uk-flex uk-flex-middle">
                    {this.state.self ? <a href={this.state.self.href}>{this.state.self.title}</a> : ''}
                </div>
                <a href="#mobile-menu" className="mobile-menu__close" uk-toggle="cls: mobile-menu--open" />
                {this.state.parent !== false ? <span className="mobile-menu__back" onClick={this.getBack} /> : ''}
                <ul className={this.state.parent !== false ? 'mobile-menu__submenu' : 'mobile-menu__menu'}>
                    {menu}
                </ul>
            </div>
        )
    }
}

export default Menu