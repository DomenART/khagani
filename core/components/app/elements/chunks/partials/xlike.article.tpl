<div class="[ js-xlike-object ]" data-xlike-propkey="{$propkey}" data-xlike-parent="{$parent}">
    <button
        class="article-count {$value > 0 ? 'xlike__link_active' : ''} {$can ? 'js-xlike-button' : ''}" 
        {$can ? 'data-xlike-value="1" href="javascript:undefined;"' : ''}
    >
        <div class="article-count__icon">
            <svg width="18" height="18">
                <use href="{$.assets_url}web/img/svg-sprite.svg#like" />
            </svg>
        </div>
        <span class="article-count__value js-xlike-number">{$likes | number_format : 0 : '' : ' '}</span>
    </button>
</div>