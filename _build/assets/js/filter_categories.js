export default class FilterCategories {

  constructor(wrap) {
    this.wrap = wrap
    this.rows = [].slice.call(this.wrap.querySelectorAll('.js-filter-categories-rows>*'))
    this.add = this.wrap.querySelector('.js-filter-categories-add')
    this.limit = 5
    this.page = 1

    this.update()

    this.add.addEventListener('click', e => {
        e.preventDefault()
        this.addPage()
    })
  }

  update() {
    this.rows.forEach((row, index) => {
        if(index+1 <= this.page * this.limit) {
            row.style.display = 'block'
        } else {
            row.style.display = 'none'
        }
    })

    if(this.rows.length <= this.page * this.limit) {
        this.add.style.display = 'none'
    }
  }

  addPage() {
    this.page++
    this.update()
  }

  reset() {
    this.page = 1
    this.update()
  }

}