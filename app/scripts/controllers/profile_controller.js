(function() {
  Enterprise.SettingProfileController = Em.ObjectController.extend({
    actions: {
      saveInfo: function() {
        var beginTime, data, endTime, form, orgId, session, sponsorForm, target, targetEvent, targetSchoolSrc, targetSchools, _i, _j, _len, _len1, _ref, _ref1, _ref2, _ref3;
        orgId = (_ref = Enterprise.Auth.ent) != null ? _ref.get('id') : void 0;
        session = (_ref1 = Enterprise.Auth.user) != null ? _ref1.get('session') : void 0;
        targetEvent = [];
        sponsorForm = [];
        beginTime = ("" + this.get('begin')).indexOf('-') === -1 ? (+this.get('begin')) * 1000 : this.get('begin');
        endTime = ("" + this.get('begin')).indexOf('-') === -1 ? (+this.get('end')) * 1000 : this.get('end');
        targetSchoolSrc = Em.$('#e1').select2('data');
        targetSchools = targetSchoolSrc.map(function(json) {
          return json.text;
        });
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
              begin: moment(beginTime).unix(),
              end: moment(endTime).unix(),
              sponsorForm: sponsorForm.join(','),
              targetAudience: this.get('targetAudience'),
              targetSchools: targetSchools.join(',')
            }
          },
          session: session
        };
        data.data = JSON.stringify(data.data);
        return Em.$.ajax({
          url: "/api/org/" + orgId + "/update",
          dataType: 'json',
          type: 'post',
          data: data
        }).then((function(_this) {
          return function(data) {
            if (data.status === 'OK') {
              return Notifier.success('公司信息保存成功');
            } else {
              return Notifier.error('保存失败，请重试');
            }
          };
        })(this), function() {
          return Notifier.error('服务器错误');
        });
      }
    },
    checkData: function(data) {
      return console.log(data);
    }
  });

}).call(this);
