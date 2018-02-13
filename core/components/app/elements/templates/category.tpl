{extends 'file:templates/base.tpl'}

{block 'content'}
<div class="section-twilight">
    <div class="uk-container">
        {'pdoCrumbs' | snippet : [
            'showHome' => true,
            'tplWrapper' => '@INLINE <div class="page-breadcrumb"><ul class="breadcrumb">{$output}</ul></div>',
            'tplCurrent' => '@INLINE <li><span>{$menutitle}</span></li>'
        ]}

        <h1>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
        
        {'!mFilter2' | snippet : [
            'class' => 'msProduct',
            'element' => 'msProducts',
            'includeThumbs' => 'medium',
            'parents' => $_modx->resource.id,
            'limit' => 21,

            'filters' => '
                msoption|size:default,
                resource|parent:categories,
                ms|price:number,
                mscolor|color_id:color
            ',

            'tplFilter.outer.msoption|size' => '@FILE chunks/filter/filter.size.tpl',
            'tplFilter.row.msoption|size' => '@FILE chunks/filter/filter.checkbox.tpl',
            'tplFilter.outer.resource|parent' => '@FILE chunks/filter/filter.categories.tpl',
            'tplFilter.row.resource|parent' => '@FILE chunks/filter/filter.checkbox.tpl',
            'tplFilter.outer.ms|price' => '@FILE chunks/filter/filter.slider.tpl',
            'tplFilter.row.ms|price' => '@FILE chunks/filter/filter.number.tpl',
            'tplFilter.outer.mscolor|color_id' => '@FILE chunks/filter/filter.colors.tpl',
            'tplFilter.row.mscolor|color_id' => '@FILE chunks/filter/filter.color.tpl',

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