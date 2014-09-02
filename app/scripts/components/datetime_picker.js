(function() {
  Enterprise.DatetimePickerComponent = Ember.Component.extend({
    tagName: 'div',
    name: '选择时间',
    id: null,
    classNames: ['form-group'],
    didInsertElement: function() {
      var $inputBox;
      $inputBox = this.$().find('.datetimepicker').eq(0);
      $inputBox.datetimepicker({
        format: 'yyyy-mm-dd'
      });
      return $inputBox.val(moment($inputBox.val(), 'X').format('YYYY-MM-DD'));
    }
  });

}).call(this);
