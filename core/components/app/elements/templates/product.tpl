{extends 'file:templates/base.tpl'}

{block 'content'}
{$.resource.id | addViewedID}
{var $viewed = $.resource.id | getViewedIDs}
{var $related = $.resource.parent | resource : 'category_related'}

<script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
<script src="//yastatic.net/share2/share.js"></script>

<div class="uk-container">
    <div class="product-breadcrumb uk-grid uk-grid-small" uk-grid>
        <div class="uk-width-expand uk-flex uk-flex-between">
            {'pdoCrumbs' | snippet : [
                'showHome' => true,
                'tplWrapper' => '@INLINE <ul class="breadcrumb">{$output}</ul>',
                'tplCurrent' => '@INLINE <li><span>{$menutitle}</span></li>'
            ]}

            <div class="product-bar">
                <button class="product-bar__button" onclick="window.print()">
                    <svg width="16" height="16">
                        <use href="{$.assets_url}web/img/svg-sprite.svg#printer" />
                    </svg>
                </button>
                <div>
                    <button class="product-bar__button js-share-dropdown">
                        <svg width="16" height="16">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#share" />
                        </svg>
                    </button>
                    <div class="dropdown-tooltip" uk-dropdown="mode: click; delay-hide: 0; pos: right-center">
                        <div class="product-share ya-share2" data-services="vkontakte,facebook,odnoklassniki,gplus,twitter"></div>
                        <button class="dropdown-tooltip__close" onclick="UIkit.dropdown(this.parentNode).hide()" uk-icon="icon: close; ratio: .6"></button>
                    </div>
                </div>
            </div>
        </div>
        {if $related?}<div class="product_right-cell"></div>{/if}
    </div>

    <div class="product js-product">
        <div class="uk-grid uk-grid-small" uk-grid>
            <div class="uk-width-expand">
                <form class="ms2_form" method="post">
                    <input type="hidden" name="id" value="{$.resource.id}">
                    <h1 class="product__title">{$.resource.longtitle ?: $.resource.pagetitle}</h1>

                    <div class="product-grid uk-grid uk-grid-medium" uk-grid>
                        <div class="uk-width-1-2@s">
                            {'msGallery' | snippet : [
                                'tpl' => '@FILE chunks/product/gallery.tpl'
                            ]}
                            <div class="product__intro">
                                {$.resource.introtext | nl2br}
                            </div>
                        </div>
                        <div class="uk-width-1-2@s">
                            <div class="product__article">{$article}</div>
                            <div class="product__prices">
                                {if $old_price?}
                                    <div class="product__price-old">
                                        {$old_price}
                                        <svg width="12" height="14">
                                            <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
                                        </svg>
                                    </div>
                                {/if}
                                <div class="product__price">
                                    {$price}
                                    <svg width="22" height="26">
                                        <use href="{$.assets_url}web/img/svg-sprite.svg#ruble" />
                                    </svg>
                                </div>
                            </div>
                            {var $sizes = 'msOptions' | snippet : [
                                'tpl' => '@FILE chunks/product/options.tpl',
                                'options' => 'size',
                                'product' => $.resource.id
                            ]}
                            {if $sizes?}
                                <div class="product__misc product__row">
                                    {$sizes}
                                    <div class="product__dimensions">
                                        <a href="{'dimensions' | uri2id | url}" class="dimensions-link" target="_blank">
                                            <svg width="16" height="17">
                                                <use href="{$.assets_url}web/img/svg-sprite.svg#table_sizes" />
                                            </svg>
                                            Таблица размеров
                                        </a>
                                    </div>
                                </div>
                            {/if}
                            <div class="product__misc product__row">
                                <div class="product-options">
                                    <div class="product-options__label">
                                        Цвет
                                        <span class="product-options__desc js-options-color-label"></span>
                                    </div>
                                    <div class="product-options__values product-options__colors">
                                        {foreach $.resource.id | getColors as $color}
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
                            <button type="submit" class="product__cart uk-button button-bordered button-bordered--large" name="ms2_action" value="cart/add">Добавить в корзину</button>
                        </div>
                    </div>
                </form>
            </div>
            {if $related?}
            <div class="product_right-cell">
                <div class="product-also">
                    <div uk-slider="sets: true">
                        <div class="product-also__arrows">
                            <button class="slider-arrow uk-active" uk-slider-item="previous">
                                <svg width="15" height="12">
                                    <use href="/Extras/App/assets/components/app/web/img/svg-sprite.svg#slider-down"></use>
                                </svg>
                            </button>
                            <button class="slider-arrow" uk-slider-item="next">
                                <svg width="15" height="12">
                                    <use href="/Extras/App/assets/components/app/web/img/svg-sprite.svg#slider-up"></use>
                                </svg>
                            </button>
                        </div>
                        <div class="product-also__title">
                            С этим товаром смотрят
                        </div>
                        {var $resources = $_modx->getResources(
                            ['published' => 1, 'deleted' => 0],
                            [
                                'resources' => $related, 
                                'parents' => 0, 
                                'includeTVs' => 'image', 
                                'tvPrefix' => ''
                            ]
                        )}
                        <ul class="uk-slider-items uk-grid uk-grid-small uk-child-width-1-2@s uk-child-width-1-1@m">
                            {foreach $resources as $key=>$resource}
                                {if $key % 2 == 0}
                                    <li><div class="uk-grid uk-grid-small uk-child-width-1-2 uk-child-width-1-1@m" uk-grid>
                                {/if}
                                <div>
                                    <a href="{$resource.uri}" class="also-item">
                                        <img class="also-item__image" src="{$resource.image | pthumb : 'w=110&h=150&zc=1'}" alt="">
                                        <span class="also-item__name">
                                            {$resource.pagetitle}
                                        </span>
                                    </a>
                                </div>
                                {if $key % 2 == 1 || $key + 1 == count($resources)}
                                    </div></li>
                                {/if}
                            {/foreach}
                        </ul>
                    </div>
                </div>
            </div>
            {/if}
        </div>
    </div>
