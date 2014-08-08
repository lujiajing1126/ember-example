Enterprise.Router.map ->
	@resource 'login'

	@resource 'authenticated', path: '/', ->
		@resource 'logout'
		@resource 'home'
		@resource 'setting', ->
			@resource 'profile'
			@resource 'password'
		@resource 'org',->
			@route 'list'
			@route 'show', path:'/:org_id'
		@resource 'act',->
			@route 'list'
			@route 'show', path:'/:act_id'
		@resource 'sponsor',->
			@route 'list'
			@route 'show', path:'/:sponsor_id'
		@resource 'history'
