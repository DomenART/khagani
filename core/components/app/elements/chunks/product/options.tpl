{foreach $options as $name => $values}
    <div class="product-options">
        <div class="product-options__label">{('mse2_filter_msoption_' ~ $name) | lexicon}</div>
        <div class="product-options__values">
            {foreach $values as $value}
                <label class="product-options__input">
                    <input type="radio" name="options[{$name}]" id="option_{$name}" value="{$value}" required>
                    <span>{$value}</span>
                </label>
            {/foreach}
        </div>
    </div>
{/foreach}