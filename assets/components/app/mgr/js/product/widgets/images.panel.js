App.panel.Images = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'app-product-color-images';
    }

    var store = Ext.getCmp('minishop2-gallery-images-view').getStore();
    var tpl = new Ext.XTemplate(
        '<tpl for=".">\
            <div class="modx-browser-thumb-wrap modx-pb-thumb-wrap minishop2-gallery-thumb-wrap {class}" id="ms2-gallery-image-{id}">\
                <div class="modx-browser-thumb modx-pb-thumb minishop2-gallery-thumb">\
                    <img src="{thumbnail}" title="{name}" />\
                </div>\
                <small>{rank}. {shortName}</small>\
            </div>\
        </tpl>'
    );

    this.view = new Ext.DataView({
        store: store,
        tpl: tpl,
        autoHeight: true,
        overClass: 'x-view-over',
        cls: 'minishop2-gallery-images',
        containerScroll: true,
        singleSelect: true,
        itemSelector: 'div.modx-browser-thumb-wrap',
        emptyText: 'No images to display',
        listeners: config.viewListeners || {}
    });

    Ext.applyIf(config, {
        cls: 'browser-view',
        border: false,
        items: [this.view]
    });
    App.panel.Images.superclass.constructor.call(this, config);
};
Ext.extend(App.panel.Images, MODx.Panel);
Ext.reg('app-product-color-images-panel', App.panel.Images);
/* 
App.view.Images = function (config) {
    config = config || {};

    this._initTemplates();

    Ext.applyIf(config, {
        url: App.config.connector_url,
        fields: [
            'id', 'product_id', 'name', 'description', 'url', 'createdon', 'createdby', 'file',
            'thumbnail', 'source', 'source_name', 'type', 'rank', 'active', 'properties', 'class',
            'add', 'alt', 'actions'
        ],
        id: 'minishop2-gallery-images-view',
        baseParams: {
            action: 'mgr/gallery/getlist',
            product_id: config.product_id,
            parent: 0,
            type: 'image',
            limit: config.pageSize || MODx.config.default_per_page
        },
        //loadingText: _('loading'),
        enableDD: true,
        multiSelect: true,
        tpl: this.templates.thumb,
        itemSelector: 'div.modx-browser-thumb-wrap',
        listeners: {},
        prepareData: this.formatData.createDelegate(this)
    });
    App.view.Images.superclass.constructor.call(this, config);

    this.addEvents('sort', 'select');
    this.on('sort', this.onSort, this);
    this.on('dblclick', this.onDblClick, this);

    var widget = this;
    this.getStore().on('beforeload', function () {
        widget.getEl().mask(_('loading'), 'x-mask-loading');
    });
    this.getStore().on('load', function () {
        widget.getEl().unmask();
    });
};
Ext.extend(App.view.Images, MODx.DataView, {

    templates: {},
    windows: {},

    _initTemplates: function () {
        this.templates.thumb = new Ext.XTemplate(
            '<tpl for=".">\
                <div class="modx-browser-thumb-wrap modx-pb-thumb-wrap minishop2-gallery-thumb-wrap {class}" id="ms2-gallery-image-{id}">\
                    <div class="modx-browser-thumb modx-pb-thumb minishop2-gallery-thumb">\
                        <img src="{thumbnail}" title="{name}" />\
                    </div>\
                    <small>{rank}. {shortName}</small>\
                </div>\
            </tpl>'
        );
        this.templates.thumb.compile();
    },

});
Ext.reg('product-color-images-view', App.view.Images); */