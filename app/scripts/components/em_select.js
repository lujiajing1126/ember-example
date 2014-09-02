(function() {
  Enterprise.EmSelectComponent = Ember.Component.extend({
    name: '扩展选择控件',
    tagName: 'div',
    placeholder: null,
    classNames: ['input-group'],
    url: null,
    data: null,
    targetSchools: [],
    didInsertElement: function() {
      var school, _i, _len, _ref;
      if (this.data != null) {
        _ref = this.data.split(',');
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          school = _ref[_i];
          this.targetSchools.push({
            id: school,
            text: school
          });
        }
      }
      this.$().find('#e1').select2({
        placeholder: this.placeholder,
        minimumInputLength: 1,
        tags: ['全部'],
        tokenSeparators: [',', ' ', ';']
      });
      return Em.$('#e1').select2('data', this.targetSchools);
    }
  });

}).call(this);
