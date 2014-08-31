class Enterprise.User extends DS.Model
	username: DS.attr('string', defaultValue: '您还没起名呢')
	session: DS.attr('string')
	org: DS.belongsTo('org')