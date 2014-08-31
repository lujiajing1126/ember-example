class Enterprise.SettingProfileRoute extends Em.Route
	model: ->
		Enterprise.Auth.get 'ent'
	setupController: (controller,model)->
		controller.set 'model',model