Enterprise.EmSelectComponent = Ember.Component.extend
	name: '扩展选择控件'
	tagName: 'div'
	placeholder: null
	classNames: ['input-group']
	url: null
	data: null
	targetSchools: []

	didInsertElement: ->
		@targetSchools.push( id: school,text: school ) for school in @data.split(',') if @data?
		@$().find('#e1').select2
			placeholder: @placeholder
			minimumInputLength: 1
			tags: ['全部']
			tokenSeparators: [',',' ',';']
		Em.$('#e1').select2 'data',@targetSchools
