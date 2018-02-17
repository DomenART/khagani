<div class="articles-item">
    <div class="articles-item__figure">
        <a href="{$uri}">
            {if $article_type?}
                <span class="articles-item__type">{$article_type}</span>
            {/if}
            {if $article_format?}
                <span class="articles-item__format">
                    {switch $article_format}
                    {case 'Статья'}
                    <svg width="18" height="18">
                        <use href="{$.assets_url}web/img/svg-sprite.svg#format-article" />
                    </svg>
                    {case 'Видео'}
                    <svg width="18" height="18">
                        <use href="{$.assets_url}web/img/svg-sprite.svg#format-video" />
                    </svg>
                    {/switch}
                    {$article_format}
                </span>
            {/if}
            <img src="{$image | pthumb : 'w=280&h=220&zc=1'}" alt="{$pagetitle}" class="articles-item__image" id="image-{$id}">
        </a>
    </div>
    <div class="articles-item__body">
        <div class="articles-item__name">
            <a href="{$uri}">{$pagetitle}</a>
        </div>
        <div class="articles-item__rating">
            {'!xLike' | snippet : [
                'parent' => $id,
                'tpl' => '@FILE chunks/partials/xlike.articles.tpl'
            ]}
        </div>
        <div class="articles-item__more">
            <a href="{$uri}" class="uk-button button-framelight">Читать полностью</a>
        </div>
    </div>
</div>