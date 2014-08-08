Enterprise = window.Enterprise = Ember.Application.create
	LOG_TRANSITIONS: true
	HOST: 'http://localhost/api'

class Enterprise.Auth extends Ember.Auth
	request: 'jquery'
	response: 'json'

Enterprise.ApplicationSerializer = DS.ActiveModelSerializer.extend()

require 'scripts/controllers/*'
require 'scripts/store'
require 'scripts/models/*'
require 'scripts/routes/*'
require 'scripts/helpers/*'
require 'scripts/components/*'
require 'scripts/views/*'
require 'scripts/router'