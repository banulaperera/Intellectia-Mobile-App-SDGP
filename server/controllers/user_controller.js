const UserService=require('../services/user_service');
const jwt=require('jsonwebtoken');
require('dotenv').config();

 exports.registerUser=async (req,res)=>{
      try{
          const {email,password}=req.body;
          const user=await UserService.checkUserEmail(email);

          if (!user){
              await UserService.userRegistration(email,password);
              res.json({status:200,Message:"User Registered Successfully"})
          }else{
              res.json({status:409,Message:"Email Address is already taken"})
          }
      }catch (error){
          throw error;
      }
}

exports.login=async (req,res)=>{
    try{
        const {email,password}=req.body;
        const user=await UserService.checkUserEmail(email);
        if (user){
          const isMatch=await user.checkPassword(password);
          if (isMatch===true){
              const token=jwt.sign({userID:user._id},process.env.ACCESS_TOKEN_KEY);
              res.json({status:200,success:"logged successfully",token})
          }else{
              res.json({status:409,success:"Invalid Password"})
          }

        }else {
          res.json({status:409,success:"Invalid Email"});
        }

    }catch (error){
        throw error;
    }
}

exports.updateUserName=async (req,res)=> {
    try {
        const {userID}=req.user;
        const {firstName, lastName} = req.body
        await UserService.updateFirstLastName(userID, firstName, lastName);
        res.json({status: 200, Message: "User names updated Successfully"})
    } catch (e) {
        throw e;
    }
}
    exports.getUserDetails=async (req,res)=>{
         try {
             const {userID}=req.user;
             const user=await UserService.getUserDetails(userID);
             res.json(user);
        }catch (e) {
            throw e;
        }
}
