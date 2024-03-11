const mongoose=require('mongoose');

module.exports=new mongoose.Schema({
    title:{type:String},
    body:{type:String},
    type:{type:String},
    date:{type:Date}
});