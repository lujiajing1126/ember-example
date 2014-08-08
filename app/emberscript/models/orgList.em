class Enterprise.OrgList extends DS.Model
	name: DS.attr('string')
	roleType: DS.attr('string')

Enterprise.OrgList.FIXTURES = [
	{"name":"阿宾快进来","id":352,"roleType":"none"},
	{"name":"测试组织一","id":53,"roleType":"none"},
	{"name":"阿宾快进来1","id":1,"roleType":"none"},
	{"name":"阿宾快进来3","id":2,"roleType":"none"},
	{"name":"阿宾快进来4","id":3,"roleType":"none"},
]