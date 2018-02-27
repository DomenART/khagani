{extends 'file:templates/base.tpl'}

{block 'ogmeta'}
<meta property="og:type" content="article" />
<meta property="og:image" content="{'site_url' | config}{$.resource.image}">
<meta property="og:title" content="{$.resource.pagetitle}">
<meta property="og:url" content="{$.resource.id | url : ['scheme' => 'full']}">
<meta property="og:description" content="{$.resource.introtext}">
{/block}

{block 'content'}
{var $labels = []}
{foreach ($.resource.parent | resource : 'labels' | fromJSON) as $label}
    {var $labels[$label['key']] = $label['value']}
{/foreach}

<script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
<script src="//yastatic.net/share2/share.js"></script>

<div class="section-twilight">
    <div class="uk-container">
        <div class="page-breadcrumb">
            {'pdoCrumbs' | snippet : [
                'showHome' => true,
                'tpl' => '@FILE chunks/crumbs/link.tpl',
                'tplWrapper' => '@FILE chunks/crumbs/wrapper.tpl',
                'tplCurrent' => '@FILE chunks/crumbs/current.tpl'
            ]}
        </div>

        <div class="article">
            <div class="uk-grid uk-grid-small" uk-grid>
                <div class="uk-width-expand">
                    <h1 class="article__title">{$.resource.longtitle ?: $.resource.pagetitle}</h1>
                </div>
                <div class="article__right">
                    {if $.resource.class_key == 'Ticket'}
                    <a href="{$.resource.parent | url}" class="article__back uk-button button-blue">
                        <svg width="8" height="10">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#slider-left" />
                        </svg>
                        {$labels['back'] ?: 'Назад к статьям'}
                    </a>
                    {/if}
                </div>
            </div>
            
            <div class="uk-grid uk-grid-small" uk-grid>
                <div class="uk-width-expand">
                    <div class="article__left uk-grid uk-grid-collapse" uk-grid>
                        <div class="article-stats">
                            <div uk-sticky="media: @s; bottom: true; offset: 125">
                                {if $.resource.class_key == 'Ticket'}
                                <div class="article-stats__date">
                                    Опубликовано:<br>
                                    {$.resource.publishedon | date_format : '%d.%m.%Y'}
                                </div>
                                <div class="article-stats__type">{$.resource.article_type}</div>
                                <div class="article-stats__counts">
                                    <div class="article-count">
                                        <div class="article-count__icon">
                                            <svg width="20" height="20">
                                                <use href="{$.assets_url}web/img/svg-sprite.svg#eye" />
                                            </svg>
                                        </div>
                                        <div class="article-count__value">
                                            {$.resource.views}
                                        </div>
                                    </div>
                                    {'!xLike' | snippet : [
                                        'parent' => $.resource.id,
                                        'tpl' => '@FILE chunks/partials/xlike.article.tpl'
                                    ]}
                                </div>
                                {/if}
                                <div class="article-stats__share article-share">
                                    <div class="article-share__title">
                                        Рассказать<br>
                                        друзьям
                                    </div>
                                    <div class="article-share__buttons ya-share2" data-services="vkontakte,facebook,odnoklassniki,gplus,twitter"></div>
                                </div>
                            </div>
                        </div>
                        <div class="uk-width-expand">
                            <div class="article-body">
                                {if $.resource.image?}
                                <div class="article-body__image">
                                    <img src="{$.resource.image}" alt="">
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
                {if $.resource.article_products}
                <div class="article__right">
                    <div class="article-products">
                        <div class="article-products__title">
                            В статье использовались товары
                        </div>
                        <div class="uk-grid uk-grid-small uk-child-width-1-2@s uk-child-width-1-1@m" uk-grid>
                            {'msProducts' | snippet : [
                                'parents' => 0,
                                'includeThumbs' => 'medium',
                                'resources' => $.resource.article_products,
                                'tpl' => '@FILE chunks/resources/products.article.tpl'
                            ]}
                        </div>
                    </div>
                </div>
                {/if}
            </div>
        </div>

        {if $.resource.class_key == 'Ticket'}
            {var $seealso = 'pdoResources' | snippet : [
                'parents' => $.resource.parent,
                'resources' => '-'~$.resource.id,
                'limit' => 4,
                'includeTVs' => 'article_format,article_type,image,rating',
                'tvPrefix' => '',
                'tpl' => '@FILE chunks/resources/seealso.tile.tpl'
            ]}
            {if $seealso?}
            <div class="see-also">
                <div class="see-also__title">Вам может быть интересно:</div>
                <div class="see-also__grid">
                    {$seealso}
                </div>
            </div>
            {/if}
        {/if}
        
        <h3 class="socials-title">Следите за рекомендациями Khagani-man в социальных сетях</h3>
        {include 'file:chunks/partials/socials.tpl'}
    </div>
</div>
{/block}