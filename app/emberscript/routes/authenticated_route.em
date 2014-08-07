class Enterprise.AuthenticatedRoute extends Ember.Route
	beforeModel: (transition) ->
		applicationController = @controllerFor 'application'
		userHash = localStorage.getItem 'xxoa:currentUser'
		if userHash and userHash isnt null
			@controllerFor('application').login()
		else
			applicationController.set 'savedTransition', transition
			# @transitionTo 'login'