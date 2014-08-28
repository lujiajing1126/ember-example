Ember.Handlebars.helper 'moment', (value) ->
	moment(""+value).format 'YYYY-MM-DD HH:mm'