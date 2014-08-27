class Enterprise.AuthenticatedRoute extends Ember.Route
	beforeModel: (transition) ->
		applicationController = @controllerFor 'application'
		userSession = localStorage.getItem 'xiaoxiao:session'
		if userSession and userSession isnt 'null'
			@controllerFor('application').login()
		else
			applicationController.set 'savedTransition', transition
			@transitionTo 'login'