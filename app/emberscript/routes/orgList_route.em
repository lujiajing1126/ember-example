class Enterprise.OrgListRoute extends Ember.Route
	model: ->
		session = localStorage.getItem 'xiaoxiao:session'
		Em.$.ajax(url: "/api/assodir/search?session=#{session}&name&skip=0&limit=10",dataType:'json').then (payload)=>
			if payload.status is "OK"
				firstAssodir = payload.assodirs[0].name
				assodirSerializer = @store.serializerFor('assodir')
				assodirData = assodirSerializer.extractArray @get('store'),Enterprise.Assodir,payload
				@store.pushMany 'assodir',assodirData
				Em.$.ajax(url: "/api/assodir/#{encodeURI(firstAssodir)}/load?session=#{session}",dataType:'json').then (payload)=>
					organizationsData = payload.organizations
					@store.pushMany 'org',organizationsData
					organizationsData = @store.all 'org'
					assodirData = @store.all 'assodir'
					organizations: organizationsData, assodirs: assodirData
			else
				Em.RSVP.reject "Service Error"