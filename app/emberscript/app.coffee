Enterprise = window.Enterprise = Ember.Application.create
	LOG_TRANSITIONS: true
	HOST: 'http://localhost/api'

Enterprise.Auth = Ember.Object.create()

Enterprise.ApplicationSerializer = DS.ActiveModelSerializer.extend()

Em.RSVP.configure 'onerror', (error) ->
	Em.Logger.assert(false, error)

require 'scripts/controllers/*'
require 'scripts/store'
require 'scripts/models/*'
require 'scripts/routes/*'
require 'scripts/helpers/*'
require 'scripts/components/*'
require 'scripts/views/*'
require 'scripts/serializers/*'
require 'scripts/router'