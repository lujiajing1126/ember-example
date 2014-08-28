class Enterprise.SponsorList extends DS.Model
	demanding: DS.attr("string")
	owner: DS.attr("number")
	providing: DS.attr("string")
	publicity: DS.attr("boolean")
	timeOfRequest: DS.attr("date")
	title: DS.attr("string")
	orgLogo: ~>
		"/api/org/#{@owner}/logo"
