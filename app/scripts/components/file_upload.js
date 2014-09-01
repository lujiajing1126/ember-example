(function() {
  Enterprise.FileUploadComponent = Ember.Component.extend({
    name: '上传文件',
    url: null,
    errorMessage: '',
    progress: 0,
    didInsertElement: function() {
      console.log(this.$('body'));
      return console.log(this.get('store'));
    }
  });

}).call(this);
