const mongoose=require('mongoose');
const Note=require('./Note')

const userSchema=new mongoose.Schema({
    firstName:{type:String},
    lastName:{type:String},
    email:{type:String,required:true},
    password:{type:String},
    level:{type:Number},
    noTakenQuiz:{type:Number},
    noMissedQuiz:{type:Number},

    notes:[Note]

})

module.exports=mongoose.model("User",userSchema);