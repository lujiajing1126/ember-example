// Generated by EmberScript 0.0.14
var set$ = Ember.set;
Ember.Handlebars.helper('moment', function (value) {
  return moment('' + value).format('YYYY-MM-DD hh:mm');
});