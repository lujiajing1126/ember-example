// Generated by EmberScript 0.0.14
var set$ = Ember.set;
var get$ = Ember.get;
set$(Enterprise, 'LogoutRoute', Ember.Route.extend({
  setupController: function () {
    return this.transitionTo('login');
  }
}));