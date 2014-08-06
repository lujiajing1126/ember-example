(function() {
  var Enterpriseedition;

  Enterpriseedition = window.Enterpriseedition = Ember.Application.create();

  require('scripts/controllers/*');

  require('scripts/store');

  require('scripts/models/*');

  require('scripts/routes/*');

  require('scripts/components/*');

  require('scripts/views/*');

  require('scripts/router');

}).call(this);
