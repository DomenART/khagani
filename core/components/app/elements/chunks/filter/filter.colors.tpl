<fieldset id="mse2_{$table}{$delimeter}{$filter}" class="filter-fieldset uk-open">
    <div class="filter-fieldset__title uk-accordion-title">
        {('mse2_filter_' ~ $table ~ '_' ~ $filter) | lexicon}
    </div>
    <div class="filter-fieldset__body filter-colors uk-accordion-content">
        {$rows}
    </div>
</fieldset>