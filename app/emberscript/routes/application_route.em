class Enterpriseedition.ApplicationRoute extends Ember.Route
    # admittedly, this should be in IndexRoute and not in the
    # top level ApplicationRoute; we're in transition... :-)
    model: -> 
    	['red', 'yellow', 'blue']
