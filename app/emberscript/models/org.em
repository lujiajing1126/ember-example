class Enterprise.Org extends DS.Model
	contact: DS.attr('number')
	name: DS.attr('string')
	roleType: DS.attr('string')
	user: DS.belongsTo('user')
	assodir: DS.belongsTo('assodir')
	address: DS.attr('string')
	targetMoney: DS.attr('number')
	targetEvent: DS.attr('string')
	targetAudience: DS.attr('string')
	targetSchools: DS.attr('string')
	peopleNumber: DS.attr('number')
	email: DS.attr('string')
	description: DS.attr('string')
	begin: DS.attr('date')
	end: DS.attr('date')
	sponsorForm: DS.attr('string')
	wantXS: ~>
		if @targetEvent? and @targetEvent.indexOf('wantXS') != -1 then true else false
	wantYS: ~>
		if @targetEvent? and @targetEvent.indexOf('wantYS') != -1 then true else false
	wantTY: ~>
		if @targetEvent? and @targetEvent.indexOf('wantTY') != -1 then true else false
	wantSJ: ~>
		if @targetEvent? and @targetEvent.indexOf('wantSJ') != -1 then true else false
	wantQT: ~>
		if @targetEvent? and @targetEvent.indexOf('wantQT') != -1 then true else false
	wantGY: ~>
		if @targetEvent? and @targetEvent.indexOf('wantGY') != -1 then true else false
	orgLogo: ~>
		"/api/org/#{@id}/logo"
	orgPage: ~>
		"/organization.html?oid=#{@id}"
	uploadUri: ~>
		"/api/org/#{@id}/set_logo"
	isGood: ~>
		if @sponsorForm? and @sponsorForm.indexOf('isGood') != -1 then true else false
	isTech: ~>
		if @sponsorForm? and @sponsorForm.indexOf('isTech') != -1 then true else false
	isMoney: ~>
		if @sponsorForm? and @sponsorForm.indexOf('isMoney') != -1 then true else false