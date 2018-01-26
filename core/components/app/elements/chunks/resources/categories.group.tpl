<div class="categories-group">
    <a href="{$uri}" class="categories-group__image">
        <img src="{$image | pthumb : 'w=260&h=350&zc=1'}" alt="">
    </a>
    <div class="categories-group__info">
        <div class="categories-group__head">
            <a href="{$uri}" class="categories-group__title">{$pagetitle}&nbsp;({$id | productsCount})</a>
            {if $table_sizes?}
            <a href="{$table_sizes}" class="categories-group__sizes">
                <svg width="27" height="27">
                    <use href="{$.assets_url}web/img/svg-sprite.svg#table_sizes" />
                </svg>
                Таблица размеров
            </a>
            {/if}
            {*if $stylist_choice?}
            <a href="{$table_sizes}" class="categories-group__sizes">
                <svg width="26" height="24">
                    <use href="{$.assets_url}web/img/svg-sprite.svg#costume" />
                </svg>
                Выбор стилиста
            </a>
            {/if*}
        </div>
        <div class="categories-group__list">
            <div id="pdopage-{$id}">
                <div class="rows">
                    {'!pdoPage' | snippet : [
                        'ajaxElemWrapper' => ('#pdopage-' ~ $id),
                        'ajaxElemRows' => ('#pdopage-' ~ $id ~ ' .rows'),
                        'ajaxElemPagination' => ('#pdopage-' ~ $id ~ ' .pagination'),
                        'ajaxElemLink' => ('#pdopage-' ~ $id ~ ' .pagination a'),
                        'ajaxElemMore' => ('#pdopage-' ~ $id ~ ' .js-more'),
                        'pageNavVar' => ('page' ~ $id ~ '.nav'),
                        'pageVarKey' => ('page' ~ $id),
                        'totalVar' => ('page' ~ $id ~ '.total'),
                        'pageCountVar' => ('page' ~ $id ~ '.count'),
                        'parents' => $id,
                        'ajaxMode' => 'button',
                        'limit' => 5,
                        'tpl' => '@FILE chunks/resources/categories.sub.tpl',
                        'ajaxTplMore' => '@INLINE <div class="categories-sub"><button class="categories-sub__more js-more">+ 5 категорий</button></div>'
                    ]}
                </div>
                {('page' ~ $id ~ '.nav') | placeholder}
            </div>
        </div>
    </div>
</div>