<div id="add-review" class="modal-review" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <button class="uk-modal-close-default" type="button" uk-close></button>
        <div class="uk-modal-title">
            Новый отзыв
            <span class="modal-review__product">о товаре
                <b>{$.resource.pagetitle}</b>
            </span>
        </div>

        <form id="comment-form" action="" method="post" class="review-form" enctype="multipart/form-data">
            <div class="review-form-controls">
                <input type="hidden" name="thread" value="{$thread}"/>
                <input type="hidden" name="parent" value="0"/>
                <input type="hidden" name="id" value="0"/>
                <input type="hidden" name="text" value="Отызв без сообщения"/>
                <div uk-overflow-auto>
                    <div class="js-validate-votes"></div>
                    <div class="form-vote">
                        <div class="form-vote__title">
                            Общее впечатление:
                        </div>
                        <div class="form-vote__stars">
                            <div class="form-stars">
                                <input type="radio" name="vote-overall" value="5" onchange="document.getElementById('vote-overall-label').innerHTML='- Отлично'" required>
                                <input type="radio" name="vote-overall" value="4" onchange="document.getElementById('vote-overall-label').innerHTML='- Хорошо'" required>
                                <input type="radio" name="vote-overall" value="3" onchange="document.getElementById('vote-overall-label').innerHTML='- Средне'" required>
                                <input type="radio" name="vote-overall" value="2" onchange="document.getElementById('vote-overall-label').innerHTML='- Плохо'" required>
                                <input type="radio" name="vote-overall" value="1" onchange="document.getElementById('vote-overall-label').innerHTML='- Ужасно'" required>
                            </div>
                        </div>
                        <div class="form-vote__label" id="vote-overall-label">
                            - не выбрано
                        </div>

                        <div class="form-vote__title">
                            Цена:
                        </div>
                        <div class="form-vote__stars">
                            <div class="form-stars">
                                <input type="radio" name="vote-price" value="5" onchange="document.getElementById('vote-price-label').innerHTML='- Отлично'" required>
                                <input type="radio" name="vote-price" value="4" onchange="document.getElementById('vote-price-label').innerHTML='- Хорошо'" required>
                                <input type="radio" name="vote-price" value="3" onchange="document.getElementById('vote-price-label').innerHTML='- Средне'" required>
                                <input type="radio" name="vote-price" value="2" onchange="document.getElementById('vote-price-label').innerHTML='- Плохо'" required>
                                <input type="radio" name="vote-price" value="1" onchange="document.getElementById('vote-price-label').innerHTML='- Ужасно'" required>
                            </div>
                        </div>
                        <div class="form-vote__label" id="vote-price-label">
                            - не выбрано
                        </div>

                        <div class="form-vote__title">
                            Качество:
                        </div>
                        <div class="form-vote__stars">
                            <div class="form-stars">
                                <input type="radio" name="vote-quality" value="5" onchange="document.getElementById('vote-quality-label').innerHTML='- Отлично'" required>
                                <input type="radio" name="vote-quality" value="4" onchange="document.getElementById('vote-quality-label').innerHTML='- Хорошо'" required>
                                <input type="radio" name="vote-quality" value="3" onchange="document.getElementById('vote-quality-label').innerHTML='- Средне'" required>
                                <input type="radio" name="vote-quality" value="2" onchange="document.getElementById('vote-quality-label').innerHTML='- Плохо'" required>
                                <input type="radio" name="vote-quality" value="1" onchange="document.getElementById('vote-quality-label').innerHTML='- Ужасно'" required>
                            </div>
                        </div>
                        <div class="form-vote__label" id="vote-quality-label">
                            - не выбрано
                        </div>
                    </div>
                    <div class="review-form__row">
                        <label for="review-advantages" class="review-form__label">Достоинства товара:</label>
                        <textarea class="textarea" name="advantages" id="review-advantages" placeholder="Опишите достоинства товара, чем товар понравился и заинтересовал"></textarea>
                    </div>
                    <div class="review-form__row">
                        <label for="review-disadvantages" class="review-form__label">Недостатки товара:</label>
                        <textarea class="textarea" name="disadvantages" id="review-disadvantages" placeholder="Опишите недостатки товара"></textarea>
                    </div>
                    <div class="review-form__row">
                        <label for="review-text" class="review-form__label">Текст:</label>
                        <textarea class="textarea" name="message" id="review-message" placeholder="Опишите подробно свои впечатления о товаре, на что хотели бы обратить
    внимание других пользователей"></textarea>
                    </div>
                    <div class="review-form__row">
                        <label class="review-form__label">
                            <input type="checkbox" name="recommend" class="uk-checkbox" value="1"> Рекомендуете товар друзьям?
                        </label>
                    </div>
                    <div class="review-form__row">
                        <div uk-form-custom>
                            <input type="file" name="file">
                            <button type="button" class="review-form__file">
                                <svg width="15" height="20">
                                    <use href="{$.assets_url}web/img/svg-sprite.svg#attach" />
                                </svg>
                                Прикрепите фото/видео товара, перетащив его в эту область или
                                <b>выберите файл</b>
                            </button>
                        </div>
                    </div>
                    <hr>
                    <div class="uk-grid-small" uk-grid>
                        <div class="uk-width-1-2@s">
                            <label for="review-text" class="review-form__label">Как вас зовут?</label>
                            <input class="input" type="text" id="review-name" name="name" placeholder="Ваше имя" value="{$name}">
                        </div>
                        <div class="uk-width-1-2@s">
                            <label for="review-text" class="review-form__label">Откуда вы?</label>
                            <input class="input" type="text" id="review-city" name="city" placeholder="Москва">
                        </div>
                        <div class="uk-width-1-1">
                            <label for="review-text" class="review-form__label">Сколько покупаете в нашем магазине?</label>
                            <select class="select" id="review-time" name="time">
                                <option value="Я постоянный клиент в Khagani-man">Я постоянный клиент в Khagani-man</option>
                                <option value="Впервые">Впервые</option>
                            </select>
                        </div>
                    </div>
                    <div class="review-form__info">
                        Правила публикации пользовательского контента. Как написать отзыв или задать вопрос?
                    </div>
                    <div class="review-form__rules">
                        <a href="{'privacy-policy' | uri2id | url}" class="uk-button button-frame" target="_blank">
                            <svg width="6" height="13">
                                <use href="{$.assets_url}web/img/svg-sprite.svg#info" />
                            </svg>
                            показать правила
                        </a>
                    </div>
                </div>

                <hr>

                <div class="modal-review__rules">
                    <label>
                        <input type="checkbox" name="rules" class="uk-checkbox" value="1" required>
                        <span></span>
                        Прочитал(-а)
                        <a href="{'terms-of-use' | uri2id | url}" target="_blank">пользовательское соглашение</a> и соглашаюсь с
                        <a href="{'privacy-policy' | uri2id | url}" target="_blank">политикой обработки персональных данных</a>.
                    </label>
                </div>

                <div class="modal-review__submit">
                    <button type="submit" class="uk-button button-blue">Хочу Записаться</button>
                </div>
            </div>

            <div class="review-form-success">
                <div class="review-form-success__title">
                    Спасибо!
                </div>
                <div class="review-form-success__desc">Ваш отзыв будет опубликован после проверки!</div>
            </div>
        </form>
    </div>
</div>