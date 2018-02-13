{extends 'file:templates/base.tpl'}

{block 'content'}
<div class="home-slideshow">
    <div class="uk-container">
        <div class="slideshow" uk-slideshow="ratio: 7:3; animation: push">

            <ul class="uk-slideshow-items">
                <li>
                    <img src="{$.assets_url}web/img/slide-2.jpg" alt="" uk-cover>
                </li>
                <li>
                    <img src="{$.assets_url}web/img/slide-1.jpg" alt="" uk-cover>
                </li>
            </ul>

            <button class="slideshow__prev" uk-slideshow-item="previous">
                <span uk-icon="icon: chevron-left; ratio: 2"></span>
            </button>
            <button class="slideshow__next" uk-slideshow-item="next">
                <span uk-icon="icon: chevron-right; ratio: 2"></span>
            </button>

            <div class="slideshow-info">
                <ul class="slideshow-info__list" uk-height-match="target: .slideshow-info__flex">
                    <li uk-slideshow-item="0">
                        <div class="slideshow-info__flex">
                            <div class="slideshow-info__title">Галстук в подарок</div>
                            <div class="slideshow-info__city">
                                <span>только в январе</span>
                            </div>
                        </div>
                        <div class="slideshow-info__more">
                            <a href="#" class="uk-button button-blue">
                                Узнать больше
                                <svg width="8" height="10">
                                    <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                                </svg>
                            </a>
                        </div>
                    </li>
                    <li uk-slideshow-item="1">
                        <div class="slideshow-info__flex">
                            <div class="slideshow-info__title">Ателье - магазин</div>
                            <div class="slideshow-info__desc">модной мужской одежды из Турции</div>
                            <div class="slideshow-info__city">
                                <span>В Москве</span>
                            </div>
                        </div>
                        <div class="slideshow-info__more">
                            <a href="#" class="uk-button button-blue">
                                Узнать больше
                                <svg width="8" height="10">
                                    <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                                </svg>
                            </a>
                        </div>
                    </li>
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
                <div class="home-opening">
                    <div class="home-opening__info">
                        <div class="home-opening__desc">
                            Открытие шоурума
                        </div>
                        <div class="home-opening__title">
                            Метро Чеховская
                        </div>
                        <a href="#" class="home-opening__more uk-button button-blue">
                            Узнать больше
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
                    <a href="#" class="home-range__open">
                        перейти в каталог
                        <span uk-icon="icon: arrow-right; ratio: 0.8"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

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
                {'msProducts' | snippet : [
                    'tpl' => '@FILE chunks/resources/offers.item.slider.tpl', 'includeThumbs' => 'medium',
                    'parents' => 0,
                    'where' => [
                        'Data.new' => true
                    ]
                ]}
            </ul>
        </div>
    </div>
</section>

<section class="section-home">
    <div class="uk-container">
        <h2 class="section-home__title">Популярное</h2>
        <div class="offers">
            {'msProducts' | snippet : [
                'tpl' => '@FILE chunks/resources/offers.item.tpl',
                'parents' => 0,
                'includeThumbs' => 'medium',
                'optionFilters' => [
                    'Data.favorite' => true
                ]
            ]}
        </div>
    </div>
</section>

