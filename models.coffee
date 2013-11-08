mongoose = require 'mongoose'

connect_db = mongoose.connect
    'paulo.mongohq.com'        # host
    'sweetpea'                    # database
    '10083'                      # port
    user: 'arkigos'                # user
    pass: 'The walrus was paul.'                # password

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

