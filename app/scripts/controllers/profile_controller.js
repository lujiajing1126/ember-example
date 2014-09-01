(function() {
  Enterprise.SettingProfileController = Em.ObjectController.extend({
    actions: {
      saveInfo: function() {
        var data, form, orgId, session, sponsorForm, target, targetEvent, _i, _j, _len, _len1, _ref, _ref1, _ref2, _ref3;
        orgId = (_ref = Enterprise.Auth.ent) != null ? _ref.get('id') : void 0;
        session = (_ref1 = Enterprise.Auth.user) != null ? _ref1.get('session') : void 0;
        targetEvent = [];
        sponsorForm = [];
        _ref2 = ['wantXS', 'wantYS', 'wantTY', 'wantSJ', 'wantQT', 'wantGY'];
        for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
          target = _ref2[_i];
          if (this.get(target) === true) {
            targetEvent.push(target);
          }
        }
        _ref3 = ['isGood', 'isTech', 'isMoney'];
        for (_j = 0, _len1 = _ref3.length; _j < _len1; _j++) {
          form = _ref3[_j];
          if (this.get(form) === true) {
            sponsorForm.push(form);
          }
        }
        console.log(targetEvent);
        data = {
          data: {
            organizationInfo: {
              email: this.get('email'),
              description: this.get('description')
            },
            sponsor: {
              peopleNumber: +this.get('peopleNumber'),
              targetMoney: +this.get('targetMoney'),
              address: this.get('address'),
              targetEvent: targetEvent.join(','),
              begin: moment(this.get('begin')).unix(),
              end: moment(this.get('end')).unix(),
              sponsorForm: sponsorForm.join(','),
              targetAudience: this.get('targetAudience'),
              targetSchools: this.get('targetSchools')
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
    },
    checkData: function(data) {
      return console.log(data);
    }
  });

}).call(this);
