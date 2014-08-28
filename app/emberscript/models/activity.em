class Enterprise.Activity extends DS.Model
	name: DS.attr('string')
	stage: DS.attr('string')
	location: DS.attr('string')
	category: DS.attr('string')
	description: DS.attr('string')
	begin: DS.attr('date')
	end: DS.attr('date')
	numberOfPeople: DS.attr('number')
	numberOfPreservedSeats: DS.attr('number')
	organizationName: DS.attr('string')
	organizationId: DS.attr('number')
	signingUpFields: DS.attr()
	poster: DS.attr()
	images: DS.attr()
	attachments: DS.attr()
	targets: DS.attr()
	budgets: DS.attr()
	hasSigningUpFields: ~>
		if @signingUpFields? then true else false
	noSigningUpFields: ~>
		if @signingUpFields? then false else true
	needName: ~>
		if (@signingUpFields?.indexOf('name') isnt -1) then true else false
	needNickname: ~>
		if (@signingUpFields?.indexOf('nickname') isnt -1) then true else false
	needStudentId: ~>
		if (@signingUpFields?.indexOf('studentId') isnt -1) then true else false
	needPhoneNumber: ~>
		if (@signingUpFields?.indexOf('phone-number') isnt -1) then true else false
	needEmail: ~>
		if (@signingUpFields?.indexOf('email') isnt -1) then true else false
	needSchool: ~>
		if (@signingUpFields?.indexOf('school') isnt -1) then true else false
	needDepartment: ~>
		if (@signingUpFields?.indexOf('department') isnt -1) then true else false
	needMajor: ~>
		if (@signingUpFields?.indexOf('major') isnt -1) then true else false
	needGrade: ~>
		if (@signingUpFields?.indexOf('grade') isnt -1) then true else false
	posterSrc: ~>
		"/api/event/#{@id}/poster/load"
	totalBudget: ~>
		total = 0
		if @budgets?
			total += one.amount * one.number for one in @budgets
		total
	isLecture: ~>
		if @category is "讲座" then true else false
	isParty: ~>
		if @category is "聚会" then true else false
	isPerformance: ~>
		if @category is "演出" then true else false
	isGame: ~>
		if @category is "赛事" then true else false
	isCommunity: ~>
		if @category is "公益" then true else false
	isRecruit: ~>
		if @category is "招新" then true else false
	isOthers: ~>
		if @category is "其它" then true else false