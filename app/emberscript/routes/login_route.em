class Enterprise.LoginRoute extends Ember.Route
	actions:
		login: ->
			console.log 'login actions'
			formData = {}
			loginController = @controllerFor 'login'
			username = loginController.get 'email'
			password = loginController.get 'password'
			columnName = if (username.indexOf "@") isnt -1 then "email" else "phone_number"
			formData[columnName] = username
			formData['password'] = password
			Ember.$.ajax({url: '/api/session/create', dataType: 'json',type:'post'}).then (data) =>
				if data.status is "OK"
					formData['session'] = data.session
					Ember.$.ajax( url:'/api/account/login',dataType: 'json',type: 'post',data: formData )
					.then (data) =>
						if data.status is "OK"
							localStorage.setItem 'xiaoxiao:currentUserID', data.userId
							localStorage.setItem 'xiaoxiao:session', formData['session']
							applicationController = @controllerFor('application')
							transition = applicationController.get('savedTransition')
							applicationController.login()
							transition = applicationController.get('savedTransition')
							# if the user was going somewhere, send them along, otherwise
							# default to `/home`
							if transition and transition.targetName != 'authenticated.index'
								transition.retry()
							else
								@transitionTo 'home'
						else
							Notifier.error '您输入的用户名或密码不正确'