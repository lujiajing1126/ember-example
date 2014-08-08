class Enterprise.OrgListRoute extends Ember.Route
	model: ->
		@store.find 'OrgList'