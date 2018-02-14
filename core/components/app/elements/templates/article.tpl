{extends 'file:templates/base.tpl'}

{block 'content'}

<script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
<script src="//yastatic.net/share2/share.js"></script>

<div class="section-twilight">
    <div class="uk-container">
        {'pdoCrumbs' | snippet : [
            'showHome' => true,
            'tplWrapper' => '@INLINE <div class="page-breadcrumb"><ul class="breadcrumb">{$output}</ul></div>',
            'tplCurrent' => '@INLINE <li><span>{$menutitle}</span></li>'
        ]}

        <div class="article">
            <div class="uk-grid uk-grid-small" uk-grid>
                <div class="uk-width-expand">
                    <h1 class="article__title">{$.resource.longtitle ?: $.resource.pagetitle}</h1>
                </div>
                <div class="article__right">
                    <a href="{$.resource.parent | url}" class="article__back uk-button button-blue">
                        <svg width="8" height="10">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#slider-left" />
                        </svg>
                        Назад к статьям
                    </a>
                </div>
            </div>
            
            <div class="uk-grid uk-grid-small" uk-grid>
                <div class="uk-width-expand">
                    <div class="article__left uk-grid uk-grid-collapse" uk-grid>
                        <div class="article-stats">
                            <div class="article-stats__date">
                                Опубликовано:<br>
                                {$.resource.publishedon | date_format : '%d.%m.%Y'}
                            </div>
                            <div class="article-stats__type">{$.resource.article_type[1]}</div>
                            <div class="article-stats__counts">
                                <div class="article-stats__count">
                                    <svg width="20" height="20">
                                        <use href="{$.assets_url}web/img/svg-sprite.svg#eye" />
                                    </svg>
                                    {$.resource.views}
                                </div>
                                {'!xLike' | snippet : [
                                    'parent' => $.resource.id,
                                    'tpl' => '@FILE chunks/partials/xlike.article.tpl'
                                ]}
                            </div>
                            <div class="article-stats__share article-share">
                                <div class="article-share__title">
                                    Рассказать<br>
                                    друзьям
                                </div>
                                <div class="article-share__buttons ya-share2" data-services="vkontakte,facebook,odnoklassniki,gplus,twitter"></div>
                            </div>
                        </div>
                        <div class="uk-width-expand">
                            <div class="article-body">
                                {if $.resource.image[1]?}
                                <div class="article-body__image">
                                    <img src="{$.resource.image[1]}" alt="">
                                </div>
                                {/if}
                                {if $.resource.description?}
                                    <h2 class="article-body__subtitle">
                                        {$.resource.description}
                                    </h2>
                                {/if}
                                <div class="article-body__content">{$.resource.content}</div>
                            </div>
                        </div>
                    </div>
                    <div class="article-subscribe">
                        <div class="article-subscribe__title">
                            Хотите быть в курсе последних тенденций мужской моды и стиля?
                        </div>
                        <div>
                            <form class="article-subscribe__form">
                                <input type="text" class="article-subscribe__input" placeholder="Введите ваш e-mail">
                                <button type="submit" class="article-subscribe__submit">Подписаться</button>
                            </form>
                        </div>
                    </div>
                </div>
                {if $.resource.article_products[1]}
                <div class="article__right">
                    <div class="article-products">
                        <div class="article-products__title">
                            В статье использовались товары
                        </div>
                        <div class="uk-grid uk-grid-small uk-child-width-1-2@s uk-child-width-1-1@m" uk-grid>
                            {'msProducts' | snippet : [
                                'parents' => 0,
                                'includeThumbs' => 'medium',
                                'resources' => $.resource.article_products[1],
                                'tpl' => '@FILE chunks/resources/products.article.tpl'
                            ]}
                        </div>
                    </div>
                </div>
                {/if}
            </div>
        </div>

        <div class="see-also">
            <div class="see-also__title">Вам может быть интересно:</div>
            <div class="see-also__grid">
                {'pdoResources' | snippet : [
                    'parents' => $.resource.parent,
                    'resources' => '-'~$.resource.id,
                    'limit' => 4,
                    'includeTVs' => 'article_format,article_type,image,rating',
                    'tvPrefix' => '',
                    'tpl' => '@FILE chunks/resources/seealso.tile.tpl'
                ]}
            </div>
        </div>
        
        <h3 class="socials-title">Следите за рекомендациями Khagani-man в социальных сетях</h3>
        {include 'file:chunks/partials/socials.tpl'}
    </div>
</div>
{/block}