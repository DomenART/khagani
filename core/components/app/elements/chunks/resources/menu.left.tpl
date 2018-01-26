<li{$classes}>
    <a href="{$link}" {$attributes}
        {if $category_type == 1}class="menu-left__popular"{/if}
        {if $category_type == 2}class="menu-left__sale"{/if}>
        {$menutitle}
        <span>{$id | productsCount}</span>
    </a>
    {$wrapper}
</li>