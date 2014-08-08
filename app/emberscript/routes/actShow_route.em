class Enterprise.ActShowRoute extends Ember.Route
	model: (params) ->
		console.log params.act_id
		@store.find 'activity',params.act_id