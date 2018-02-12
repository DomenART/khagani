<div class="products-item">
    <div class="products-item__figure">
        <a href="{$uri}">
            {if $new?}
                <span class="badge-new"></span>
            {/if}
            {if $popular?}
                <span class="badge-hit"></span>
            {/if}
            {if $old_price?}
                <span class="badge-discount"></span>
            {/if}
            <img src="{$medium}" alt="{$pagetitle}" class="products-item__image" id="image-{$id}">
        </a>
        <button class="products-item__view js-product-view" data-id="{$id}">Быстрый просмотр</button>
    </div>
    <div class="products-item__name">
        <a href="{$uri}">{$pagetitle}</a>
    </div>
    <div class="products-item__price">
        {$price}
        <svg width="10" height="10">
            <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
        </svg>
    </div>
    <div class="products-item__colors">
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