// Generated by EmberScript 0.0.14
var set$ = Ember.set;
var get$ = Ember.get;
set$(Enterprise, 'LoginRoute', Ember.Route.extend({
  actions: {
    login: function () {
      var email, loginController, password;
      loginController = this.controllerFor('login');
      email = loginController.get('email');
      password = loginController.get('password');
      return Ember.$.ajax({
        url: '/testapi/login.json',
        dataType: 'json',
        type: 'get'
      }).then(function (this$) {
        return function (data) {
          if (get$(data, 'email') === email && get$(data, 'password') === password)
            return this$.transitionTo('home');
        };
      }(this));
    }
  }
}));