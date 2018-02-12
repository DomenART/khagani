{block 'main'}
<div class="product-small">
    <div class="product-small__figure">
        <a href="{$uri}">
            <img src="{$medium}" alt="{$pagetitle}" class="product-small__image" id="image-{$id}">
        </a>
        <button class="product-small__view js-product-view" data-id="{$id}">Быстрый просмотр</button>
    </div>
    <div class="product-small__name">
        <a href="{$uri}">{$pagetitle}</a>
    </div>
    <div class="product-small__prices">
        {if $old_price?}
        <div class="product-small__price-old">
            {$old_price}
            <svg width="8" height="10">
                <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
            </svg>
        </div>
        {/if}
        <div class="product-small__price">
            {$price}
            <svg width="10" height="12">
                <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
            </svg>
        </div>
    </div>
    <div class="product-small__colors">
        {foreach $id | getColors as $color}
            <button 
            class="product-small__color js-product-color" 
            style="background-color: {$color.color};" 
            data-image="{$color.image}" 
            data-thumb="{$color.medium}" 
            data-target="#image-{$id}"></button>
        {/foreach}
    </div>
</div>
{/block}