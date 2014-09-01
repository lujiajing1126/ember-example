(function() {
  Enterprise.OrgListRoute = Em.Route.extend({
    model: function() {
      var session;
      session = localStorage.getItem('xiaoxiao:session');
      return Em.$.ajax({
        url: "/api/assodir/search?session=" + session + "&name&skip=0&limit=10",
        dataType: 'json'
      }).then((function(_this) {
        return function(payload) {
          var assodirData, assodirSerializer, firstAssodir;
          if (payload.status === "OK") {
            firstAssodir = payload.assodirs[0].name;
            assodirSerializer = _this.store.serializerFor('assodir');
            assodirData = assodirSerializer.extractArray(_this.get('store'), Enterprise.Assodir, payload);
            _this.store.pushMany('assodir', assodirData);
            return Em.$.ajax({
              url: "/api/assodir/" + (encodeURI(firstAssodir)) + "/load?session=" + session,
              dataType: 'json'
            }).then(function(payload) {
              var organizationsData;
              organizationsData = payload.organizations;
              _this.store.pushMany('org', organizationsData);
              organizationsData = _this.store.all('org');
              assodirData = _this.store.all('assodir');
              return {
                organizations: organizationsData,
                assodirs: assodirData
              };
            });
          } else {
            return Em.RSVP.reject("Service Error");
          }
        };
      })(this), (function(_this) {
        return function() {
          alert("服务器错误");
          return _this.transitionTo('login');
        };
      })(this));
    },
    actions: {
      chDir: function(name) {
        return console.log(name);
      }
    }
  });

}).call(this);
