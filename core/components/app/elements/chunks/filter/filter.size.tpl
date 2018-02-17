<fieldset id="mse2_{$table}{$delimeter}{$filter}" class="filter-fieldset uk-open">
    <div class="filter-fieldset__title uk-accordion-title">
        {('mse2_filter_' ~ $table ~ '_' ~ $filter) | lexicon}
    </div>
    <div class="uk-accordion-content">
        <div class="filter-fieldset__body filter-grid">
            {$rows}
        </div>
        <div class="filter-fieldset__foot">
            <a href="{'page.size_table' | config | url}">
                <svg width="16" height="17">
                    <use href="{$.assets_url}web/img/svg-sprite.svg#table_sizes" />
                </svg>
                Таблица размеров
            </a>
        </div>
    </div>
</fieldset>