Enterpriseedition.Router.map ->
	@route 'index',{path:'/'}
	@resource 'ent', ->
		@route 'edit'
	@resource 'org',->
		@route 'list'
		@route 'show',{path:'/org/:orgId'}
	@resource 'act',->
		this.route 'list'
		this.route 'show',{path:'/act/:actId'}
	@resource 'sponsor',->
		this.route 'list'
		this.route 'show',{path:'/sponsor/:sponsorId'}
	@route 'history'
