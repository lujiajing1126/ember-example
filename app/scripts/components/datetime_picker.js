(function() {
  Enterprise.DatetimePickerComponent = Ember.Component.extend({
    tagName: 'div',
    name: '选择时间',
    id: null,
    classNames: ['form-group'],
    didInsertElement: function() {
      console.log(this.$().find('.datetimepicker').eq(0));
      return this.$().find('.datetimepicker').eq(0).datetimepicker({
        format: 'yyyy-mm-dd'
      });
    }
  });

}).call(this);
