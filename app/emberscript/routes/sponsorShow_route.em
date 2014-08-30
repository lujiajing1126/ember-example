class Enterprise.SponsorShowRoute extends Em.Route
	model: (params)->
		session = localStorage.getItem 'xiaoxiao:session'
		sponsorId = params.sponsor_id
		fields = ['demanding','title','providing','publicity','praiserfund','money']
		Em.$.ajax(url:"/api/sponsor/sponsor_request/#{sponsorId}/load?session=#{session}&fields=#{fields.join(',')}").then (payload)=>
			if payload.status is "OK"
				@get('store').pushMany 'activity',payload.events
				payload.sponsor.requestAttachment.map (json)->
					json.id = json.file
					json
				@store.pushMany 'requestAttachment',payload.sponsor.requestAttachment
				payload.sponsor.events = payload.events
				payload.sponsor.organization = payload.organization
				eventIds = payload.sponsor.events.mapProperty('id')
				requestAttachmentIds = payload.sponsor.requestAttachment.mapProperty('id')
				payload.sponsor.events = eventIds
				payload.sponsor.requestAttachment = requestAttachmentIds
				@get('store').push 'sponsor',payload.sponsor