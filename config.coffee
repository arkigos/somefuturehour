###-----------------------------
    Main application - should remain generic, with customization deferred to a
    customization script.
    
    Written in Coffeescript by Mike Monson
###-----------------------------
require 'coffee-script'

###-----------------------------
    IMPORTS
###-----------------------------

# Import express and instantiate as 'app':
express = require 'express'
app = express()

# Import all generic node modules we will be using:
path = require 'path'

# Import third party modules:
stylus = require 'stylus'
_ = require 'underscore'

# Import routes and models:
routes = require './routes'
models = require './models'

###----------------------------
    CONFIGURATION
###----------------------------

# Set the basedir. Used implicitly by routes
app.locals.basedir = '/'

# Set the port, view dir, template engine:
app
    .set('port', process.env.PORT)
    .set('views', __dirname + '/views')
    .set('view engine', 'jade')

# Implement some features: favicon, logger, static, json, etc.
app
    .use(express.favicon())
    .use(express.logger('dev'))
    .use(stylus.middleware(
        src: __dirname + '/public'
    ))        
    .use(express.bodyParser())
    .use(express.methodOverride())
    .use(app.router)
    .use(express.static(path.join __dirname, 'public'))

if 'development' is app.get('env')
    app.use express.errorHandler()
    
module.exports = app
