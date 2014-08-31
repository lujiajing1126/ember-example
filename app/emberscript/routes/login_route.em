class Enterprise.LoginRoute extends Ember.Route
	actions:
		login: ->
			formData = {}
			loginController = @controllerFor 'login'
			username = loginController.get 'email'
			password = loginController.get 'password'
			columnName = if (username.indexOf "@") isnt -1 then "email" else "phone_number"
			formData[columnName] = username
			formData['password'] = password
			# 获取Session
			Ember.$.ajax({url: '/api/session/create', dataType: 'json',type:'post'}).then (data) =>
				if data.status is "OK"
					formData['session'] = data.session
					# 登陆验证逻辑
					Ember.$.ajax( url:'/api/account/login',dataType: 'json',type: 'post',data: formData )
					.then (data) =>
						# 登陆成功
						if data.status is "OK"
							# 记录用户ID
							localStorage.setItem 'xiaoxiao:currentUserID', data.userId
							# 记录Session
							localStorage.setItem 'xiaoxiao:session', formData['session']
							# 获取application控制器
							applicationController = @controllerFor('application')
							# 获取application控制器的savaedTransition属性
							transition = applicationController.get('savedTransition')
							applicationController.login()
							# transition = applicationController.get('savedTransition')
							# if the user was going somewhere, send them along, otherwise
							# default to `/home`
							if transition and transition.targetName != 'authenticated.index'
								transition.retry()
							else
								@transitionTo 'home'
						else
							# 登陆失败
							Notifier.error '您输入的用户名或密码不正确'