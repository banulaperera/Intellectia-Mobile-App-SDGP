const  mongoose=require('mongoose');

module.exports=new mongoose.Schema({
      moduleName:{type:String,required:true,default:""},
      createdDate:{type:Date},
      lastModifiedDate:{type:Date},
      title:{type:String,default:""},
      content:{type:String,default:""}
})