app = require './config'

###
app.get /^\/content\/(.*)/, (req, res) ->
    
    uri = req.params[0].split('/')
### 

taco = members: ['fun', 'bun', 'sun']

eccles = members: [
  id: 1
  name: "Bob"
  deceased: true
  children: [
    id: 101
    name: "Cindy"
    deceased: false
    children: [
      id: 10101
      name: "Alex"
      deceased: false
      children: []
    ,
      id: 10102
      name: "Asher"
      deceased: true
      children: false
    ,
      id: 10103
      name: "Dan"
      deceased: true
      children: false
    ,
      id: 10104
      name: "Zebulon"
      deceased: true
      children: false
    ,
      id: 10105
      name: "Benjamin"
      deceased: true
      children: false
    ,
      id: 10106
      name: "Ephraim"
      deceased: true
      children: false
    ,
      id: 10107
      name: "Manassah"
      deceased: true
      children: false
    ,
      id: 10108
      name: "Napoleon"
      deceased: true
      children: false
    ]
  ,
    id: 102
    name: "David"
    deceased: false
    children: [
      id: 10201
      name: "David"
      deceased: false
      children: [
        id: 1020101
        name: "David"
        deceased: false
        children: [
          id: 102010101
          name: "David"
          deceased: true
          children: false
        ]
      ,
        id: 1020102
        name: "Angelina"
        deceased: false
        children: [
          id: 102010201
          name: "Bruce"
          deceased: true
          children: false
        ]
      ]
    ]
  ]
,
  id: 2
  name: "Allan"
  deceased: false
  children: false
]
    

rend = (template, req, res) ->
    res.render template,
        title: "It works!"
        hello_world: "Hello, world!"
        you_know: "The more you know..."

app.get '/dan', (req, res) ->
    res.render 'dan.jade',
        eccles: eccles
        
app.get '/json', (req, res) ->
    res.send(eccles)
    
app.get '/sweetpea', (req, res) ->
    rend('shop.jade', req, res)
    
app.get '/cogfuncs', (req, res) ->
    rend('cogfuncs.jade', req, res)

# Always at the bottom
module.exports = app.listen process.env.PORT