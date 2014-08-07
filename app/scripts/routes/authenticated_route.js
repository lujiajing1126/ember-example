// Generated by EmberScript 0.0.14
var set$ = Ember.set;
var get$ = Ember.get;
set$(Enterprise, 'AuthenticatedRoute', Ember.Route.extend({
  beforeModel: function (transition) {
    var applicationController, userHash;
    applicationController = this.controllerFor('application');
    userHash = localStorage.getItem('xxoa:currentUser');
    if (userHash && userHash !== null) {
      return this.controllerFor('application').login();
    } else {
      return applicationController.set('savedTransition', transition);
    }
  }
}));