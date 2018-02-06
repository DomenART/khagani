var App = function (config) {
    config = config || {};
    App.superclass.constructor.call(this, config);
};
Ext.extend(App, Ext.Component, {
    page: {}, window: {}, grid: {}, tree: {}, panel: {}, combo: {}, config: {}, view: {}, utils: {}
});
Ext.reg('app', App);

App = new App();