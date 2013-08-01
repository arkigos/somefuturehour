app.param 'user', (req, res, next, email, pass) ->
    User.find
        email: email
        pass: pass
        , (err, user) ->
            if not err and not user
                err = new Error 'Wrong email or passphrase...'
            else
                req.user = user
            next err
                
app.param 'page', (req, res, next, slug) ->
    if not slug
        Post.find {}, (err, posts) ->
            req.post = posts
            return next err
    else
        Post.find
            slug: slug, (err, post) ->
                if not err and not post and req.user
                    newPost = new Post
                        slug: slug
                    newPost.save()
                    post = newPost
                req.post = post
                return next err
    

app.get '/:page', (req, res) ->
    res.render 'index', 
        articles: req.post
        title: 'The ramblings and musings of Gretchen May Monson...'
        
