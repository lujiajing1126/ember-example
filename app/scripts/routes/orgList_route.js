// Generated by EmberScript 0.0.14
var set$ = Ember.set;
var get$ = Ember.get;
set$(Enterprise, 'OrgListRoute', Ember.Route.extend({
  model: function () {
    var session;
    session = localStorage.getItem('xiaoxiao:session');
    return get$(Em, '$').ajax({
      url: '/api/assodir/search?session=' + session + '&name&skip=0&limit=10',
      dataType: 'json'
    }).then(function (this$) {
      return function (payload) {
        var assodirData, assodirSerializer, firstAssodir;
        if (get$(payload, 'status') === 'OK') {
          firstAssodir = get$(get$(payload, 'assodirs')[0], 'name');
          assodirSerializer = get$(this$, 'store').serializerFor('assodir');
          assodirData = assodirSerializer.extractArray(this$.get('store'), get$(Enterprise, 'Assodir'), payload);
          get$(this$, 'store').pushMany('assodir', assodirData);
          return get$(Em, '$').ajax({
            url: '/api/assodir/' + encodeURI(firstAssodir) + '/load?session=' + session,
            dataType: 'json'
          }).then(function (this$1) {
            return function (payload) {
              var organizationsData;
              organizationsData = get$(payload, 'organizations');
              get$(this$1, 'store').pushMany('org', organizationsData);
              organizationsData = get$(this$1, 'store').all('org');
              assodirData = get$(this$1, 'store').all('assodir');
              return {
                organizations: organizationsData,
                assodirs: assodirData
              };
            };
          }(this$));
        } else {
          return get$(Em, 'RSVP').reject('Service Error');
        }
      };
    }(this));
  },
  actions: {
    chDir: function (name) {
      return console.log(name);
    }
  }
}));