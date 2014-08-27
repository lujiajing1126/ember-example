class Enterprise.User extends DS.Model
	username: DS.attr('string')
	session: DS.attr('string')
	orgs: DS.hasMany('org')