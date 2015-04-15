sysPath = require 'path'
startsWith = (string, substring) ->
  string.lastIndexOf(substring, 0) is 0

MODULE_NAME = "myapp"

config =

  paths:
    public: "../public/#{MODULE_NAME}"

  files:
    javascripts:
      defaultExtension: 'js'
      joinTo:
        'app.js': /^app/
        'vendor.js': /^(vendor|bower_components)/
      order:
        before: []
        after: []

    stylesheets:
      defaultExtension: 'css'
      joinTo:
        'app.css': /^(app|bower_components|vendor)/
      order:
        before: []
        after: []

    templates:
      precompile: true
      root:       '.'
      joinTo:     'app.js'
      paths:      
        jquery: 'bower_components/jquery/dist/jquery.js'
        ember: 'bower_components/ember/ember.js'
        handlebars: 'bower_components/handlebars/handlebars.js'
        emblem: 'node_modules/emblem/dist/emblem.js'

  plugins:
    emblem:
      templateNameMapper: (path)->
        slash = '/'
        path.replace(new RegExp('\\\\', 'g'), '/')
          .replace(/^app\//, '')
          .replace(/^templates\//, '')
          .replace(/\/templates\//, slash)
          .replace(/\.\w+$/, '')

  modules:
    nameCleaner: (path)->
      pre = "#{MODULE_NAME}/"
      path.replace /^(app)[\/\\\\]/, pre

  conventions:
    ignored: (path)-> 
      startsWith sysPath.basename(path), '_'

  server:
    path: './server'
    port: 4502
    run:  yes

  notifications: on
  optimize: off

exports.config = config

