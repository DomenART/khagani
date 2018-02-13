{var $rating = $properties['vote-medium'] / 5 * 100}
<div class="reviews-item" id="comment-{$id}" data-parent="{$parent}" data-newparent="{$new_parent}" data-id="{$id}">
    <div class="reviews-item__body">
        <div class="reviews-item__headline">
            <div class="rating-stars rating-stars--middle">
                <div class="rating-stars__fill" style="width: {$rating}%"></div>
            </div>
            
            {if $properties.recommend?}
                <div class="reviews-item__recommend">Я рекомендую этот товар!</div>
            {/if}
        </div>
        <div class="reviews-item__content">
            <p>
                <b>{$name}</b>
                 {if $properties.city?}, <b>Откуда:</b> {$properties.city}{/if}
                 {if $properties.time?}, <b>{$properties.time}</b>{/if}
            </p>
            {$text}
        </div>
        {'!xLike' | snippet : [
            'parent' => $id,
            'class' => 'TicketComment',
            'tpl' => '@FILE chunks/partials/xlike.tpl'
        ]}
    </div>
    <div class="reviews-item__video">
        {var $type = $properties['file']['type'] | split : "/"}
        {switch $type[0]}
        {case 'image'}
            <img src="{$properties['file']['url']}" alt="">
        {case 'video'}
            <video controls>
                <source src="{$properties['file']['url']}" type="{$properties['file']['type']}">
                Sorry, your browser doesn't support embedded videos, but don't worry, you can <a href="{$properties['file']['url']}">download it</a> and watch it with your favorite video player!
            </video>
        {/switch}
    </div>
</div>