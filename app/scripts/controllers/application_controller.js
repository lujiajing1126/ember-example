(function() {
  Enterprise.ApplicationController = Em.ArrayController.extend({
    savedTransition: null,
    login: function() {
      var fields, session, userData, userId;
      userData = {};
      session = localStorage.getItem('xiaoxiao:session');
      userId = localStorage.getItem('xiaoxiao:currentUserID');
      fields = ['organizationInfo.id', 'organizationInfo.name', 'organizationInfo.parent', 'organizationInfo.email', 'organizationInfo.contact', 'organizationInfo.description', 'extendedOrganizationInfo.type', 'extendedOrganizationInfo.credit', 'dynamic.numberOfMembers', 'dynamic.numberOfFollowers', 'dynamic.numberOfEvents', 'dynamic.roleType'];
      return Ember.$.ajax({
        url: "/api/user/" + userId + "/info?session=" + session + "&fields=" + (fields.join(',')),
        dataType: 'json'
      }).then((function(_this) {
        return function(data) {
          if (data.status === "OK") {
            userData.dynamic = userData;
            return Em.$.ajax({
              url: "/api/account/list_administrated_organizations?session=" + session,
              dataType: 'json'
            }).then(function(data) {
              var OrganizationData, orgId, organization, organizations, user, userSerializer;
              userSerializer = _this.get('store').serializerFor('user');
              orgId = data.organizations[0].id;
              userData = userSerializer.extract(_this.get('store'), Enterprise.User, {
                user: {
                  id: userId,
                  session: session,
                  org: orgId
                }
              }, userId, 'find');
              user = _this.get('store').push('user', userData.user);
              organizations = data.organizations.map(function(json) {
                json.user = userId;
                return json;
              });
              organization = organizations[0];
              OrganizationData = _this.get('store').push('org', organization);
              Enterprise.Auth.set('user', user);
              Enterprise.Auth.set('ent', OrganizationData);
              return _this.set('savedTransition', null);
            });
          }
        };
      })(this), (function(_this) {
        return function() {
          alert('WebService Error');
          return _this.transitionToRoute('login');
        };
      })(this));
    },
    logout: function() {
      localStorage.setItem('xiaoxiao:currentUserID', null);
      localStorage.setItem('xiaoxiao:session', null);
      return Enterprise.Auth.set('user', null);
    }
  });

}).call(this);
