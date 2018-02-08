<label for="mse2_{$table}{$delimeter}{$filter}_{$idx}" class="filter-checkbox {$disabled}">
    <input type="checkbox" name="{$filter_key}" id="mse2_{$table}{$delimeter}{$filter}_{$idx}" value="{$value}" class="checkbox" {$checked} {$disabled}/>
    <span class="filter-checkbox__input">{$title}</span>
    <span class="filter-checkbox__label">
        {$title}&nbsp;<sup class="filter-checkbox__count">{$num}</sup>
    </span>
</label>