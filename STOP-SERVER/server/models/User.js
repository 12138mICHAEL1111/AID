const mongoose = require('mongoose')

const schema = new mongoose.Schema({
    email: { type: String },
    userid: {
        type: String
    },
    controlitem: {
        type: Boolean
    },
    category: {
        type: String
    },
    sessiontime: {
        session1: { type: String },
        session2: { type: String },
        session3: { type: String },
        session4: { type: String }
    },
    password: {
        type: String,
        set(val) {
            return require('bcrypt').hashSync(val, 10)
    }
}
})

const addSchema = new mongoose.Schema({
    currentuser: {
        type: Boolean,
        default: false
    }
})

schema.add(addSchema)

module.exports = mongoose.model('User',schema)