app = require './config'

###
app.get /^\/content\/(.*)/, (req, res) ->
    
    uri = req.params[0].split('/')
### 
    
app.get '/', (req, res) ->
    res.render 'main.jade', 
        title: "It works!"
        hello_world: "Hello, world!"
        you_know: "The more you know..."




# Always at the bottom
module.exports = app.listen process.env.PORT