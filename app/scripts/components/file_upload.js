(function() {
  Enterprise.FileUploadComponent = Ember.Component.extend({
    name: '上传文件',
    url: null,
    errorMessage: null,
    progress: 0,
    didInsertElement: function() {
      var session;
      session = Enterprise.Auth.user.get('session');
      return this.$('#uploadLogo').fileupload({
        url: this.url,
        dataType: 'json',
        formData: {
          session: session
        },
        progressall: (function(_this) {
          return function(e, data) {
            var progress;
            _this.$('.fileupload-progress').fadeIn();
            progress = parseInt(data.loaded / data.total * 100, 10);
            return _this.set('progress', progress);
          };
        })(this),
        done: (function(_this) {
          return function() {
            return _this.done();
          };
        })(this),
        error: (function(_this) {
          return function(jqXHR, textStatus, errorThrown) {
            _this.set('errorMessage', '上传失败');
            if (jqXHR.status === 415) {
              _this.set('errorMessage', '上传的文件类型不支持');
            }
            _this.$('.fileupload-progress').fadeOut();
            _this.$('.fileupload-error').fadeIn();
            return _this.$('.fileupload-error').delay(3000).fadeOut();
          };
        })(this)
      });
    },
    done: function() {
      return this.$('.fileupload-progress').fadeOut();
    },
    error: function() {}
  });

}).call(this);
