class Enterprise.Sponsor extends DS.Model
	demanding: DS.attr("string")
	owner: DS.attr('number')
	providing: DS.attr("string")
	publicity: DS.attr("boolean")
	timeOfRequest: DS.attr("date")
	title: DS.attr("string")
	money: DS.attr("number")
	requestAttachment: DS.hasMany("requestAttachment")
	events: DS.hasMany("activity")
	organization: DS.attr()