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

        <h1>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>

        <div class="uk-grid" uk-grid>
            <div class="uk-width-2-5@s uk-width-1-4@m">
                {'pdoMenu' | snippet : [
                    'level' => 1,
                    'outerClass' => 'menu-left',
                    'includeTVs' => 'category_type',
                    'tpl' => '@FILE chunks/resources/menu.left.tpl'
                ]}
            </div>
            <div class="uk-width-3-5@s uk-width-3-4@m">
                <div class="categories">
                    {'!pdoResources' | snippet : [
                        'depth' => 0,
                        'tvPrefix' => '',
                        'includeTVs' => 'category_type,image,table_sizes,stylist_choice',
                        'tpl' => '@FILE chunks/resources/categories.group.tpl'
                    ]}
                </div>
                <div class="catalog-content">
                    {$.resource.content}
                </div>
            </div>
        </div>
    </div>
</div>
{/block}