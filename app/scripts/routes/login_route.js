(function() {
  Enterprise.LoginRoute = Em.Route.extend({
    actions: {
      login: function() {
        var columnName, formData, loginController, password, username;
        formData = {};
        loginController = this.controllerFor('login');
        username = loginController.get('email');
        password = loginController.get('password');
        columnName = (username.indexOf("@")) !== -1 ? "email" : "phone_number";
        formData[columnName] = username;
        formData['password'] = password;
        return Ember.$.ajax({
          url: '/api/session/create',
          dataType: 'json',
          type: 'post'
        }).then((function(_this) {
          return function(data) {
            if (data.status === "OK") {
              formData['session'] = data.session;
              return Ember.$.ajax({
                url: '/api/account/login',
                dataType: 'json',
                type: 'post',
                data: formData
              }).then(function(data) {
                var applicationController, transition;
                if (data.status === "OK") {
                  localStorage.setItem('xiaoxiao:currentUserID', data.userId);
                  localStorage.setItem('xiaoxiao:session', formData['session']);
                  applicationController = _this.controllerFor('application');
                  transition = applicationController.get('savedTransition');
                  applicationController.login();
                  if (transition && transition.targetName !== 'authenticated.index') {
                    return transition.retry();
                  } else {
                    return _this.transitionTo('home');
                  }
                } else {
                  return Notifier.error('您输入的用户名或密码不正确');
                }
              }, function() {
                return Notifier.error('WebService Error');
              });
            }
          };
        })(this), function() {
          return Notifier.error('WebService Error');
        });
      }
    }
  });

}).call(this);
