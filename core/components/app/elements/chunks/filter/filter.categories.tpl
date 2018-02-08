<fieldset id="mse2_{$table}{$delimeter}{$filter}" class="filter-fieldset uk-open">
    <div class="filter-fieldset__title uk-accordion-title">
        {('mse2_filter_' ~ $table ~ '_' ~ $filter) | lexicon}
    </div>
    <div class="uk-accordion-content js-filter-categories">
        <div class="filter-fieldset__body filter-rows js-filter-categories-rows">
            {$rows}
        </div>
        <div class="filter-fieldset__foot">
            <a href="#" class="js-filter-categories-add">Показать еще (+5)</a>
        </div>
    </div>
</fieldset>