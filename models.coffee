mongoose = require 'mongoose'

connect_db = mongoose.connect
    'dharma.mongohq.com'        # host
    'dbname'                    # database
    'port'                      # port
    user: 'user'                # user
    pass: 'pass'                # password

Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

###----------------------------------
    Define and export your models here
###----------------------------------

uriSchema = new Schema
    slug: String
    title: String
    children: [
        type: ObjectId
        ref: 'URI'
    ]
    
URI = mongoose.model 'URI', uriSchema

userSchema = new Schema
    first: String
    last: String
    email: String
    pass: String
    admin: [
        type: ObjectId
        ref: 'URI'
    ]

User = mongoose.model 'User', userSchema

