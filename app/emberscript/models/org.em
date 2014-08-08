class Enterprise.Org extends DS.Model
	parent: DS.attr('number')
	contact: DS.attr('number')
	name: DS.attr('string')
	description: DS.attr('string')
	email: DS.attr('string')
	numberOfFollowers: DS.attr('number')
	numberOfExecutingEvents: DS.attr('number')
	numberOfMembers: DS.attr('number')
	roleType: DS.attr('string')

Enterprise.Org.FIXTURES = [
	{"parent":null,"contact":351,"name":"阿宾快进来","description":"先帝创业未半而中道崩阻先帝创业未半而中道崩阻先帝创业未半而中道崩阻","id":352,"email":"450994392@qq.com","numberOfFollowers":0,"numberOfExecutingEvents":1,"numberOfMembers":4,"roleType":"none"},
]