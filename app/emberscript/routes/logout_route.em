class Enterprise.LogoutRoute extends Ember.Route
	setupController: ->
		@controllerFor('application').logout()
		@transitionTo('login')