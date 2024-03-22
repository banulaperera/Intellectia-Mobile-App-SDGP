const mongoose=require('mongoose');

module.exports=new mongoose.Schema({
    preferredModuleName:{type:String},
    preferredTime:{type:Date},
    preferredFrequency:{type:String},
});