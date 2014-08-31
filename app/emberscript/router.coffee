Enterprise.Router.map ->
	@resource 'login'

	@resource 'authenticated', path: '/', ->
		@resource 'logout'
		@resource 'home'
		@resource 'setting', ->
			@route 'profile', path: '/profile'
			@route 'password', path: '/password'
		@resource 'org',->
			@route 'list'
			@route 'search', path: 'search/:assodir_id'
			@route 'show', path:'/:org_id'
		@resource 'act',->
			@route 'list'
			@route 'show', path:'/:act_id'
		@resource 'sponsor',->
			@route 'list'
			@route 'show', path:'/:sponsor_id'