class Enterprise.OrgSearchRoute extends Ember.Route
	model: (params)->
		session = localStorage.getItem 'xiaoxiao:session'
		Em.$.ajax(url: "/api/assodir/search?session=#{session}&name&skip=0&limit=10",dataType:'json').then (payload)=>
			if payload.status is "OK"
				firstAssodir = params.assodir_id
				assodirSerializer = @store.serializerFor('assodir')
				assodirData = assodirSerializer.extractArray @get('store'),Enterprise.Assodir,payload
				@store.pushMany 'assodir',assodirData
				Em.$.ajax(url: "/api/assodir/#{encodeURI(firstAssodir)}/load?session=#{session}",dataType:'json').then (payload)=>
					organizationsData = payload.organizations
					organizationsData.map (json)->
						json.assodir = firstAssodir
					@store.pushMany 'org',organizationsData
					#organizationsData = @store.find 'org',assodir: firstAssodir
					assodirData = @store.all 'assodir'
					console.log organizationsData
					organizations: organizationsData, assodirs: assodirData
			else
				Em.RSVP.reject "Service Error"
	actions:
		chDir: (name)->
			console.log name