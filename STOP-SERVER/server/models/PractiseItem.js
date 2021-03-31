const mongoose = require('mongoose')

const schema = new mongoose.Schema({
    context:{type: String},
    question1:{
        type:String,
    },
    blank:{
        type:String,
    },
    answer1:{
        type:String,
    },
    question2:{
        type:String
    },
    answer2:{
        type:String
    },
    word:{
        type:String
    }
})

module.exports = mongoose.model('PractiseItem',schema)