Ext.ComponentMgr.onAvailable('minishop2-product-tabs', function () {
    this.on('beforerender', function () {
        this.add({
            title: _('app_product_colors_tab_title'),
            hideMode: 'offsets',
            items: [
                {
                    xtype: 'app-product-colors-grid',
                    cls: 'main-wrapper'
                }
            ]
        });
    });
});