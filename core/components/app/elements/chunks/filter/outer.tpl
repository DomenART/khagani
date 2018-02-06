<div class="uk-grid" uk-grid id="mse2_mfilter">
    <div class="uk-width-1-4">
        <div id="mse2_selected_wrapper">
            <div id="mse2_selected">[[%mse2_selected]]:
                <span></span>
            </div>
        </div>
        
        <form action="[[~[[*id]]]]" method="post" id="mse2_filters">
            [[+filters]]
            <br/> [[+filters:isnot=``:then=`
            <button type="reset" class="btn btn-default hidden">[[%mse2_reset]]</button>
            <button type="submit" class="btn btn-success pull-right hidden">[[%mse2_submit]]</button>
            <div class="clearfix"></div>
            `]]
        </form>
    </div>
    <div class="uk-width-3-4">
        <div class="filterBar">
            <div class="filterBar__total">
                Товары {$limit} из <span id="mse2_total">{$total}</span>
            </div>
            <div class="filterBar__group">
                <div class="filterBar__label">
                    Сортировать:
                </div>
                {var $sort = 'mse2_sort' | placeholder}
                <select class="select" name="mse2_sort">
                    <option value="">Новые</option>
                    <option value="ms|popular:desc" {if $sort == 'ms|popular:desc'}selected{/if}>Популярные</option>
                    <option value="ms|price:asc" {if $sort == 'ms|price:asc'}selected{/if}>Дешевые</option>
                    <option value="ms|price:desc" {if $sort == 'ms|price:desc'}selected{/if}>Дорогие</option>
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

            {if $tpls?}
            <div class="filterBar__view">
                <div class="products-view" id="mse2_tpl">
                    <a href="#" data-tpl="1" class="{$tpl1} products-view__button">
                        <svg width="11" height="11">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#tiles-small" />
                        </svg>
                    </a>
                    <a href="#" data-tpl="0" class="{$tpl0} products-view__button">
                        <svg width="18" height="18">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#tiles" />
                        </svg>
                    </a>
                    <a href="#" data-tpl="2" class="{$tpl2} products-view__button">
                        <svg width="18" height="13">
                            <use href="{$.assets_url}web/img/svg-sprite.svg#rows" />
                        </svg>
                    </a>
                </div>
            </div>
            {/if}
        </div>

        <div class="products" id="mse2_results">
            {$results}
        </div>

        <div class="mse2_pagination">
            {'page.nav' | placeholder}
        </div>
    </div>
</div>