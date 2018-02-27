<div class="products-row">
    <div class="products-row__figure">
        <a href="{$uri}">
            <img src="{$thumb}" alt="{$pagetitle}" class="products-row__image">
        </a>
    </div>
    <div class="products-row__info">
        <div class="products-row__name">
            <a href="{$uri}">{$pagetitle}</a>
        </div>
        <div class="products-row__colors">
            {foreach $id | getColors as $color}
                <button 
                class="products-item__color js-product-color" 
                style="background-color: {$color.color};" 
                data-image="{$color.image}" 
                data-thumb="{$color.medium}" 
                data-target="#image-{$id}"></button>
            {/foreach}
        </div>
    </div>
    <div class="products-row__prices">
        {if $old_price?}
        <div class="products-row__price-old">
            {$old_price}
            <svg width="8" height="10">
                <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
            </svg>
        </div>
        {/if}
        <div class="products-row__price">
            {$price}
            <svg width="10" height="12">
                <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
            </svg>
        </div>
    </div>
    <button class="products-row__view uk-button button-frame js-product-view" data-id="{$id}">Быстрый просмотр</button>
</div>