Enterprise.DatetimePickerComponent = Ember.Component.extend
	tagName: 'div'
	name: '选择时间'
	id: null
	classNames: ['form-group']
	didInsertElement: ->
		console.log @$().find('.datetimepicker').eq(0)
		@$().find('.datetimepicker').eq(0).datetimepicker
			format: 'yyyy-mm-dd'