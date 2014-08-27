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
				Ember.$.ajax( url: "/api/account/list_administrated_organizations?session=#{session}",dataType: 'json' ).then (data)=>
					# User Model
					userSerializer = @get('store').serializerFor('user')
					orgsId = data.organizations.mapProperty('id')
					userData = userSerializer.extract(@get('store'), Enterprise.User, user: {id:userId,session:session,orgs:orgsId},userId, 'find')
					user = @get('store').push('user', userData)

					# Organization Model
					orgSerializer = @get('store').serializerFor('org')
					organizations = data.organizations.map (json)->
						json.user = userId
						json
					orgData = orgSerializer.extractArray @get('store'), Enterprise.Org , organizations
					@get('store').pushMany 'org',orgData

					Enterprise.Auth.set 'user', user
					@set 'savedTransition', null
	logout: ->
		localStorage.setItem 'xiaoxiao:currentUserID', null
		localStorage.setItem 'xiaoxiao:session', null
		Enterprise.Auth.set 'user', null