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