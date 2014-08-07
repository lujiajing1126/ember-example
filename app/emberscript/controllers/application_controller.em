class Enterprise.ApplicationController extends Ember.ArrayController
	# when a user enters the app unauthenticated, the transition
	# to where they are going is saved off so it can be retried
	# when they have logged in.
	savedTransition: null
	login: ->
		true
	logout: ->
		false
