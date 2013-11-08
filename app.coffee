app = require './config'

###
app.get /^\/content\/(.*)/, (req, res) ->
    
    uri = req.params[0].split('/')
### 

rend = (template, req, res) ->
    res.render template,
        title: "It works!"
        hello_world: "Hello, world!"
        you_know: "The more you know..."

app.get '/index', (req, res) ->
    res.render 'index.jade'
        


# Always at the bottom
module.exports = app.listen process.env.PORT