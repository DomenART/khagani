<div class="js-mobile-menu"></div>
<div uk-sticky>
    <section class="toolbar">
        <div class="uk-container">
            <button class="toolbar__menu uk-button button-purple" uk-toggle="target: #mobile-menu; cls: mobile-menu--open">
                <span uk-icon="icon: menu"></span>
            </button>
            <button class="toolbar__search uk-button button-blue">
                <span uk-icon="icon: search"></span>
            </button>
            <a href="#" class="toolbar-subscribe uk-button button-blue">
                <span class="toolbar-subscribe__icon" uk-icon="icon: pencil"></span>
                <span class="toolbar-subscribe__text">Запись на примерку</span>
                <span class="toolbar-subscribe__tip" title="Ваш график строго расписан и у вас нет ни минуты лишнего времени? Запишитесь на примерку, в удобное вам время наши консультанты будут ждать вас." uk-tooltip>?</span>
            </a>
            {'pdoMenu' | snippet : [
                'parents' => 0,
                'outerClass' => 'toolbar-menu js-menu-main'
            ]}
        </div>
    </section>

    <section class="header">
        <div class="uk-container">
            <div class="header__grid">
                <a href="/" class="header__logo"><img src="/assets/components/app/web/img/logo.png" alt=""></a>
                {'pdoMenu' | snippet : [
                    'parents' => 'catalog' | uri2id,
                    'outerClass' => 'header-menu js-menu-catalog',
                    'innerClass' => 'header-menu__submenu'
                ]}
                <form class="header-search">
                    <input type="text" placeholder="Поиск по сайту" class="header-search__input">
                    <button type="submit" class="header-search__submit"><span uk-icon="icon: search"></span></button>
                </form>
                <div class="header__phone">
                    +7 (926) 960-60-69
                </div>
                <a href="#" class="header-cart header-cart--not-empty">
                    <svg width="34" height="26">
                        <use href="/assets/components/app/web/img/svg-sprite.svg#cart" />
                    </svg>
                    <span class="header-cart__count">1</span>
                </a>
            </div>
        </div>
    </section>
</div>