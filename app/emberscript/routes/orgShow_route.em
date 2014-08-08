class Enterprise.OrgShowRoute extends Ember.Route
	model: (params)->
		@store.find 'org',params.org_id