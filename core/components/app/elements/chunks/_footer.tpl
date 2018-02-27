<section class="short-categories">
    <div class="uk-container">
        {'pdoMenu' | snippet : [
            'level' => 2,
            'parents' => 'page.catalog' | config,
            'includeTVs' => 'image,category_type',
            'tvPrefix' => '',
            'where' => ['category_type'=>null],
            'tplOuter' => '@FILE chunks/partials/short_categories.outer.tpl',
            'tpl' => '@FILE chunks/partials/short_categories.row.tpl',
            'tplInner' => '@FILE chunks/partials/short_categories.inner_outer.tpl',
            'tplInnerRow' => '@FILE chunks/partials/short_categories.inner_row.tpl',
        ]}
    </div>
</section>

<footer class="footer" itemscope itemtype="http://schema.org/WPFooter">
    <div class="uk-container">
        <div class="footer__first">
            <div class="footer__info">
                <div class="footer__address">
                    м. Чеховская,<br>
                    {'app_address' | config}
                </div>
                <div class="footer__phones">
                    +7 (926) 26-910-49<br>
                    +7 (499) 34-666-14
                </div>
            </div>

            <div class="footer__links">
                <ul class="footer-menu">
                    <li>
                        <a href="{'page.about' | config | url}">О компании</a>
                    </li>
                    <li>
                        <a href="{'page.showroom' | config | url}">Шоурум</a>
                    </li>
                    <li>
                        <a href="{'page.additional_services' | config | url}">Дополнительные услуги</a>
                    </li>
                    <li>
                        <a href="{'page.news' | config | url}">Новости</a>
                    </li>
                    <li>
                        <a href="{'page.find_us' | config | url}">Как нас найти</a>
                    </li>
                    <li>
                        <a href="{'page.terms_of_use' | config | url}">Пользовательское соглашение</a>
                    </li>
                    <li>
                        <a href="{'page.articles' | config | url}">Статьи</a>
                    </li>
                    <li>
                        <a href="{'page.contacts' | config | url}">Контакты</a>
                    </li>
                    <li>
                        <a href="{'page.privacy_policy' | config | url}">Политика обработки персональных данных</a>
                    </li>
                </ul>
            </div>

            <div class="footer__misc">
                <form class="subscribe-form">
                    <input type="text" class="subscribe-form__input" placeholder="Введите ваш e-mail">
                    <button type="submit" class="subscribe-form__submit">Подписаться
                        <br>на рассылку</button>
                </form>

                <div class="footer__social">
                    <div class="social-groups">
                        <a href="https://www.facebook.com/magazinkostumov/" class="social-groups__item social-groups__item--facebook" target="_blank">
                            <svg width="24" height="24">
                                <use href="{$.assets_url}web/img/svg-sprite.svg#facebook-letter" />
                            </svg>
                        </a>
                        <a href="https://www.instagram.com/khagani_man/" class="social-groups__item social-groups__item--instagram" target="_blank">
                            <svg width="24" height="24">
                                <use href="{$.assets_url}web/img/svg-sprite.svg#instagram" />
                            </svg>
                        </a>
                        <a href="https://www.youtube.com/channel/UCA0lVs1ikQNhdvE9kVbN8Dw" class="social-groups__item social-groups__item--youtube" target="_blank">
                            <svg width="24" height="24">
                                <use href="{$.assets_url}web/img/svg-sprite.svg#youtube" />
                            </svg>
                        </a>
                        <a href="https://ru.pinterest.com/khaganiman/" class="social-groups__item social-groups__item--pinterest" target="_blank">
                            <svg width="24" height="24">
                                <use href="{$.assets_url}web/img/svg-sprite.svg#pinterest" />
                            </svg>
                        </a>
                        <a href="https://ok.ru/group/53902208073924" class="social-groups__item social-groups__item--odnoklassniki" target="_blank">
                            <svg width="24" height="24">
                                <use href="{$.assets_url}web/img/svg-sprite.svg#odnoklassniki" />
                            </svg>
                        </a>
                        <a href="https://vk.com/khaganiman" class="social-groups__item social-groups__item--vk" target="_blank">
                            <svg width="24" height="24">
                                <use href="{$.assets_url}web/img/svg-sprite.svg#vk" />
                            </svg>
                        </a>
                        <a href="https://twitter.com/Khagani_man" class="social-groups__item social-groups__item--twitter" target="_blank">
                            <svg width="24" height="24">
                                <use href="{$.assets_url}web/img/svg-sprite.svg#twitter" />
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer__second">
            <div class="footer__copyright">
                {'app_copyright' | config | nl2br}
            </div>
            
            <div class="footer__counters">
                {'app_counters' | config}
                <a href="{'page.sitemap' | config | url}" class="footer__sitemap">Карта сайта</a>
            </div>
            
            <div class="footer__creator">
                <a href="http://domenart-studio.ru/" target="_blank" class="creator">Разработка <br>сайта</a>
            </div>
        </div>
    </div>
</footer>

<div class="scrolltop" uk-scroll uk-icon="icon: arrow-up; ratio: 1.5"></div>