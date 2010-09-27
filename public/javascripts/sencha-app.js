Ext.setup({
    icon: 'icon.png',
    glossOnIcon: false,
    tabletStartupScreen: 'tablet_startup.png',
    phoneStartupScreen: 'phone_startup.png',
    onReady: function() {


      var nestedList = new Ext.NestedList({
          fullscreen: true,
          title: 'src/',
          displayField: 'fileName',
          // add a / for folder nodes in title/back button
          getTitleTextTpl: function() {
              return '{' + this.displayField + '}<tpl if="leaf !== true">/</tpl>';
          },
          // add a / for folder nodes in the list
          getItemTextTpl: function() {
              return '{' + this.displayField + '}<tpl if="leaf !== true">/</tpl>';
          },
          // provide a codebox for each source file
          getDetailCard: function(record, parentRecord) {
              return new Ext.ux.CodeBox({
                  value: 'Loading...',
                  scroll: 'both'
              });
          },
          store: store
      });





    }
});
