<h3>Ваша корзина</h3>
<div class="js-order-cart"></div>
<h3>Ваши данные</h3>
<form action="" method="post" class="form-record ajax_form uk-position-relative" data-yatarget="ORDER">
    <input type="hidden" name="anomaly" value="anomaly">
    <div class="form-record__row">
        <input type="text" placeholder="Имя:" name="name" class="input" value="{$_pls['fi.name']}">
    </div>
    <div class="form-record__row validation-error-right">
        <input type="tel" placeholder="Телефон*:" name="phone" class="input" value="{$_pls['fi.phone']}" required>
    </div>
    <div class="form-record__row validation-error-right">
        <input type="email" placeholder="E-mail*:" name="email" class="input" value="{$_pls['fi.email']}" required>
    </div>
    <div class="form-record__row">
        <textarea rows="3" name="message" class="textarea" placeholder="Сообщение:">{$_pls['fi.message']}</textarea>
    </div>
    <div class="form-record__note">
        <span>Обязательно заполните поле <b>ТЕЛЕФОН</b>, чтобы мы могли связаться с вами для уточнения деталей.</span>
    </div>
    <div class="form-record__rules">
        <label>
            <input type="checkbox" name="rules" class="uk-checkbox" value="1" required>
            <span></span>
            Прочитал(-а)
            <a href="{'page.terms_of_use' | config | url}" target="_blank">пользовательское соглашение</a> и соглашаюсь с
            <a href="{'page.privacy_policy' | config | url}" target="_blank">политикой обработки персональных данных</a>.
        </label>
    </div>
    <div class="form-record__submit">
        <button type="submit" class="uk-button button-bordered button-bordered--large button-bordered--saturated">Отправить</button>
    </div>

    <div class="form-success">
        <div class="form-success__title">
            Благодарим за обращение.
            <br>Ваша заявка принята.
        </div>
        <div class="form-success__desc">Мы перезвоним Вам!</div>
    </div>
</form>
