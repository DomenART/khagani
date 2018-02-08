App.combo.ColorAutocomplete = function (config) {
    config = config || {};

    Ext.applyIf(config, {
        name: config.name,
        fieldLabel: _('app_product_' + config.name),
        id: 'app-color-' + config.name,
        hiddenName: config.name,
        displayField: config.name,
        valueField: config.name,
        anchor: '99%',
        fields: config.fields,
        //pageSize: 20,
        forceSelection: false,
        url: App.config['connector_url'],
        typeAhead: true,
        editable: true,
        allowBlank: true,
        baseParams: {
            action: 'color/autocomplete',
            name: config.name,
            combo: true,
            limit: 0
        },
        hideTrigger: false,
    });
    App.combo.ColorAutocomplete.superclass.constructor.call(this, config);
};
Ext.extend(App.combo.ColorAutocomplete, MODx.combo.ComboBox);
Ext.reg('app-color-autocomplete', App.combo.ColorAutocomplete);