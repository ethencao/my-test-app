require './tmp'

MyApp.Router.map ->
  @resource 'tmp', ->
    @route 'test'