{extends 'file:templates/base.tpl'}

{block 'content'}
<div class="section-twilight">
    <div class="uk-container">

        <div class="uk-grid uk-grid-small" uk-grid>
            <div class="uk-width-expand">
                <h1 class="article__title">{$.resource.longtitle ?: $.resource.pagetitle}</h1>
            </div>
            <div class="article__right">
                <a href="{'page.catalog' | config | url}" class="article__back uk-button button-blue">
                    Смотреть каталог
                </a>
            </div>
        </div>

        <div class="page-404__code">404</div>

        <div class="article-subscribe">
            <div class="article-subscribe__title">
                Введите другой поисковой запрос
            </div>
            <div>
                <form action="{'page.search' | config | url}" class="article-subscribe__form">
                    <input type="text" name="query" class="article-subscribe__input" placeholder="">
                    <button type="submit" class="article-subscribe__submit">найти</button>
                </form>
            </div>
        </div>

        <div class="page-404__or-catalog">
            <a href="{'page.catalog' | config | url}">Или посмотрите в каталоге</a>
        </div>
    </div>
</div>
{/block}