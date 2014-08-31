class Enterprise.Org extends DS.Model
	contact: DS.attr('number')
	name: DS.attr('string')
	roleType: DS.attr('string')
	user: DS.belongsTo('user')
	assodir: DS.belongsTo('assodir')
	orgLogo: ~>
		"/api/org/#{@id}/logo"
	orgPage: ~>
		"/organization.html?oid=#{@id}"