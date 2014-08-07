(function() {
  Enterprise.Router.map(function() {
    this.resource('login');
    return this.resource('authenticated', {
      path: '/'
    }, function() {
      this.resource('logout');
      this.resource('home');
      this.resource('ent', function() {
        return this.route('edit');
      });
      this.resource('org', function() {
        this.route('list');
        return this.route('show', {
          path: '/org/:orgId'
        });
      });
      this.resource('act', function() {
        this.route('list');
        return this.route('show', {
          path: '/act/:actId'
        });
      });
      this.resource('sponsor', function() {
        this.route('list');
        return this.route('show', {
          path: '/sponsor/:sponsorId'
        });
      });
      this.resource('history');
      return this.resource('users', function() {
        this.route('new');
        return this.resource('user', {
          path: '/:user_id'
        });
      });
    });
  });

}).call(this);
