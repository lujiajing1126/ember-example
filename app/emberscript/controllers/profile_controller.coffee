Enterprise.SettingProfileController = Em.ObjectController.extend
	actions:
		saveInfo: ->
			orgId = Enterprise.Auth.ent?.get('id')
			session = Enterprise.Auth.user?.get('session')
			targetEvent = []
			sponsorForm = []
			for target in ['wantXS','wantYS','wantTY','wantSJ','wantQT','wantGY']
				targetEvent.push target if @get(target) is true
			for form in ['isGood','isTech','isMoney']
				sponsorForm.push form if @get(form) is true
			console.log targetEvent
			data =
				data:
					organizationInfo:
						email: @get 'email'
						description: @get 'description'
					sponsor:
						peopleNumber: + @get 'peopleNumber'
						targetMoney: + @get 'targetMoney'
						address: @get 'address'
						targetEvent: targetEvent.join(',')
						begin: moment(@get('begin')).unix()
						end: moment(@get('end')).unix()
						sponsorForm: sponsorForm.join(',')
						targetAudience: @get('targetAudience')
						targetSchools: @get('targetSchools')
				session: session
			data.data = JSON.stringify data.data
			console.log data
			Em.$.ajax(url: "/api/org/#{orgId}/update", dataType: 'json',type: 'post' ,data:data).then (data)=>
				if data.status is 'OK'
					console.log data
	checkData: (data)->
		console.log data