(function() {
  var Enterprise;

  Enterprise = window.Enterprise = Ember.Application.create({
    LOG_TRANSITIONS: true,
    HOST: 'http://localhost/api'
  });

  Enterprise.Auth = Ember.Object.create();

  Enterprise.ApplicationSerializer = DS.LSSerializer.extend();

  Enterprise.ApplicationAdapter = DS.LSAdapter.extend({
    namespace: 'xiaoxiao'
  });

  Em.RSVP.configure('onerror', function(error) {
    return Em.Logger.assert(false, error);
  });

  require('scripts/controllers/*');

  require('scripts/store');

  require('scripts/models/*');

  require('scripts/routes/*');

  require('scripts/helpers/*');

  require('scripts/components/*');

  require('scripts/views/*');

  require('scripts/serializers/*');

  require('scripts/router');

}).call(this);
