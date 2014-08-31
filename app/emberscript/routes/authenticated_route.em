class Enterprise.AuthenticatedRoute extends Ember.Route
	beforeModel: (transition) ->
		applicationController = @controllerFor 'application'
		userSession = localStorage.getItem 'xiaoxiao:session'
		if userSession and userSession isnt 'null'
			@controllerFor('application').login()
		else
			applicationController.set 'savedTransition', transition
			@transitionTo 'login'
	actions:
		expandMailbox: ->
			alert 'expand'
	model: ->
		Enterprise.Auth
	setupController: (controller,model)->
		controller.set 'model',model
