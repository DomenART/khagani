import FilterCategories from './filter_categories.js'
import { ColorViews } from './colors.js'
import $ from 'jquery'

// sorting by select
document.querySelector('[name="mse2_sort"]').addEventListener('change', el => {
    let sort = el.target.value
    mse2Config['sort'] = (sort != mse2Config['start_sort']) ? sort : ''
    let params = mSearch2.getFilters()
    if (mse2Config['page'] > 1 && (mse2Config['mode'] == 'scroll' || mse2Config['mode'] == 'button')) {
        mse2Config['page'] = ''
        delete (params['page'])
    }
    mSearch2.Hash.set(params)
    mSearch2.load(params)
})

// color view in list
let ColorViewsIn = new ColorViews('.js-product-color')
$(document).on('mse2_load', () => ColorViewsIn.update())

// for filter
document.querySelectorAll('.js-filter-categories').forEach(wrap => {
    new FilterCategories(wrap, {
        rows: '.js-filter-categories-rows>*',
        add: '.js-filter-categories-add'
    })
})