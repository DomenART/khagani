<div id="msCart" class="cart">
    {if !count($products)}
        {'ms2_cart_is_empty' | lexicon}
    {else}
        {foreach $products as $product}
            <div class="cart-row" id="{$product.key}">
                <div class="cart-row__image">
                    {if $product.thumb?}
                        <img src="{$product.thumb}" alt="{$product.pagetitle}" title="{$product.pagetitle}"/>
                    {/if}
                </div>

                <div class="cart-row__title">
                    {if $product.id?}
                        <a href="{$product.id | url}">{$product.pagetitle}</a>
                    {else}
                        {$product.name}
                    {/if}
                </div>

                <div class="cart-row__count">
                    {$product.count} шт.
                </div>

                <!-- <div class="cart-row__count">
                    <form method="post" class="ms2_form form-inline" role="form">
                        <input type="hidden" name="key" value="{$product.key}"/>
                        <div class="form-group">
                            <div class="form-number js-form-number">
                                <div class="form-number__minus js-form-number-minus" uk-icon="icon: minus; ratio: .6"></div>
                                <input type="text" name="count" class="form-number__input js-form-number-input" value="{$product.count}" min="1">
                                <div class="form-number__plus js-form-number-plus" uk-icon="icon: plus; ratio: .6"></div>
                            </div>
                        </div>
                    </form>
                </div> -->

                <div class="cart-row__prices">
                    <span class="cart-row__price">
                        {$product.price}
                        <svg width="10" height="14">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
                        </svg>
                    </span>

                    {if $product.old_price?}
                    <span class="cart-row__old-price">
                        {$product.old_price}
                        <svg width="10" height="14">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
                        </svg>
                    </span>
                    {/if}
                </div>

                <div class="cart-row__remove">
                    <form method="post" class="ms2_form">
                        <input type="hidden" name="key" value="{$product.key}">
                        <button class="uk-button button-blue" type="submit" name="ms2_action" value="cart/remove">
                            <svg width="15" height="15">
                                <use href="{$.assets_url}web/img/svg-sprite.svg#close" />
                            </svg>
                        </button>
                    </form>
                </div>
            </div>
        {/foreach}
    {/if}
</div>
