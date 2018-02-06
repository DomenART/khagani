{extends 'file:templates/base.tpl'}

{block 'content'}
<div class="section-twilight">
    <div class="uk-container">
        {'pdoCrumbs' | snippet : [
            'showHome' => true,
            'tplCurrent' => '@INLINE <li><span>{$menutitle}</span></li>'
        ]}

        <h1>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
        
        {'!mFilter2' | snippet : [
            'class' => 'msProduct',
            'element' => 'msProducts',
            'parents' => $_modx->resource.id,
            'limit' => 21,
            'filters' => '
                msoption|size:default,
                parent:categories,
                ms|price:number,
                mscolor|color_id:color
            ',
            'tplFilter.outer.ms|price' => 'tpl.mFilter2.filter.slider',
            'tplFilter.row.ms|price' => 'tpl.mFilter2.filter.number',
            'tplOuter' => '@FILE chunks/filter/outer.tpl',
            'tplPageWrapper' => '@INLINE <div class="products-pagination"><ul class="pagination">[[+first]][[+pages]][[+last]]</ul></div>',
            'tplPageFirst' => '@INLINE <li class="control"><a href="[[+href]]"><i uk-icon="icon: chevron-left; ratio: .6"></i>[[%pdopage_first]]</a></li>',
            'tplPageLast' => '@INLINE <li class="control"><a href="[[+href]]">[[%pdopage_last]]<i uk-icon="icon: chevron-right; ratio: .6"></i></a></li>',
            'tplPageFirstEmpty' => '@INLINE <li class="control"><span><i uk-icon="icon: chevron-left; ratio: .6"></i>[[%pdopage_first]]</span></li>',
            'tplPageLastEmpty' => '@INLINE <li class="control"><span>[[%pdopage_last]]<i uk-icon="icon: chevron-right; ratio: .6"></i></span></li>',
            'tpls' => '
                @FILE chunks/resources/products.tile.tpl,
                @FILE chunks/resources/products.short.tpl,
                @FILE chunks/resources/products.row.tpl
            '
        ]}
    </div>
</div>
{/block}