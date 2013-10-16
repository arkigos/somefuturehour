###
    Main application - should remain generic, with customization deferred to a
    customization script.
    
    Written in Coffeescript by Mike Monson
###
express = require 'express'
path = require 'path'
stylus = require 'stylus'
    
templateDir = path.join __dirname, 'templates'
staticDir = path.join __dirname, 'static'

app = express()

app
    .set('port', process.env.PORT)
    .set('views', templateDir)
    .set('view engine', 'jade')
    
app
    .use(express.logger 'dev')
    .use(express.bodyParser())
    .use(express.methodOverride())
    .use(app.router)
    .use(stylus.middleware staticDir)
    .use(express.static staticDir)
    
app.locals.basedir = '/'

module.exports = app