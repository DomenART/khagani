{foreach $options as $name => $values}
    <div class="quickview-options">
        <div class="quickview-options__label">{('mse2_filter_msoption_' ~ $name) | lexicon}</div>
        <div class="quickview-options__values">
            {foreach $values as $value}
                <label class="quickview-options__input">
                    <input type="radio" name="options[{$name}]" id="option_{$name}" value="{$value}">
                    <span>{$value}</span>
                </label>
            {/foreach}
        </div>
    </div>
{/foreach}