(function() {
  var Enterprise,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Enterprise = window.Enterprise = Ember.Application.create({
    LOG_TRANSITIONS: true,
    HOST: 'http://localhost/api'
  });

  Enterprise.Auth = (function(_super) {
    __extends(Auth, _super);

    function Auth() {
      return Auth.__super__.constructor.apply(this, arguments);
    }

    Auth.prototype.request = 'jquery';

    Auth.prototype.response = 'json';

    return Auth;

  })(Ember.Auth);

  require('scripts/controllers/*');

  require('scripts/store');

  require('scripts/models/*');

  require('scripts/routes/*');

  require('scripts/components/*');

  require('scripts/views/*');

  require('scripts/router');

}).call(this);
