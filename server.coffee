pushserve = require('pushserve')

exports.startServer = (port, path, callback) ->
  opts = 
    noLog:       true
    path:        path + "/../"
    port:        port
    noPushState: true  
  pushserve opts, callback

