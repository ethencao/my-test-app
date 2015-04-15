# Ember = require 'bower_components/ember'
createEmberApplication = (appName) ->

  app = Ember.Application.create
    LOG_TRANSITIONS: true
    
    Resolver: Ember.DefaultResolver.extend
      resolveTemplate: (parsedName) -> 
        fullName = parsedName.fullNameWithoutType
        parsedName.fullNameWithoutType = appName + "/" + fullName
        ret = @_super(parsedName)
        if not ret
          parsedName.fullNameWithoutType = fullName
          @_super(parsedName)
        else
          ret

  # preload all templates under '/templates'
  for mod in window.require.list()
    if mod.indexOf(appName + '/') is 0
      if mod.match /templates/
        require(mod)
  app

App = createEmberApplication("myapp")

App.IndexController = Em.Controller.extend
  actions:
    foo: ->
      false

module.exports = window.MyApp = App