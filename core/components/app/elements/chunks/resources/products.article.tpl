<div>
    <div class="article-product">
        {if $new?}
            <span class="badge-new"></span>
        {/if}
        {if $popular?}
            <span class="badge-hit"></span>
        {/if}
        {if $old_price?}
            <span class="badge-discount"></span>
        {/if}
        <div class="article-product__figure">
            <a href="{$uri}">
                <img src="{$medium}" alt="{$pagetitle}" class="article-product__image" id="image-{$id}">
            </a>
        </div>
        <div class="article-product__name">
            <a href="{$uri}">{$pagetitle}</a>
        </div>
        <div class="article-product__prices">
            <div class="article-product__old-price">
                {if $old_price?}
                    {$old_price}
                    <svg width="10" height="12">
                        <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
                    </svg>
                {/if}
            </div>
            <div class="article-product__price">
                {$price}
                <svg width="12" height="16">
                    <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
                </svg>
            </div>
        </div>
    </div>
</div>