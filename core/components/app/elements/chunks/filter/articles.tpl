<div class="uk-grid uk-grid-small" uk-grid id="mse2_mfilter">
    <div class="uk-width-2-5@s uk-width-1-4@m">
        <button class="uk-button button-bordered uk-hidden@s" uk-toggle="target: #mse2_filters; cls: uk-visible@s" type="button">Показать фильтр</button>
        <form action="[[~[[*id]]]]" method="post" id="mse2_filters" class="filters uk-visible@s">
            <div class="filters__head">
                <button type="reset" class="uk-button filters__reset hidden">
                    {'mse2_reset' | lexicon}
                    <svg width="15" height="15">
                        <use href="{$.assets_url}web/img/svg-sprite.svg#close" />
                    </svg>
                </button>

                <div id="mse2_selected_wrapper" class="filters__selected">
                    <div id="mse2_selected">
                        {'mse2_selected' | lexicon}:
                        <span></span>
                    </div>
                </div>
            </div>
            
            <div uk-accordion="multiple: true">
                {$filters}
            </div>

            <div class="filters__foot">
                <button type="submit" class="uk-button button-blue filters__submit">Применить</button>
                <button type="reset" class="uk-button filters__reset hidden">
                    {'mse2_reset' | lexicon}
                    <svg width="15" height="15">
                        <use href="{$.assets_url}web/img/svg-sprite.svg#close" />
                    </svg>
                </button>
            </div>
        </form>
    </div>
    
    <div class="uk-width-3-5@s uk-width-3-4@m">
        <div class="articles">
            <div class="filterBar">
                <div class="filterBar__total">
                    {$total > $limit ? $limit : $total} из <span id="mse2_total">{$total}</span>
                </div>
                <div class="filterBar__group">
                    <div class="filterBar__label">
                        Сортировать:
                    </div>
                    {var $sort = 'mse2_sort' | placeholder}
                    <select class="select" name="mse2_sort">
                        <option value="">Новые</option>
                        <option value="tv|rating:desc" {if $sort == 'tv|rating:desc'}selected{/if}>Популярные</option>
                    </select>
                </div>
                <div class="filterBar__group">
                    <div class="filterBar__label">
                        Показывать&nbsp;по:
                    </div>
                    <select class="select" name="mse_limit" id="mse2_limit">
                        <option value="9" {if $limit == 9}selected{/if}>9</option>
                        <option value="21" {if $limit == 21}selected{/if}>21</option>
                        <option value="42" {if $limit == 42}selected{/if}>42</option>
                        <option value="90" {if $limit == 90}selected{/if}>90</option>
                    </select>
                </div>
            </div>

            <div class="mse2_pagination">
                {'page.nav' | placeholder}
            </div>

            <div class="articles-grid" id="mse2_results">
                {$results}
            </div>

            <div class="mse2_pagination">
                {'page.nav' | placeholder}
            </div>
        </div>
    </div>
</div>