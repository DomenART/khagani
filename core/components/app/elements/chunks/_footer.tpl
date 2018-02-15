<section class="short-categories">
    <div class="uk-container">
        {'pdoMenu' | snippet : [
            'level' => 2,
            'parents' => 'catalog' | uri2id,
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

<footer class="footer">
    <div class="uk-container">
        <div class="footer__first">
            <div class="footer__info">
                <div class="footer__address">
                    м: Чеховская,<br>
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
                        <a href="about">О компании</a>
                    </li>
                    <li>
                        <a href="showroom">Шоурум</a>
                    </li>
                    <li>
                        <a href="additional">Дополнительные услуги</a>
                    </li>
                    <li>
                        <a href="news">Новости</a>
                    </li>
                    <li>
                        <a href="find-us">Как нас найти</a>
                    </li>
                    <li>
                        <a href="terms-of-use">Пользовательское соглашение</a>
                    </li>
                    <li>
                        <a href="articles">Статьи</a>
                    </li>
                    <li>
                        <a href="contacts">Контакты</a>
                    </li>
                    <li>
                        <a href="privacy-policy">Политика обработки персональных данных</a>
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
                        <a href="#" class="social-groups__item social-groups__item--facebook">
                            <svg width="24" height="24">
                                <use href="/assets/components/app/web/img/svg-sprite.svg#facebook-letter" />
                            </svg>
                        </a>
                        <a href="#" class="social-groups__item social-groups__item--instagram">
                            <svg width="24" height="24">
                                <use href="/assets/components/app/web/img/svg-sprite.svg#instagram" />
                            </svg>
                        </a>
                    </div>
                    <a href="sitemap" class="footer__sitemap">Карта сайта</a>
                </div>
            </div>
        </div>

        <div class="footer__second">
            <div class="footer__copyright">
                {'app_copyright' | config | nl2br}
            </div>
            
            <div class="footer__counters">
                {'app_counters' | config}
            </div>
            
            <div class="footer__creator">
                <a href="http://domenart-studio.ru/" target="_blank" class="creator">Разработка <br>сайта</a>
            </div>
        </div>
    </div>
</footer>