class Enterprise.SponsorListRoute extends Ember.Route
	model: ->
		session = localStorage.getItem 'xiaoxiao:session'
		Em.$.ajax(url: "/api/sponsor/list_sponsor_requests?session=#{session}&skip=0&limit=10").then (payload)=>
			console.log payload
			if payload.status is "OK"
				data = payload.sponsorRequests.map (json)->
					json.sponsor.timeOfRequest = json.sponsor.timeOfRequest.$date
					json.sponsor
				@store.pushMany 'sponsorList',data