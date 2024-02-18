const mongoose=require('mongoose');
const bcrypt=require('bcrypt');
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

userSchema.pre('save',async function(){
    try {
        const salt=await(bcrypt.genSalt(7));
        const hashPassword=await bcrypt.hash(this.password,salt);
        this.password=hashPassword;
    }catch (error){
        console.log(error.message);
    }
})

userSchema.methods.checkPassword=async function(givenPassword){
    try {
        return await bcrypt.compare(givenPassword,this.password);
    }catch (error){
        throw error
    }
}

module.exports=mongoose.model("User",userSchema);