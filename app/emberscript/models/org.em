class Enterprise.Org extends DS.Model
	contact: DS.attr('number')
	name: DS.attr('string')
	roleType: DS.attr('string')
	user: DS.belongsTo('user')
	orgLogo: ~>
		"/api/org/#{@id}/logo"