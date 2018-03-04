import UIkit from "uikit";
import $ from "jquery";
import "jquery-form";
import "jquery-validation";
import "jquery-validation/dist/localization/messages_ru.js";

window.AjaxForm = {

    initialize: function (afConfig) {
        $(document).on('af_complete', function(event, response) {
            response.form.addClass('af_completed');

            setTimeout(() => {
                response.form.removeClass('af_completed');
            }, 5000);
        });

        $(afConfig.formSelector).each(function() {
            $(this).validate({
                errorClass: 'uk-form-danger',
                validClass: 'uk-form-success',
                submitHandler: function(form) {
                    $(form).ajaxSubmit({
                        dataType: 'json'
                        , data: { pageId: afConfig.pageId }
                        , url: afConfig.actionUrl
                        , beforeSerialize: function (form, options) {
                            form.find(':submit').each(function () {
                                if (!form.find('input[type="hidden"][name="' + $(this).attr('name') + '"]').length) {
                                    $(form).append(
                                        $('<input type="hidden">').attr({
                                            name: $(this).attr('name'),
                                            value: $(this).attr('value')
                                        })
                                    );
                                }
                            })

                            form.find('[name="anomaly"]').val('');
                        }
                        , beforeSubmit: function (fields, form) {
                            if (typeof (afValidated) != 'undefined' && afValidated == false) {
                                return false;
                            }
                            form.find('.uk-form-danger').html('');
                            form.find('.uk-form-danger').removeClass('uk-form-danger');
                            form.find('input,textarea,select,button').attr('disabled', true);
                            return true;
                        }
                        , success: function (response, status, xhr, form) {
                            let yatarget = form.data('yatarget') || false
                            if (yatarget) {
                                console.log('target', yatarget)
                                yaCounter47222415.reachGoal(yatarget)
                            }
                            form.find('input,textarea,select,button').attr('disabled', false);
                            response.form = form;
                            $(document).trigger('af_complete', response);
                            if (!response.success) {
                                AjaxForm.Message.error(response.message);
                                if (response.data) {
                                    var key, value;
                                    for (key in response.data) {
                                        if (response.data.hasOwnProperty(key)) {
                                            value = response.data[key];
                                            form.find('.error_' + key).html(value).addClass('uk-form-danger');
                                            form.find('[name="' + key + '"]').addClass('uk-form-danger');
                                        }
                                    }
                                }
                            }
                            else {
                                AjaxForm.Message.success(response.message);
                                form.find('.uk-form-danger').removeClass('uk-form-danger');
                                form[0].reset();
                            }
                        }
                    });
                }
            });
        });
    }

};


AjaxForm.Message = {
    success: function (message, sticky) {
        if (message) {
            UIkit.notification({
                message: message,
                status: 'success',
                timeout: sticky ? 0 : 5000
            });
        }
    }
    , error: function (message, sticky) {
        if (message) {
            UIkit.notification({
                message: message,
                status: 'danger',
                timeout: sticky ? 0 : 5000
            });
        }
    }
    , info: function (message, sticky) {
        if (message) {
            UIkit.notification({
                message: message,
                status: 'info',
                timeout: sticky ? 0 : 5000
            });
        }
    }
};
