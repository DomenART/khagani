{block 'main'}
    <div class="offers-item offers-item--new">
        {if $new?}
            <span class="badge-new"></span>
        {/if}
        {if $popular?}
            <span class="badge-hit"></span>
        {/if}
        {if $old_price?}
            <span class="badge-discount"></span>
        {/if}
        <a href="{$uri}">
            <img src="{$medium}" alt="" class="offers-item__image">
        </a>
        <form class="offers-item__docket ms2_form" method="post">
            <input type="hidden" name="id" value="{$id}">
            <input type="hidden" name="count" value="1">
            <div class="offers-item__prices">
                {if $old_price?}
                <div class="offers-item__price-old">
                    {$old_price}
                    <svg width="10" height="10">
                        <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
                    </svg>
                </div>
                {/if}
                <div class="offers-item__price-new">
                    {$price}
                    <svg width="14" height="16">
                        <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
                    </svg>
                </div>
            </div>
            <button class="offers-item__buy uk-button button-bordered" type="submit" name="ms2_action" value="cart/add">
                Купить
            </button>
            <a href="{$uri}" class="offers-item__info">
                <svg width="10" height="20">
                    <use href="{$.assets_url}web/img/svg-sprite.svg#info" />
                </svg>
            </a>
        </form>
    </div>
{/block}