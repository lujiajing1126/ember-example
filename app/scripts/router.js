(function() {
  Enterprise.Router.map(function() {
    this.resource('login');
    return this.resource('authenticated', {
      path: '/'
    }, function() {
      this.resource('logout');
      this.resource('home');
      this.resource('setting', function() {
        this.resource('profile');
        return this.resource('password');
      });
      this.resource('org', function() {
        this.route('list');
        return this.route('show', {
          path: '/org/:org_id'
        });
      });
      this.resource('act', function() {
        this.route('list');
        return this.route('show', {
          path: '/:act_id'
        });
      });
      this.resource('sponsor', function() {
        this.route('list');
        return this.route('show', {
          path: '/:sponsor_id'
        });
      });
      return this.resource('history');
    });
  });

}).call(this);
