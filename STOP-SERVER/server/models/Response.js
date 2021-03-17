const mongoose = require('mongoose')

const schema = new mongoose.Schema({
    userid: {
        type: String
    },
    
    trailNumber:{
        type:String
    }, 
    
    category: {
        type:String
    },
    
    sessionNumber: {
        type:String
    },
    
    readingDuration:{
        type:String
    }, 
    wordRT1: {
        type:String
    },
    
    wordAccuracy1: {
        type:String
    },
    
    clueRequired:{
        type:String
    },
    
    wordRT2:{
        type:String
    },
    
    wordAccuracy2: {
        type:String
    },
    
    questionRT1:{
        type:String
    },
    
    questionAccuracy1: {
        type:String
    },
    
    questionRT2: {
        type:String
    },
    
    questionAccuracy2:{
        type:String
    }
})

module.exports = mongoose.model('Response',schema)