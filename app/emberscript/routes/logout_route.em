class Enterprise.LogoutRoute extends Ember.Route
	setupController: ->
		session = localStorage.getItem 'xiaoxiao:session'
		Em.$.ajax(url: "/api/account/logout?session=#{session}", type: 'post' , dataType: 'json').then (payload) =>
			if payload.status is 'OK'
				@controllerFor('application').logout()
				@transitionTo 'login'