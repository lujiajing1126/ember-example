class Enterprise.Activity extends DS.Model
	stage: DS.attr('string')
	name: DS.attr('string')
	location: DS.attr('string')
	category: DS.attr('string')
	description: DS.attr('string')
	begin: DS.attr('date')
	end: DS.attr('date')
	numberOfPraisers: DS.attr('number')
	# 计算属性
	posterSrc: ~>
		"/api/event/#{@id}/poster/load"

Enterprise.Activity.FIXTURES = [
	{ "stage" : "drafting" , "name" : "呵呵呵呵呵" , "location" : "看图片" , "category" : "讲座" , "description" : "啦啦啦啦啦" , "begin" : "2014-08-01T18:15:00.000Z" , "end" : "2014-08-12T09:55:00.000Z" , "id" : "53dcca0ba80654311c798252","numberOfPraisers":0},
	{ "stage" : "drafting" , "name" : "新的活动" , "location" :"复旦大学" ,"category" : "讲座" , "description" : "啦啦啦啦" , "begin" : "2014-08-07T17:10:00.000Z" , "end" : "2014-08-08T18:15:00.000Z" , "id" : "53e367693866cb817ce7881a","numberOfPraisers":0 }
]