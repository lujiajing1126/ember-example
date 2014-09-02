Enterprise.SettingProfileController = Em.ObjectController.extend
	actions:
		saveInfo: ->
			orgId = Enterprise.Auth.ent?.get('id')
			session = Enterprise.Auth.user?.get('session')
			targetEvent = []
			sponsorForm = []
			beginTime = if (""+@get('begin')).indexOf('-') is -1 then (+@get('begin'))*1000 else @get('begin')
			endTime = if (""+@get('begin')).indexOf('-') is -1 then (+@get('end'))*1000 else @get('end')
			targetSchoolSrc = Em.$('#e1').select2('data')
			targetSchools = targetSchoolSrc.map (json)->
				json.text
			for target in ['wantXS','wantYS','wantTY','wantSJ','wantQT','wantGY']
				targetEvent.push target if @get(target) is true
			for form in ['isGood','isTech','isMoney']
				sponsorForm.push form if @get(form) is true
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
						begin: moment(beginTime).unix()
						end: moment(endTime).unix()
						sponsorForm: sponsorForm.join(',')
						targetAudience: @get('targetAudience')
						targetSchools: targetSchools.join(',')
				session: session
			data.data = JSON.stringify data.data
			Em.$.ajax(url: "/api/org/#{orgId}/update", dataType: 'json',type: 'post' ,data:data).then (data)=>
				if data.status is 'OK'
					Notifier.success '公司信息保存成功'
				else
					Notifier.error '保存失败，请重试'
			, -> Notifier.error '服务器错误'
	checkData: (data)->
		console.log data