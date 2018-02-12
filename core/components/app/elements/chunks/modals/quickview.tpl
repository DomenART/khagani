<form class="ms2_form" method="post">
    <input type="hidden" name="id" value="{$id}">
    <div class="uk-grid uk-grid-medium" uk-grid>
        <div class="uk-width-2-5@s">
            <div class="quickview-gallery js-options-color-images" uk-slideshow="animation: pull; ratio: 3:4">
                <ul class="uk-slideshow-items" uk-lightbox>
                    {foreach $id | getImages as $image}
                    <li class="js-options-color-image-{$image.id}">
                        <img src="{$image.url}" alt="" uk-cover>
                        <a href="{$image.url}" uk-icon="search" title="{$image.name}" class="gallery-link"></a>
                    </li>
                    {/foreach}
                </ul>
                <button class="slidenav-previous" uk-icon="icon: chevron-left; ratio: 1.5" uk-slideshow-item="previous"></button>
                <button class="slidenav-next" uk-icon="icon: chevron-right; ratio: 1.5" uk-slideshow-item="next"></button>
            </div>
        </div>

        <div class="uk-width-3-5@s">
            <div class="quickview__title">{$pagetitle}</div>
            <div class="quickview__article">{$article}</div>
            <div class="quickview__prices">
                {if $old_price?}
                    <div class="quickview__price-old">
                        {$old_price}
                        <svg width="10" height="10">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
                        </svg>
                    </div>
                {/if}
                <div class="quickview__price">
                    {$price}
                    <svg width="10" height="10">
                        <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
                    </svg>
                </div>
            </div>
            {var $sizes = 'msOptions' | snippet : [
                'tpl' => '@FILE chunks/product/options.tpl',
                'options' => 'size',
                'product' => $id
            ]}
            {if $sizes?}
                {$sizes}
                <div class="quickview__dimensions">
                    <a href="{'dimensions' | uri2id | url}" class="dimensions-link" target="_blank">
                        <svg width="16" height="17">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#table_sizes" />
                        </svg>
                        Таблица размеров
                    </a>
                </div>
            {/if}
            <div class="product__misc">
                <div class="product-options">
                    <div class="product-options__label">
                        Цвет
                        <span class="product-options__desc js-options-color-label"></span>
                    </div>
                    <div class="product-options__values product-options__colors">
                        {foreach $id | getColors as $color}
                            <label class="product-options__color">
                                <input 
                                type="radio" 
                                name="options[color]" 
                                class="js-options-color" 
                                value="{$color.label}"
                                data-id="{$color.file}">
                                <span style="background-color: {$color.color}"></span>
                            </label>
                        {/foreach}
                    </div>
                </div>

                <div class="product-count uk-flex">
                    <label for="product_price" class="product-count__label">Количество</label>
                    <div class="form-number js-form-number">
                        <div class="form-number__minus js-form-number-minus" uk-icon="icon: minus; ratio: .6"></div>
                        <input type="text" name="count" id="product_price" class="form-number__input js-form-number-input" value="1" min="1">
                        <div class="form-number__plus js-form-number-plus" uk-icon="icon: plus; ratio: .6"></div>
                    </div>
                </div>
            </div>
            <div class="quickview__cart-wrap">
                <button type="submit" class="quickview__cart uk-button button-bordered button-bordered--large" name="ms2_action" value="cart/add">Добавить в корзину</button>
            </div>
        </div>
    </div>
</form>