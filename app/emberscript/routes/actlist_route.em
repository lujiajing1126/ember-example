class Enterprise.ActListRoute extends Ember.Route
	model: ->
		@store.find 'actList'