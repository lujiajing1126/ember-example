(function() {
  Enterpriseedition.Router.map(function() {
    this.route('index', {
      path: '/'
    });
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
    return this.route('history');
  });

}).call(this);
