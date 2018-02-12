<form action="{$pageId | url}" method="get" class="header-search msearch2" id="mse2_form">
    <input type="text" name="{$queryVar}" placeholder="Поиск по сайту" class="header-search__input" value="{$mse2_query}">
    <button type="submit" class="header-search__submit">
        <span uk-icon="icon: search"></span>
    </button>
</form>