</div>

<div class="section-twilight">
    <div class="uk-container">
        <div class="product-others">
            <ul class="product-others__tabs" uk-switcher>
                <li><button>Популярные в данной категории</button></li>
                {if $viewed?}<li><button>Ранее просмотренные товары</button></li>{/if}
            </ul>
            <ul class="uk-switcher">
                <li class="product-others__slider js-products" uk-slider>
                    <div class="product-others__arrows">
                        <button class="slider-arrow uk-active" uk-slider-item="previous">
                            <svg width="12" height="15">
                                <use href="/Extras/App/assets/components/app/web/img/svg-sprite.svg#slider-left"></use>
                            </svg>
                        </button>
                        <button class="slider-arrow" uk-slider-item="next">
                            <svg width="12" height="15">
                                <use href="/Extras/App/assets/components/app/web/img/svg-sprite.svg#slider-right"></use>
                            </svg>
                        </button>
                    </div>
                    <div class="uk-slider-container uk-clearfix">
                        <ul class="uk-slider-items uk-child-width-1-3@s uk-child-width-1-4@m uk-child-width-1-5@l">
                            {'msProducts' | snippet : [
                                'tpl' => '@FILE chunks/resources/products.small.tpl',
                                'parents' => $.resource.id | primaryParent,
                                'limit' => 10,
                                'includeThumbs' => 'medium',
                                'sortby' => [
                                    'Data.favorite' => 'ASC'
                                ]
                            ]}
                        </ul>
                    </div>
                </li>
                {if $viewed?}
                <li class="product-others__slider js-products" uk-slider>
                    <div class="product-others__arrows">
                        <button class="slider-arrow uk-active" uk-slider-item="previous">
                            <svg width="12" height="15">
                                <use href="/Extras/App/assets/components/app/web/img/svg-sprite.svg#slider-left"></use>
                            </svg>
                        </button>
                        <button class="slider-arrow" uk-slider-item="next">
                            <svg width="12" height="15">
                                <use href="/Extras/App/assets/components/app/web/img/svg-sprite.svg#slider-right"></use>
                            </svg>
                        </button>
                    </div>
                    <ul class="uk-slider-items uk-child-width-1-3@s uk-child-width-1-4@m uk-child-width-1-5@l">
                        {'msProducts' | snippet : [
                            'tpl' => '@FILE chunks/resources/products.small.tpl',
                            'parents' => 'catalog' | uri2id,
                            'limit' => 10,
                            'includeThumbs' => 'medium',
                            'resources' => $viewed
                        ]}
                    </ul>
                </li>
                {/if}
            </ul>
        </div>

        <div class="product-desc">
            <div class="uk-grid" uk-grid>
                <div class="uk-width-1-2@s">
                    <div class="product-desc__title">Описание</div>
                    <div class="product-desc__content">
                        {$.resource.content}
                    </div>
                </div>
                <div class="uk-width-1-2@s">
                    <div class="product-desc__title">Запись на примерку</div>
                    {'!AjaxForm@Form' | snippet : [
                        'form' => '@FILE chunks/forms/subscribe.tpl',
                        'validate' => 'phone:required,rules:required'
                    ]}
                </div>
            </div>
        </div>
        
        {'!TicketComments' | snippet : [
            'allowGuest' => true,
            'enableCaptcha' => false,
            'autoPublish' => false,
            'autoPublishGuest' => false,
            'requiredFields' => 'rules,vote-overall,vote-price,vote-quality',
            'tplCommentForm' => '@FILE chunks/comments/form.tpl',
            'tplCommentFormGuest' => '@FILE chunks/comments/form.guest.tpl',
            'tplComments' => '@FILE chunks/comments/wrapper.tpl',
            'tplCommentGuest' => '@FILE chunks/comments/one.guest.tpl',
            'tplCommentAuth' => '@FILE chunks/comments/one.auth.tpl',
        ]}
    </div>
</div>
{/block}