const  mongoose=require('mongoose');

module.exports=new mongoose.Schema({
      moduleName:{type:String,required:true},
      createdDate:{type:Date},
      lastModifiedDate:{type:Date},
      content:{type:String}
})