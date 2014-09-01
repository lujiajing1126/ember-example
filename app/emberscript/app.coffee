Enterprise = window.Enterprise = Ember.Application.create
	LOG_TRANSITIONS: true
	HOST: 'http://localhost/api'

# 应该记录企业信息，不应该记录个人信息
Enterprise.Auth = Ember.Object.create()

# 用户ID也要保存
# localStorage xiaoxiao:userId
# localStorage xiaoxiao:session

Enterprise.ApplicationSerializer = DS.LSSerializer.extend()
Enterprise.ApplicationAdapter = DS.LSAdapter.extend
	namespace: 'xiaoxiao'

Em.RSVP.configure 'onerror', (error) ->
	Em.Logger.assert(false, error)

Em.$.ajaxSetup
	timeout: 10000

require 'scripts/controllers/*'
require 'scripts/store'
require 'scripts/models/*'
require 'scripts/routes/*'
require 'scripts/helpers/*'
require 'scripts/components/*'
require 'scripts/views/*'
require 'scripts/serializers/*'
require 'scripts/router'