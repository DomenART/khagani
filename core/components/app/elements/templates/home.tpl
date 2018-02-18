{extends 'file:templates/base.tpl'}

{block 'content'}
<div class="home-slideshow">
    <div class="uk-container">
        <div class="slideshow js-slideshow">

            <ul class="uk-slideshow-items">
                {foreach $.resource.slideshow | fromJSON as $slide}
                    <li>
                        <img src="{$slide['image']}" alt="" uk-cover>
                    </li>
                {/foreach}
            </ul>

            <button class="slideshow__prev" uk-slideshow-item="previous">
                <span uk-icon="icon: chevron-left; ratio: 2"></span>
            </button>
            <button class="slideshow__next" uk-slideshow-item="next">
                <span uk-icon="icon: chevron-right; ratio: 2"></span>
            </button>

            <div class="slideshow-info">
                <ul class="slideshow-info__list" uk-height-match="target: .slideshow-info__flex">
                    {foreach $.resource.slideshow | fromJSON as $slide}
                    <li class="js-slideshow-item">
                        <div class="slideshow-info__flex">
                            <div class="slideshow-info__title">{$slide['label_1']}</div>
                            <div class="slideshow-info__desc">{$slide['label_2']}</div>
                            <div class="slideshow-info__city">
                                <span>{$slide['label_3']}</span>
                            </div>
                        </div>
                        <div class="slideshow-info__more">
                            <a href="{$slide['url']}" class="uk-button button-blue">
                                Узнать больше
                                <svg width="8" height="10">
                                    <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                                </svg>
                            </a>
                        </div>
                    </li>
                    {/foreach}
                </ul>
                <ul class="uk-slideshow-nav slideshow-info__nav"></ul>
            </div>

        </div>
    </div>
</div>

<div class="home-showroom">
    <div class="uk-container">
        <div class="uk-grid uk-grid-medium uk-grid-match" uk-grid>
            <div class="uk-width-1-2@s uk-width-2-3@m">
                <div class="home-opening" style="background-image:url('{$.resource.banner_image}')">
                    <div class="home-opening__info">
                        <div class="home-opening__desc">
                            {$.resource.banner_title}
                        </div>
                        <div class="home-opening__title">
                            {$.resource.banner_desc}
                        </div>
                        <a href="{$.resource.banner_link}" class="home-opening__more uk-button button-blue">
                            {$.resource.banner_button}
                            <svg width="8" height="10">
                                <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
            <div class="uk-width-1-2@s uk-width-1-3@m">
                <div class="home-range">
                    <div class="home-range__desc">
                        ОГРОМНЫЙ ВЫБОР НА ЛЮБОЙ ВКУС И ЦВЕТ
                    </div>
                    <div class="home-range__title">
                        5 000 видов костюмов
                    </div>
                    <a href="{'page.clothes' | config | url}" class="home-range__open">
                        перейти в каталог
                        <span uk-icon="icon: arrow-right; ratio: 0.8"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

{var $new = 'msProducts' | snippet : [
    'tpl' => '@FILE chunks/resources/offers.item.slider.tpl', 
    'includeThumbs' => 'medium',
    'parents' => ('page.clothes' | config),
    'where' => [
        'Data.new' => true
    ]
]}
{if $new?}
<section class="section-home" uk-slider="sets: false">
    <div class="uk-container">
        <h2 class="section-home__title">Новая коллекция</h2>
        <div class="section-home__arrows">
            <button class="arrow-square" uk-slider-item="previous">
                <span uk-icon="icon: chevron-left; ratio: 1.4"></span>
            </button>
            <button class="arrow-square" uk-slider-item="next">
                <span uk-icon="icon: chevron-right; ratio: 1.4"></span>
            </button>
        </div>
        <div class="uk-slider-container products-slider-container">
            <ul class="uk-grid uk-grid-medium uk-slider-items uk-child-width-1-2@s uk-child-width-1-3@m">
                {$new}
            </ul>
        </div>
    </div>
</section>
{/if}

{var $popular = 'msProducts' | snippet : [
    'tpl' => '@FILE chunks/resources/offers.item.tpl',
    'parents' => ('page.clothes' | config),
    'includeThumbs' => 'medium',
    'where' => [
        'Data.favorite' => true
    ]
]}
{if $popular?}
<section class="section-home">
    <div class="uk-container">
        <h2 class="section-home__title">Тренд</h2>
        <div class="offers">
            {$popular}
        </div>
    </div>
</section>
{/if}

{if $.resource.catalog?}
<section class="section-home">
    <div class="uk-container">
        <h2 class="section-home__title">Каталог</h2>
        <div class="catalog">
            {foreach $.resource.catalog | fromJSON as $category}
            <div class="catalog-item">
                <a href="{$category['url']}">
                    <img src="{$category['image']}" alt="" class="catalog-item__image">
                </a>
                <div class="catalog-item__info">
                    <div class="catalog-item__title">
                        {$category['title']}
                    </div>
                    <div class="catalog-item__desc">
                        {$category['desc']}
                    </div>
                    <a href="{$category['url']}" class="catalog-item__more uk-button button-blue">
                        В раздел
                        <svg width="6" height="7">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                        </svg>
                    </a>
                </div>
            </div>
            {/foreach}
        </div>
    </div>
</section>
{/if}

<section class="section-content">
    <div class="uk-container">
        <div class="section-content__heading">
            <h1>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
            {if $_modx->resource.description?}
            <h2>{$_modx->resource.description}</h2>
            {/if}
        </div>
        <div class="uk-grid" uk-grid>
            <div class="uk-width-1-2@m">
                <div class="section-content__text">
                    {$_modx->resource.content}
                </div>
            </div>
            <div class="uk-width-1-2@m">
                <div class="section-content__misc">
                    <div class="module-slider" uk-slider>
                        <div class="module-slider__headline">
                            <h3 class="module-slider__title">Отзывы наших покупателей</h3>
                            <div class="module-slider__arrows">
                                <button class="slider-arrow" uk-slider-item="previous">
                                    <svg width="12" height="15">
                                        <use href="{$.assets_url}web/img/svg-sprite.svg#slider-left" />
                                    </svg>
                                </button>
                                <button class="slider-arrow" uk-slider-item="next">
                                    <svg width="12" height="15">
                                        <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                                    </svg>
                                </button>
                            </div>
                        </div>
                        <div class="module-slider__body uk-slider-container">
                            <ul class="uk-grid uk-slider-items uk-child-width-1-1">
                                {foreach ($.resource.reviews | fromJSON) as $review}
                                    <li>
                                        <div class="module-slider__video">
                                            <iframe width="100%" height="400" src="https://www.youtube.com/embed/{$review['youtube']}?rel=0&amp;showinfo=0" frameborder="0" allow="autoplay; encrypted-media"
                                                allowfullscreen></iframe>
                                        </div>
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                    <div class="module-slider">
                        <div class="module-slider__headline">
                            <h3 class="module-slider__title">Запись на примерку</h3>
                        </div>
                        <div class="module-slider__body">
                            {'!AjaxForm@Form' | snippet : [
                                'form' => '@FILE chunks/forms/subscribe.tpl',
                                'validate' => 'phone:required,rules:required'
                            ]}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section-twilight">
    <div class="uk-container">
        {include 'file:chunks/partials/socials.tpl'}
    </div>
</section>
{/block}