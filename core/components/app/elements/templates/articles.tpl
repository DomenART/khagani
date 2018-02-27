{extends 'file:templates/base.tpl'}

{block 'content'}
<div class="section-twilight">
    <div class="uk-container">
        <div class="page-breadcrumb">
            {'pdoCrumbs' | snippet : [
                'showHome' => true,
                'tpl' => '@FILE chunks/crumbs/link.tpl',
                'tplWrapper' => '@FILE chunks/crumbs/wrapper.tpl',
                'tplCurrent' => '@FILE chunks/crumbs/current.tpl'
            ]}
        </div>

        <h1>{$.resource.longtitle ?: $.resource.pagetitle}</h1>
        
        {'!mFilter2' | snippet : [
            'class' => 'modDocument',
            'element' => 'pdoResources',
            'includeTVs' => 'image,article_type,article_format,rating',
            'tvPrefix' => '',
            'parents' => $.resource.id,
            'limit' => 21,

            'filters' => '
                tv|article_type:default
            ',

            'tplFilter.outer.tv|article_type' => '@FILE chunks/filter/filter.categories.tpl',
            'tplFilter.row.tv|article_type' => '@FILE chunks/filter/filter.checkbox.tpl',

            'tplOuter' => '@FILE chunks/filter/articles.tpl',
            'tplPageWrapper' => '@INLINE <div class="products-pagination"><ul class="pagination">[[+first]][[+pages]][[+last]]</ul></div>',
            'tplPageFirst' => '@INLINE <li class="control"><a href="[[+href]]"><i uk-icon="icon: chevron-left; ratio: .6"></i>[[%pdopage_first]]</a></li>',
            'tplPageLast' => '@INLINE <li class="control"><a href="[[+href]]">[[%pdopage_last]]<i uk-icon="icon: chevron-right; ratio: .6"></i></a></li>',
            'tplPageFirstEmpty' => '@INLINE <li class="control"><span><i uk-icon="icon: chevron-left; ratio: .6"></i>[[%pdopage_first]]</span></li>',
            'tplPageLastEmpty' => '@INLINE <li class="control"><span>[[%pdopage_last]]<i uk-icon="icon: chevron-right; ratio: .6"></i></span></li>',
            'tpl' => '@FILE chunks/resources/articles.tile.tpl'
        ]}
        <h3 class="socials-title">Следите за рекомендациями Khagani-man в социальных сетях</h3>
        {include 'file:chunks/partials/socials.tpl'}
    </div>
</div>
{/block}