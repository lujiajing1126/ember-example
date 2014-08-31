class Enterprise.Assodir extends DS.Model
	name: DS.attr('string')
	orgs: DS.hasMany('org')