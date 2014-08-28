class Enterprise.ActShowRoute extends Em.Route
	model: (params) ->
		#@store.find 'activity',params.act_id
		act_id = params.act_id
		session = localStorage.getItem 'xiaoxiao:session'
		fields = ['name','stage','location','category','description','begin','end','numberOfPeople','numberOfPreservedSeats','organizationName','organizationId','signingUpFields','poster','images','attachments','targets','budgets']
		Em.$.ajax(url:"/api/event/#{act_id}/load?session=#{session}&fields=#{fields.join(',')}").then (data)=>
			if data.status is "OK"
				console.log(data)
				@store.push 'activity',data.static
			else if data.status is "Permission Denied"
				Em.RSVP.reject "Permission Denied"
				history.go -1
				Notifier.error "对不起，你没有权限查看该活动"
