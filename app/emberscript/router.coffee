Enterprise.Router.map ->
	@resource 'login'

	@resource 'authenticated', path: '/', ->
		@resource 'logout'
		@resource 'home'

		@resource 'ent', ->
			@route 'edit'
		@resource 'org',->
			@route 'list'
			@route 'show', path:'/org/:orgId'
		@resource 'act',->
			this.route 'list'
			this.route 'show', path:'/act/:actId'
		@resource 'sponsor',->
			this.route 'list'
			this.route 'show', path:'/sponsor/:sponsorId'
		@resource 'history'
		@resource 'users', ->
			@route 'new'
			@resource 'user', path: '/:user_id'
