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