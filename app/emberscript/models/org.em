class Enterprise.Org extends DS.Model
	contact: DS.attr('number')
	name: DS.attr('string')
	roleType: DS.attr('string')
	user: DS.belongsTo('user')
	assodir: DS.belongsTo('assodir')
	address: DS.attr('string')
	targetMoney: DS.attr('number')
	targetEvent: DS.attr()
	targetAudience: DS.attr()
	peopleNumber: DS.attr('number')
	orgLogo: ~>
		"/api/org/#{@id}/logo"
	orgPage: ~>
		"/organization.html?oid=#{@id}"
	uploadUri: ~>
		"/api/org/#{@id}/set_logo"