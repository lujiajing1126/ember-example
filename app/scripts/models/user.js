// Generated by EmberScript 0.0.14
var set$ = Ember.set;
var get$ = Ember.get;
set$(Enterprise, 'User', get$(DS, 'Model').extend({
  username: DS.attr('string'),
  session: DS.attr('string'),
  orgs: DS.hasMany('org')
}));