<form class="ms2_form" method="post">
    <input type="hidden" name="id" value="{$id}">
    <div class="uk-grid uk-grid-medium" uk-grid>
        <div class="uk-width-2-5">
            <div class="quickview-gallery js-options-color-images" uk-slideshow="animation: pull; ratio: 3:4">
                <ul class="uk-slideshow-items" uk-lightbox>
                    {foreach $id | getImages as $image}
                    <li class="js-options-color-image-{$image.id}">
                        <img src="{$image.url}" alt="" uk-cover>
                        <a href="{$image.url}" uk-icon="search" title="{$image.name}" class="quickview-gallery__link"></a>
                    </li>
                    {/foreach}
                </ul>
                <button class="quickview-gallery__previous" uk-icon="icon: chevron-left; ratio: 1.5" uk-slideshow-item="previous"></button>
                <button class="quickview-gallery__next" uk-icon="icon: chevron-right; ratio: 1.5" uk-slideshow-item="next"></button>
            </div>
        </div>

        <div class="uk-width-3-5">
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
            {'msOptions' | snippet : [
                'tpl' => '@FILE chunks/modals/quickview.options.tpl',
                'options' => 'size',
                'product' => $id
            ]}
            <div class="quickview__dimensions">
                <a href="{'dimensions' | uri2id | url}">
                    <svg width="16" height="17">
                        <use href="{$.assets_url}web/img/svg-sprite.svg#table_sizes" />
                    </svg>
                    Таблица размеров
                </a>
            </div>
            <div class="uk-flex uk-flex-bottom uk-flex-between">
                <div class="quickview-options">
                    <div class="quickview-options__label">
                        Цвет
                        <span class="quickview-options__desc js-options-color-label"></span>
                    </div>
                    <div class="quickview-options__values">
                        {foreach $id | getColors as $color}
                            <label class="quickview-options__color">
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

                <div class="quickview-count uk-flex">
                    <label for="product_price" class="quickview-count__label">Количество</label>
                    <div class="form-number js-form-number">
                        <div class="form-number__minus js-form-number-minus" uk-icon="icon: minus; ratio: .6"></div>
                        <input type="text" name="count" id="product_price" class="form-number__input js-form-number-input" value="1">
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