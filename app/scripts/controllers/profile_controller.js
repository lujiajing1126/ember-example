(function() {
  Enterprise.SettingProfileController = Em.ObjectController.extend({
    actions: {
      saveInfo: function() {
        return alert(this.get('name'));
      }
    }
  });

}).call(this);
