{extends 'file:templates/base.tpl'}

{block 'content'}
<div class="section-twilight">
    <div class="uk-container">
        {'pdoCrumbs' | snippet : [
            'showHome' => true,
            'tplCurrent' => '@INLINE <li><span>{$menutitle}</span></li>'
        ]}

        <h1>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>

        <div class="uk-grid" uk-grid>
            <div class="uk-width-1-4">
                {'pdoMenu' | snippet : [
                    'level' => 1,
                    'outerClass' => 'menu-left',
                    'includeTVs' => 'category_type',
                    'tpl' => '@FILE chunks/resources/menu.left.tpl'
                ]}
            </div>
            <div class="uk-width-3-4">
                <div class="categories">
                    {'!pdoResources' | snippet : [
                        'depth' => 0,
                        'tvPrefix' => '',
                        'includeTVs' => 'category_type,image,table_sizes,stylist_choice',
                        'tpl' => '@FILE chunks/resources/categories.group.tpl'
                    ]}
                </div>
            </div>
        </div>
    </div>
</div>
{/block}