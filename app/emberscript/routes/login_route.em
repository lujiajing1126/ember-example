class Enterprise.LoginRoute extends Ember.Route
	actions:
		login: ->
			loginController = @controllerFor 'login'
			email = loginController.get 'email'
			password = loginController.get 'password'
			Ember.$.ajax({url: '/testapi/login.json', dataType: 'json',type:'get'}).then (data) =>
				@transitionTo 'home' if data.email is email and data.password is password