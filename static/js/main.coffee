### ----------------------
    Some jade templates?
### ----------------------

li = """

"""
    
    

### ----------------------
    Backbone
### ----------------------

() ->
    
    ### ------------------
        Models
    ### ------------------
    User = Backbone.Model.extend
        defaults: 
            name: 'Michael Monson'
            age: 31
            banned: false
            
    
    ### ------------------
        Views
    ### ------------------
    UserView = Backbone.View.extend
        tagName: 'li'
        initialize: ->
            this.render()
        render: ->
            this.$el.html
                jade.compile li