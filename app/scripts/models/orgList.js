// Generated by EmberScript 0.0.14
var set$ = Ember.set;
var get$ = Ember.get;
set$(Enterprise, 'OrgList', get$(DS, 'Model').extend({
  email: DS.attr('string'),
  session: DS.attr('string'),
  name: DS.attr('string'),
  userId: DS.attr('number')
}));