(function() {
  Enterprise.Router.map(function() {
    this.resource('login');
    return this.resource('authenticated', {
      path: '/'
    }, function() {
      this.resource('logout');
      this.resource('home');
      this.resource('setting', function() {
        this.route('profile', {
          path: '/profile'
        });
        return this.route('password', {
          path: '/password'
        });
      });
      this.resource('org', function() {
        this.route('list');
        this.route('search', {
          path: 'search/:assodir_id'
        });
        return this.route('show', {
          path: '/:org_id'
        });
      });
      this.resource('act', function() {
        this.route('list');
        return this.route('show', {
          path: '/:act_id'
        });
      });
      return this.resource('sponsor', function() {
        this.route('list');
        return this.route('show', {
          path: '/:sponsor_id'
        });
      });
    });
  });

}).call(this);
