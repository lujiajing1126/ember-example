Enterprise.FileUploadComponent = Ember.Component.extend
	name: '上传文件'
	url: null
	errorMessage: null
	progress: 0

	didInsertElement: ->
		console.log @url
		session = Enterprise.Auth.user.get('session')
		@$('#uploadLogo').fileupload
			url: @url
			dataType: 'json'
			formData:
				session: session
			progressall: (e, data) =>
				@$('.fileupload-progress').fadeIn()
				progress = parseInt(data.loaded / data.total * 100, 10)
				@set 'progress', progress
			done: => @done()
			error: (jqXHR, textStatus, errorThrown) =>
				@set('errorMessage', '上传失败')
				if jqXHR.status == 415
					@set('errorMessage', '上传的文件类型不支持')
				@$('.fileupload-progress').fadeOut()
				@$('.fileupload-error').fadeIn()
				@$('.fileupload-error').delay(3000).fadeOut()

	done: ->
		@$('.fileupload-progress').fadeOut()

	error: ->