<section class="section-home">
    <div class="uk-container">
        <h2 class="section-home__title">Каталог</h2>
        <div class="catalog">
            <div class="catalog-item">
                <a href="#">
                    <img src="{$.assets_url}web/img/stylishly.jpg" alt="" class="catalog-item__image">
                </a>
                <div class="catalog-item__info">
                    <div class="catalog-item__title">
                        Стильные костюмы
                    </div>
                    <div class="catalog-item__desc">
                        для торжества и на каждый день
                    </div>
                    <a href="#" class="catalog-item__more uk-button button-blue">
                        В раздел
                        <svg width="6" height="7">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="catalog-item">
                <a href="#">
                    <img src="{$.assets_url}web/img/trend.jpg" alt="" class="catalog-item__image">
                </a>
                <div class="catalog-item__info">
                    <div class="catalog-item__title">
                        Тренд сезона
                    </div>
                    <div class="catalog-item__desc">
                        Самое актуальное и модное
                    </div>
                    <a href="#" class="catalog-item__more uk-button button-blue">
                        В раздел
                        <svg width="6" height="7">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="catalog-item">
                <a href="#">
                    <img src="{$.assets_url}web/img/accessories.jpg" alt="" class="catalog-item__image">
                </a>
                <div class="catalog-item__info">
                    <div class="catalog-item__title">
                        Аксессуары
                    </div>
                    <div class="catalog-item__desc">
                        Описание раздела
                    </div>
                    <a href="#" class="catalog-item__more uk-button button-blue">
                        В раздел
                        <svg width="6" height="7">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="catalog-item">
                <a href="#">
                    <img src="{$.assets_url}web/img/outerwear.jpg" alt="" class="catalog-item__image">
                </a>
                <div class="catalog-item__info">
                    <div class="catalog-item__title">
                        Верхняя одежда
                    </div>
                    <div class="catalog-item__desc">
                        Описание раздела
                    </div>
                    <a href="#" class="catalog-item__more uk-button button-blue">
                        В раздел
                        <svg width="6" height="7">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="catalog-item">
                <a href="#">
                    <img src="{$.assets_url}web/img/shoes.jpg" alt="" class="catalog-item__image">
                </a>
                <div class="catalog-item__info">
                    <div class="catalog-item__title">
                        Туфли
                    </div>
                    <div class="catalog-item__desc">
                        Описание раздела
                    </div>
                    <a href="#" class="catalog-item__more uk-button button-blue">
                        В раздел
                        <svg width="6" height="7">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#slider-right" />
                        </svg>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

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
                                <li>
                                    <div class="module-slider__video">
                                        <video controls>
                                            <source src="{$.assets_url}web/img/review-1.mp4" type="video/mp4">
                                            <source src="{$.assets_url}web/img/review-1.webm" type="video/webm">
                                            <source src="{$.assets_url}web/img/review-1.ogg" type="video/ogg"> Sorry, your browser doesn't support embedded videos, but don't worry, you can
                                            <a href="{$.assets_url}web/img/review-1.mp4">download it</a>
                                            and watch it with your favorite video player!
                                        </video>
                                    </div>
                                </li>
                                <li>
                                    <div class="module-slider__video">
                                        <video controls>
                                            <source src="{$.assets_url}web/img/review-2.mp4" type="video/mp4">
                                            <source src="{$.assets_url}web/img/review-2.webm" type="video/webm">
                                            <source src="{$.assets_url}web/img/review-2.ogg" type="video/ogg"> Sorry, your browser doesn't support embedded videos, but don't worry, you can
                                            <a href="{$.assets_url}web/img/review-1.mp4">download it</a>
                                            and watch it with your favorite video player!
                                        </video>
                                    </div>
                                </li>
                                <li>
                                    <div class="module-slider__video">
                                        <video controls>
                                            <source src="{$.assets_url}web/img/review-3.mp4" type="video/mp4">
                                            <source src="{$.assets_url}web/img/review-3.webm" type="video/webm">
                                            <source src="{$.assets_url}web/img/review-3.ogg" type="video/ogg"> Sorry, your browser doesn't support embedded videos, but don't worry, you can
                                            <a href="{$.assets_url}web/img/review-1.mp4">download it</a>
                                            and watch it with your favorite video player!
                                        </video>
                                    </div>
                                </li>
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
        <h3 class="section-twilight__title">#khaganiman</h3>
        <div class="section-twilight__grid">
            <div class="social-item">
                <div class="social-item__heading">
                    <div class="social-item__title">
                        <svg width="24" height="24" class="social-item__icon">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#instagram" />
                        </svg>
                        @khagani_man
                    </div>
                    <a href="#" class="social-item__subscribe">Подписаться</a>
                </div>
                <div class="social-item__body">
                    instagram widget
                </div>
            </div>
            <div class="social-item">
                <div class="social-item__heading">
                    <div class="social-item__title">
                        <svg width="24" height="24" class="social-item__icon">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#facebook-square" />
                        </svg>
                        KHAGANI_man
                    </div>
                    <a href="#" class="social-item__subscribe">Подписаться</a>
                </div>
                <div class="social-item__body">
                    facebook widget
                </div>
            </div>
            <div class="social-item">
                <div class="social-item__heading">
                    <div class="social-item__title">
                        <svg width="24" height="24" class="social-item__icon">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#marker" />
                        </svg>
                        МЫ НА КАРТЕ
                    </div>
                </div>
                <div class="social-item__body">
                    <div class="contacts-info">
                        <div class="contacts-info__row contacts-info__row--metro">
                            Чеховская,</b>
                        </div>
                        <div class="contacts-info__row contacts-info__row--address">
                            ул. Страстной бульвар 6, стр-е 1, 5 эт. м-н 504
                        </div>
                        <div class="contacts-info__row contacts-info__row--time">
                            Ежедневно с
                            <b>10:30</b> до
                            <b>21:00</b>
                        </div>
                        <div class="contacts-info__row">
                            <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A21bf5b9262ef7176c2a2952cf137bc1a01475bdf37c792903bcdcb3c328edcb4&amp;width=100%25&amp;height=240&amp;lang=ru_RU&amp;scroll=true"></script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{/block}