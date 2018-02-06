App.window.CreateColor = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'app-product-color-window-create';
    }
    Ext.applyIf(config, {
        title: _('app_product_color_create'),
        width: 620,
        autoHeight: true,
        url: App.config.connector_url,
        action: 'mgr/productcolor/create',
        fields: this.getFields(config),
        keys: [{
            key: Ext.EventObject.ENTER, shift: true, fn: function () {
                this.submit()
            }, scope: this
        }]
    });
    App.window.CreateColor.superclass.constructor.call(this, config);
};
Ext.extend(App.window.CreateColor, MODx.Window, {

    getFields: function (config) {
        return [{
            xtype: 'hidden',
            name: 'product_file_id',
            id: config.id + '-product_file_id',
        }, {
            xtype: 'hidden',
            name: 'product_id',
            id: config.id + '-product_id',
        }, {
            layout: 'column',
            border: false,
            items: [{
                columnWidth: .5,
                layout: 'form',
                border: false,
                items: [{
                    xtype: 'app-color-autocomplete',
                    fieldLabel: _('app_product_color_label'),
                    id: config.id + '-label',
                    name: 'label',
                    fields: ['label', 'color'],
                    allowBlank: false,
                    anchor: '95%',
                    listeners: {
                        change: {
                            fn: function (combo, value) {
                                var store = Ext.getCmp(config.id + '-label').getStore();
                                var value = store.getAt(combo.selectedIndex).data.color;
                                var input = Ext.getCmp(config.id + '-color');
                                input.setValue(value);
                                input.jscolor.importColor();
                            }, scope: this
                        }
                    }
                }]
            }, {
                columnWidth: .5,
                layout: 'form',
                border: false,
                items: [{
                    xtype: 'textfield',
                    fieldLabel: _('app_product_color_color'),
                    id: config.id + '-color',
                    name: 'color',
                    allowBlank: false,
                    anchor: '95%',
                    listeners: {
                        afterrender: {
                            fn: function (input) {
                                input.jscolor = new jscolor(input.el.dom, {
                                    hash: true,
                                    zIndex: 15000
                                });
                            }, scope: this
                        }
                    }
                }]
            }]
        }, {
            xtype: 'app-product-color-images-panel',
            fieldLabel: _('app_product_color_images'),
            id: config.id + '-images',
            viewListeners: {
                click: {
                    fn: function (view, index) {
                        var input = Ext.getCmp(config.id + '-product_file_id');
                        input.setValue(view.getStore().getAt(index).id);
                    }, scope: this
                }
            }
        }];
    },

    loadDropZones: function () {
    }

});
Ext.reg('app-product-color-window-create', App.window.CreateColor);


App.window.UpdateColor = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'app-product-color-window-update';
    }
    Ext.applyIf(config, {
        title: _('app_product_color_update'),
        width: 620,
        autoHeight: true,
        url: App.config.connector_url,
        action: 'mgr/productcolor/update',
        fields: this.getFields(config),
        keys: [{
            key: Ext.EventObject.ENTER, shift: true, fn: function () {
                this.submit()
            }, scope: this
        }]
    });
    App.window.UpdateColor.superclass.constructor.call(this, config);
};
Ext.extend(App.window.UpdateColor, MODx.Window, {

    getFields: function (config) {
        return [{
            xtype: 'hidden',
            name: 'id',
            id: config.id + '-id',
        }, {
            xtype: 'hidden',
            name: 'product_id',
            id: config.id + '-product_id',
        }, {
            xtype: 'hidden',
            name: 'product_file_id',
            id: config.id + '-product_file_id',
        }, {
            layout: 'column',
            border: false,
            items: [{
                columnWidth: .5,
                layout: 'form',
                border: false,
                items: [{
                    xtype: 'app-color-autocomplete',
                    fieldLabel: _('app_product_color_label'),
                    id: config.id + '-label',
                    name: 'label',
                    fields: ['label', 'color'],
                    allowBlank: false,
                    anchor: '95%',
                    listeners: {
                        change: {
                            fn: function (combo, value) {
                                var store = Ext.getCmp(config.id + '-label').getStore();
                                var value = store.getAt(combo.selectedIndex).data.color;
                                var input = Ext.getCmp(config.id + '-color');
                                input.setValue(value);
                                input.jscolor.importColor();
                            }, scope: this
                        }
                    }
                }]
            }, {
                columnWidth: .5,
                layout: 'form',
                border: false,
                items: [{
                    xtype: 'textfield',
                    fieldLabel: _('app_product_color_color'),
                    id: config.id + '-color',
                    name: 'color',
                    allowBlank: false,
                    anchor: '95%',
                    listeners: {
                        afterrender: {
                            fn: function (input) {
                                input.jscolor = new jscolor(input.el.dom, {
                                    value: input.getValue(),
                                    hash: true,
                                    zIndex: 15000
                                });
                            }, scope: this
                        }
                    }
                }]
            }]
        }, {
            xtype: 'app-product-color-images-panel',
            fieldLabel: _('app_product_color_images'),
            id: config.id + '-images',
            listeners: {
            },
            viewListeners: {
                click: {
                    fn: function (view, index) {
                        var input = Ext.getCmp(config.id + '-product_file_id');
                        input.setValue(view.getStore().getAt(index).id);
                    }, scope: this
                },
                afterrender: {
                    fn: function (view) {
                        var input = Ext.getCmp(config.id + '-product_file_id');
                        view.select(view.getStore().getById(input.getValue()));
                    }, scope: this
                }
            }
        }];
    },

    loadDropZones: function () {
    }

});
Ext.reg('app-product-color-window-update', App.window.UpdateColor);