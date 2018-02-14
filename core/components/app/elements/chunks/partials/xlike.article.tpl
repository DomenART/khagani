<div class="article-stats__count [ js-xlike-object ]" data-xlike-propkey="{$propkey}" data-xlike-parent="{$parent}">
    <button
        class="{$value > 0 ? 'xlike__link_active' : ''} {$can ? 'js-xlike-button' : ''}" 
        {$can ? 'data-xlike-value="1" href="javascript:undefined;"' : ''}
    >
        <svg width="18" height="18">
            <use href="{$.assets_url}web/img/svg-sprite.svg#like" />
        </svg>
        <span class="js-xlike-number">{$likes | number_format : 0 : '' : ' '}</span>
    </button>
</div>