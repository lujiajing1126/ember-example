Enterprise.DatetimePickerComponent = Ember.Component.extend
	tagName: 'div'
	name: '选择时间'
	id: null
	classNames: ['form-group']
	didInsertElement: ->
		$inputBox = @$().find('.datetimepicker').eq(0)
		$inputBox.datetimepicker
			format: 'yyyy-mm-dd'
		$inputBox.val(moment($inputBox.val(),'X').format('YYYY-MM-DD'))