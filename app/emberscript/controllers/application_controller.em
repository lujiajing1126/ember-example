class Enterprise.ApplicationController extends Ember.ArrayController
	# when a user enters the app unauthenticated, the transition
	# to where they are going is saved off so it can be retried
	# when they have logged in.
	savedTransition: null

	login: ->
		userData = {}
		session = localStorage.getItem 'xiaoxiao:session'
		userId = localStorage.getItem 'xiaoxiao:currentUserID'
		fields = ['organizationInfo.id','organizationInfo.name','organizationInfo.parent','organizationInfo.email','organizationInfo.contact','organizationInfo.description','extendedOrganizationInfo.type','extendedOrganizationInfo.credit','dynamic.numberOfMembers','dynamic.numberOfFollowers','dynamic.numberOfEvents','dynamic.roleType']
		Ember.$.ajax( url: "/api/user/#{userId}/info?session=#{session}&fields=#{fields.join(',')}",dataType: 'json' ).then (data)=>
			if(data.status is "OK")
				userData.dynamic = userData
				Em.$.ajax( url: "/api/account/list_administrated_organizations?session=#{session}",dataType: 'json' ).then (data)=>
					# User Model
					userSerializer = @get('store').serializerFor 'user'
					orgId = data.organizations[0].id
					userData = userSerializer.extract(@get('store'), Enterprise.User, user: {id:userId,session:session,org:orgId},userId, 'find')
					user = @get('store').push 'user', userData.user
					# Organization Model
					organizations = data.organizations.map (json)->
						json.user = userId
						json
					organization = organizations[0]
					OrganizationData = @get('store').push 'org',organization
					Enterprise.Auth.set 'user', user
					Enterprise.Auth.set 'ent', OrganizationData
					@set 'savedTransition', null
	logout: ->
		localStorage.setItem 'xiaoxiao:currentUserID', null
		localStorage.setItem 'xiaoxiao:session', null
		Enterprise.Auth.set 'user', null