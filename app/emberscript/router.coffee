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
			@route 'show', path:'/org/:org_id'
		@resource 'act',->
			this.route 'list'
			this.route 'show', path:'/:act_id'
		@resource 'sponsor',->
			this.route 'list'
			this.route 'show', path:'/:sponsor_id'
		@resource 'history'
