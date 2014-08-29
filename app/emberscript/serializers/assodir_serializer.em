class Enterprise.AssodirSerializer extends Enterprise.ApplicationSerializer
	extractArray: (store, type, payload)->
		assodirs = payload.assodirs
		assodirs.forEach (json)->
			console.log json
			json.id = json.name
		return @_super store,type,assodir:assodirs
