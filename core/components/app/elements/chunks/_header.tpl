<div class="js-mobile-menu"></div>
<div itemscope itemtype="http://schema.org/WPHeader" uk-sticky>
    <section class="toolbar">
        <div class="uk-container">
            <button class="toolbar__menu uk-button button-purple" uk-toggle="target: html; cls: mobile-menu-opened uk-modal-page">
                <span uk-icon="icon: menu"></span>
            </button>
            <a href="{'page.search' | config | url}" class="toolbar__search uk-button button-blue">
                <span uk-icon="icon: search"></span>
            </a>
            <a href="{'page.contacts' | config | url}" class="toolbar-subscribe uk-button button-blue" uk-toggle="target: #subscribe">
                <span class="toolbar-subscribe__icon" uk-icon="icon: mail"></span>
                <span class="toolbar-subscribe__text">Запись на примерку</span>
                <span class="toolbar-subscribe__tip" title="Ваш график строго расписан и у вас нет ни минуты лишнего времени? Запишитесь на примерку, в удобное вам время наши консультанты будут ждать вас." uk-tooltip>?</span>
            </a>
            {'pdoMenu' | snippet : [
                'parents' => 0,
                'level' => 1,
                'outerClass' => 'toolbar-menu js-menu-main',
                'tpl' => '@INLINE <li[[+classes]]><a itemprop="url" href="[[+link]]" [[+attributes]]>[[+menutitle]]</a>[[+wrapper]]</li>',
                'tplOuter' => '@INLINE <ul[[+classes]] itemscope itemtype="http://www.schema.org/SiteNavigationElement">[[+wrapper]]</ul>'
            ]}
        </div>
    </section>

    <section class="header" itemscope itemtype="https://schema.org/Organization">
        <div class="uk-container">
            <div class="header__grid">
                <meta itemprop="name" content="{'site_name' | config}">
                <meta itemprop="address" content="{'app_address' | config}">
                <a itemprop="url" href="{'site_url' | config}" class="header__logo"><img itemprop="logo" src="/assets/components/app/web/img/logo.png" alt=""></a>
                {'pdoMenu' | snippet : [
                    'parents' => 'page.catalog' | config,
                    'level' => 2,
                    'parentClass' => 'parent',
                    'outerClass' => 'header-menu js-menu-catalog',
                    'innerClass' => 'header-menu__submenu',
                    'includeTVs' => 'category_type',
                    'where' => ['category_type'=>null]
                ]}
                {'!mSearchForm' | snippet : [
                    'pageId' => 'page.search' | config,
                    'tplForm' => '@FILE chunks/partials/searchform.tpl'
                ]}
                <div class="header__phone" itemprop="telephone">
                    +7 (926) 26-910-49
                </div>
                {'!msMiniCart' | snippet : [
                    'tpl' => '@FILE chunks/partials/minicart.tpl'
                ]}
            </div>
        </div>
    </section>
</div>

<div id="subscribe" class="modal-subscribe" uk-modal>
    <div class="uk-modal-dialog uk-modal-body modal-body-bg">
        <div class="uk-modal-title">Запись на примерку</div>
        <button class="uk-modal-close-default" type="button" uk-close></button>
        {'!AjaxForm@Form' | snippet : [
            'form' => '@FILE chunks/forms/subscribe_modal.tpl',
            'validate' => 'phone:required,rules:required'
        ]}
    </div>
</div>

<div id="question" uk-modal>
    <div class="uk-modal-dialog uk-modal-body modal-body-bg">
        <div class="uk-modal-title">Задать вопрос</div>
        <button class="uk-modal-close-default" type="button" uk-close></button>
        {'!AjaxForm@Form' | snippet : [
            'form' => '@FILE chunks/forms/question.tpl',
            'validate' => 'phone:required,rules:required'
        ]}
    </div>
</div>

<div id="order" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <div class="uk-modal-title">Оформить заказ</div>
        <button class="uk-modal-close-default" type="button" uk-close></button>
        {'!AjaxForm@Form' | snippet : [
            'form' => '@FILE chunks/forms/order.tpl',
            'validate' => 'phone:required,rules:required'
        ]}
    </div>
</div>