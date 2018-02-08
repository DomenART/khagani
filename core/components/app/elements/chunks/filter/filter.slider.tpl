<fieldset id="mse2_{$table}{$delimeter}{$filter}" class="filter-fieldset uk-open">
    <div class="filter-fieldset__title uk-accordion-title">
        {('mse2_filter_' ~ $table ~ '_' ~ $filter) | lexicon}
    </div>
    <div class="filter-fieldset__body uk-accordion-content">
        <div class="mse2_number_slider filter-slider"></div>
        <div class="mse2_number_inputs filter-slider-fields">
            {$rows}
        </div>
    </div>
</fieldset>