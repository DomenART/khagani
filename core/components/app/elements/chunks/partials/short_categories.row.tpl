<article class="short-category">
    <a href="{$link}" class="short-category__image">
        <img src="{$image | pthumb : 'w=66&h=66&zc=1'}" alt="">
    </a>
    <div class="short-category__info">
        <h6 class="short-category__name">
            <a href="{$link}">{$menutitle}</a>
        </h6>
        {$wrapper}
    </div>
</article>