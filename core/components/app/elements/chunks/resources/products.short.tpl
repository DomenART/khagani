<div class="products-item">
    <div class="
        products-item__figure
        {if $new?}badge-new{/if}
        {if $popular?}badge-hit{/if}
        {if $old_price?}badge-discount{/if}
    ">
        <a href="{$uri}">
            <img src="{$thumb}" alt="{$pagetitle}" class="products-item__image">
        </a>
        <button class="products-item__view">Быстрый просмотр</button>
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
        colors
    </div>
</div>