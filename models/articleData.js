const mongoose=require('mongoose')


const articleSchema=mongoose.Schema({
    heading:{
        type:String,
        required:true,

    },
    content:{
        type:String,
        required:true,
    },
    hyperlink:{
        type:String
    },
    image:{
        data:Buffer,
        contentType:String

    }
})

module.exports=mongoose.model("Article",articleSchema)