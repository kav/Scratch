express = require('express')
global.app = module.exports = express.createServer()
global.io = require('socket.io').listen(app)
# global.Together = require('together-bb').listen(io)
# fsobjectify = require('fsobjectify')

# global.Models = fsobjectify(__dirname + '/shared')
# app.api = fsobjectify(__dirname + '/api')

#require('japison')('/api', app.api)

# Configuration
app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'hbs'
  app.set 'view options', layout: false
  app.use express.compiler
    src: __dirname + '/client'
    dest: __dirname + '/cache'
    enable: ['coffeescript']
    app.use express.compiler
      src: __dirname + '/shared'
      dest: __dirname + '/cache'
      enable: ['coffeescript']
  app.use express.static(__dirname + '/cache')

# global.Models = require('./shared/models.coffee')

app.configure 'development', ->
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true
# require('./controllers/initialize.coffee')

app.get "/",(req,res) ->
  res.render "Hello there!"
# require('./routes')()


app.listen process.env.NODE_PORT ? 80
#console.log "Express server listening on port #{app.address().port} in #{app.settings.env} mode"
    
