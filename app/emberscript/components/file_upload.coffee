Enterprise.FileUploadComponent = Ember.Component.extend
	name: '上传文件'
	url: null
	errorMessage: ''
	progress: 0

	didInsertElement: ->
		console.log @$('body')
		console.log @get('store')