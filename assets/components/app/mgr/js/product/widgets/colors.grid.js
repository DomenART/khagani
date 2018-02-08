App.grid.ProductColors = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'app-product-colors-grid';
    }
    Ext.applyIf(config, {
        url: App.config.connector_url,
        fields: this.getFields(config),
        columns: this.getColumns(config),
        tbar: this.getTopBar(config),
        sm: new Ext.grid.CheckboxSelectionModel(),
        baseParams: {
            action: 'productcolor/getlist',
            product_id: App.product_id
        },
        listeners: {
            rowDblClick: function (grid, rowIndex, e) {
                var row = grid.store.getAt(rowIndex);
                this.updateColor(grid, e, row);
            }
        },
        viewConfig: {
            forceFit: true,
            enableRowBody: true,
            autoFill: true,
            showPreview: true,
            scrollOffset: 0
        },
        paging: true,
        remoteSort: true,
        autoHeight: true,
    });
    App.grid.ProductColors.superclass.constructor.call(this, config);

    // Clear selection on grid refresh
    this.store.on('load', function () {
        if (this._getSelectedIds().length) {
            this.getSelectionModel().clearSelections();
        }
    }, this);
};
Ext.extend(App.grid.ProductColors, MODx.grid.Grid, {
    windows: {},

    getMenu: function (grid, rowIndex) {
        var ids = this._getSelectedIds();

        var row = grid.getStore().getAt(rowIndex);
        var menu = App.utils.getMenu(row.data['actions'], this, ids);

        this.addContextMenuItem(menu);
    },

    createColor: function (btn, e) {
        var w = MODx.load({
            xtype: 'app-product-color-window-create',
            id: Ext.id(),
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                    }, scope: this
                }
            }
        });
        w.reset();
        w.setValues({ product_id: App.product_id });
        w.show(e.target);
    },

    updateColor: function (btn, e, row) {
        if (typeof (row) != 'undefined') {
            this.menu.record = row.data;
        }
        else if (!this.menu.record) {
            return false;
        }
        var id = this.menu.record.id;

        MODx.Ajax.request({
            url: this.config.url,
            params: {
                action: 'productcolor/get',
                id: id
            },
            listeners: {
                success: {
                    fn: function (r) {
                        var w = MODx.load({
                            xtype: 'app-product-color-window-update',
                            id: Ext.id(),
                            record: r,
                            listeners: {
                                success: {
                                    fn: function () {
                                        this.refresh();
                                    }, scope: this
                                }
                            }
                        });
                        w.reset();
                        w.setValues(r.object);
                        w.show(e.target);
                    }, scope: this
                }
            }
        });
    },

    removeColor: function () {
        var ids = this._getSelectedIds();
        if (!ids.length) {
            return false;
        }
        MODx.msg.confirm({
            title: ids.length > 1
                ? _('app_product_colors_remove')
                : _('app_product_color_remove'),
            text: ids.length > 1
                ? _('app_product_colors_remove_confirm')
                : _('app_product_color_remove_confirm'),
            url: this.config.url,
            params: {
                action: 'productcolor/remove',
                ids: Ext.util.JSON.encode(ids),
            },
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                    }, scope: this
                }
            }
        });
        return true;
    },

    getFields: function () {
        return ['id', 'label', 'color', 'product_file_id', 'actions'];
    },

    getColumns: function () {
        return [{
            header: _('app_product_color_id'),
            dataIndex: 'id',
            sortable: true,
            width: 50
        }, {
            header: _('app_product_color_label'),
            dataIndex: 'label',
            sortable: true,
            width: 200,
        }, {
            header: _('app_product_color_color'),
            dataIndex: 'color',
            renderer: function (value) {
                return String.format('<span class="app-color-square" style="background:{0};"></span>', value);
            },
            sortable: false,
            width: 100,
        }, {
            header: _('app_product_color_image'),
            dataIndex: 'product_file_id',
            renderer: App.utils.renderImage,
            sortable: false,
            width: 100,
        }, {
            header: _('app_product_grid_actions'),
            dataIndex: 'actions',
            renderer: App.utils.renderActions,
            sortable: false,
            width: 100,
            id: 'actions'
        }];
    },

    getTopBar: function () {
        return [{
            text: '<i class="icon icon-plus"></i>&nbsp;' + _('app_product_color_create'),
            handler: this.createColor,
            scope: this
        }];
    },

    onClick: function (e) {
        var elem = e.getTarget();
        if (elem.nodeName == 'BUTTON') {
            var row = this.getSelectionModel().getSelected();
            if (typeof (row) != 'undefined') {
                var action = elem.getAttribute('action');
                if (action == 'showMenu') {
                    var ri = this.getStore().find('id', row.id);
                    return this._showMenu(this, ri, e);
                }
                else if (typeof this[action] === 'function') {
                    this.menu.record = row.data;
                    return this[action](this, e);
                }
            }
        }
        return this.processEvent('click', e);
    },

    _getSelectedIds: function () {
        var ids = [];
        var selected = this.getSelectionModel().getSelections();

        for (var i in selected) {
            if (!selected.hasOwnProperty(i)) {
                continue;
            }
            ids.push(selected[i]['id']);
        }

        return ids;
    },
});
Ext.reg('app-product-colors-grid', App.grid.ProductColors);
