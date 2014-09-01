Enterprise.SettingProfileController = Em.ObjectController.extend
	actions:
		saveInfo: ->
			orgId = Enterprise.Auth.ent?.get('id')
			session = Enterprise.Auth.user?.get('session')
			data =
				data:
					organizationInfo:
						email: @get 'email'
						description: @get 'description'
					sponsor:
						peopleNumber: + @get 'peopleNumber'
						#targetMoney: + @get 'targetMoney'
						address: @get 'address'
				session: session
			data.data = JSON.stringify data.data
			console.log data
			Em.$.ajax(url: "/api/org/#{orgId}/update", dataType: 'json',type: 'post' ,data:data).then (data)=>
				if data.status is 'OK'
					console.log data
