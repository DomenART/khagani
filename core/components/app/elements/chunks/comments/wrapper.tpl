{var $properties = $.resource.properties}
{var $recommendationsPercentage = ($properties['recommendations'] / $total * 100) | round}

<div class="product-reviews">

    <div id="comments-tpanel">
        <div id="tpanel-refresh"></div>
        <div id="tpanel-new"></div>
    </div>

    <div class="product-reviews__headline">
        <div class="product-reviews__title">Отзывы</div>
        <div class="product-reviews__actions">
            <button class="product-reviews__add uk-button button-bordered" uk-toggle="target: #add-review">Оставить отзыв</button>&emsp; или
            <a href="#question" uk-toggle>задать вопрос</a>
        </div>
        <div></div>
    </div>
    {if $total?}
    <div class="product-reviews__stat">
        <div class="product-reviews__summary">
            <div class="reviews-summary">
                <div class="reviews-summary__stars">
                    <div class="rating-stars">
                        <div class="rating-stars__fill" style="width: {$properties | totalAverageRatingPercent}%"></div>
                    </div>
                </div>
                <div class="reviews-summary__text" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
                    <span itemprop="reviewCount">{$total}</span> {$total | units : ['отзыв', 'отзыва', 'отзывов']} | <span itemprop="ratingValue">{$properties | totalAverageRating}</span> из 5
                </div>
                <div class="reviews-summary__scale" style="background: linear-gradient(90deg, #ebdf25 {$recommendationsPercentage}%, #f1f1f1 {$recommendationsPercentage}%)">
                    {$recommendationsPercentage}%
                </div>
                <div class="reviews-summary__recommend">Рекомендовали бы этот товар другу</div>
            </div>
        </div>
        <div class="product-reviews__count">
            <div class="reviews-count">
                <div class="reviews-count__label">
                    5 звезд
                </div>
                <div class="reviews-count__scale" style="background: linear-gradient(90deg, #ffcc33 {$properties | averageRatingPercent : 5}%, #f1f1f1 {$properties | averageRatingPercent : 5}%)"></div>
                <div class="reviews-count__count">({$properties['vote-total'][5]})</div>

                <div class="reviews-count__label">
                    4 звезд
                </div>
                <div class="reviews-count__scale" style="background: linear-gradient(90deg, #ffcc33 {$properties | averageRatingPercent : 4}%, #f1f1f1 {$properties | averageRatingPercent : 4}%)"></div>
                <div class="reviews-count__count">({$properties['vote-total'][4]})</div>

                <div class="reviews-count__label">
                    3 звезд
                </div>
                <div class="reviews-count__scale" style="background: linear-gradient(90deg, #ffcc33 {$properties | averageRatingPercent : 3}%, #f1f1f1 {$properties | averageRatingPercent : 3}%)"></div>
                <div class="reviews-count__count">({$properties['vote-total'][3]})</div>

                <div class="reviews-count__label">
                    2 звезд
                </div>
                <div class="reviews-count__scale" style="background: linear-gradient(90deg, #ffcc33 {$properties | averageRatingPercent : 2}%, #f1f1f1 {$properties | averageRatingPercent : 2}%)"></div>
                <div class="reviews-count__count">({$properties['vote-total'][2]})</div>

                <div class="reviews-count__label">
                    1 звезд
                </div>
                <div class="reviews-count__scale" style="background: linear-gradient(90deg, #ffcc33 {$properties | averageRatingPercent : 1}%, #f1f1f1 {$properties | averageRatingPercent : 1}%)"></div>
                <div class="reviews-count__count">({$properties['vote-total'][1]})</div>
            </div>
        </div>
        <div></div>
    </div>
    {/if}
    
    <div id="comments-wrapper">
        <div class="reviews-list" id="comments">
            {$comments}
        </div>
    </div>
</div>