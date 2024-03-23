const mongoose=require('mongoose');
const Note=require('./Note');
const Notification=require('./Notification');
const ScheduledQuizDetails=require('./scheduledQuizDetaills');

const userSchema=new mongoose.Schema({
    photo:{type:String,default:''},
    firstName:{type:String,},
    lastName:{type:String,default:''},
    email:{type:String,required:true},
    password:{type:String},
    correctedQuestions:{type:Number,default:0},
    inCorrectedQuestions:{type:Number,default:0},
    level:{type:Number,default:0},
    totalXP:{type:Number,default:0},
    weeklyXP:{type:[Number],default:[0,0,0,0,0,0,0]},
    notes:[Note],
    notifications:[Notification],
    scheduledQuiz:ScheduledQuizDetails

});

module.exports=mongoose.model("User",userSchema);