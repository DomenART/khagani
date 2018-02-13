<div class="like-dislike [ js-xlike-object ]" data-xlike-propkey="{$propkey}" data-xlike-parent="{$parent}">
    <button
        class="{$value > 0 ? 'xlike__link_active' : ''} {$can ? 'js-xlike-button' : ''}" 
        {$can ? 'data-xlike-value="1" href="javascript:undefined;"' : ''}
    >
        <svg width="14" height="14">
            <use href="{$.assets_url}web/img/svg-sprite.svg#like" />
        </svg>
        <span class="js-xlike-number">{$likes | number_format : 0 : '' : ' '}</span>
    </button>
    <button
        class="{$value < 0 ? 'xlike__link_active' : ''} {$can ? 'js-xlike-button' : ''}" 
        {$can ? 'data-xlike-value="-1" href="javascript:undefined;"' : ''}
    >
        <svg width="14" height="14">
            <use href="{$.assets_url}web/img/svg-sprite.svg#dislike" />
        </svg>
        <span class="js-xlike-number">{$dislikes | number_format : 0 : '' : ' '}</span>
    </button>
</div>