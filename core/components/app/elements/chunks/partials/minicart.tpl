<a href="{'cart' | uri2id | url}" class="header-cart{$total_count > 0 ? ' header-cart--not-empty' : ''}" id="msMiniCart" title="">
    <svg width="34" height="26">
        <use href="{$.assets_url}web/img/svg-sprite.svg#cart" />
    </svg>
    <span class="header-cart__count ms2_total_count">{$total_count}</span>
</a>