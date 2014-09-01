(function() {
  Enterprise.SettingProfileController = Em.ObjectController.extend({
    actions: {
      saveInfo: function() {
        var data, orgId, session, _ref, _ref1;
        orgId = (_ref = Enterprise.Auth.ent) != null ? _ref.get('id') : void 0;
        session = (_ref1 = Enterprise.Auth.user) != null ? _ref1.get('session') : void 0;
        data = {
          data: {
            organizationInfo: {
              email: this.get('email'),
              description: this.get('description')
            },
            sponsor: {
              peopleNumber: +this.get('peopleNumber'),
              address: this.get('address')
            }
          },
          session: session
        };
        data.data = JSON.stringify(data.data);
        console.log(data);
        return Em.$.ajax({
          url: "/api/org/" + orgId + "/update",
          dataType: 'json',
          type: 'post',
          data: data
        }).then((function(_this) {
          return function(data) {
            if (data.status === 'OK') {
              return console.log(data);
            }
          };
        })(this));
      }
    }
  });

}).call(this);
