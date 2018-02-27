 {if $files?}
 <div class="product-gallery js-options-color-images uk-clearfix" uk-slideshow="animation: pull; ratio: 3:4">
    <ul class="product-gallery__thumbs">
        {foreach $files as $key=>$file}
            <li uk-slideshow-item="{$key}">
                <img src="{$file['small']}" alt="" title="" itemprop="image">
            </li>
        {/foreach}
    </ul>
    <div class="product-gallery__slideshow">
        <ul class="uk-slideshow-items" uk-lightbox>
            {foreach $files as $file}
                <li class="js-options-color-image-{$file['id']}">
                    <img src="{$file['medium']}" alt="" title="" uk-cover>
                    <a href="{$file['url']}" uk-icon="search" title="{$file['name']}" class="gallery-link"></a>
                </li>
            {/foreach}
        </ul>
        <button class="slidenav-previous" uk-icon="icon: chevron-left; ratio: 1.5" uk-slideshow-item="previous"></button>
        <button class="slidenav-next" uk-icon="icon: chevron-right; ratio: 1.5" uk-slideshow-item="next"></button>
    </div>
</div>
{/if}

