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


