class Enterprise.OrgShowRoute extends Ember.Route
	model: (params)->
		session = localStorage.getItem 'xiaoxiao:session'
		fields = ['organizationInfo.id','organizationInfo.name','organizationInfo.parent','organizationInfo.email','organizationInfo.contact','organizationInfo.description','extendedOrganizationInfo.type','extendedOrganizationInfo.credit','dynamic.numberOfMembers','dynamic.numberOfFollowers','dynamic.numberOfEvents','dynamic.roleType']
		Em.$.ajax(url: "/api/org/#{params.org_id}/info?session=#{session}&fields=#{fields.join(',')}").then (data)=>
			console.log data