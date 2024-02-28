const UserService=require('../services/user_service');
const passwordUtil=require('../util/password_util');
const jwt=require('jsonwebtoken');
require('dotenv').config();

 exports.registerUser=async (req,res)=>{
      try{
          const {email,password}=req.body;
          const user=await UserService.checkUserEmail(email);

          if (!user){
              await UserService.userRegistration(email,password);
              res.json({status:200,Message:"User Registered Successfully"});
          }else{
              res.json({status:409,Message:"Email Address is already taken"})
          }
      }catch (error){

          res.status(400).json({ Message: "The request is not completed "})
      }
}

exports.login=async (req,res)=>{
    try{
        const {email,password}=req.body;
        const user=await UserService.checkUserEmail(email);
        if (user){
          const isMatch=await passwordUtil.checkPassword(user,password);
          if (isMatch===true){
              const accessToken=jwt.sign({userID:user._id},process.env.ACCESS_TOKEN_KEY,/*{expiresIn: "5m"}*/);
              const refreshToken=jwt.sign({userID:user._id},process.env.REFRESH_TOKEN_KEY,{expiresIn: "7d"});
              res.json({status:200,Message:"logged successfully",accessToken,refreshToken});
          }else{
              res.json({status:409,Message:"Invalid Password"})
          }

        }else {
          res.json({status:409,Message:"Invalid Email"});
        }

    }catch (error){
        console.log(error)
        res.status(400).json({ Message: "The request is not completed "})
    }
}


exports.updateUserName=async (req,res)=> {
    try {
        const {userID}=req.user;
        const {firstName, lastName} = req.body
        await UserService.updateFirstLastName(userID, firstName, lastName);
        res.json({status: 200, Message: "User names updated Successfully"})
    } catch (e) {

    }
}
    exports.getUserDetails=async (req,res)=>{
         try {
             const {userID}=req.user;
             const user=await UserService.getUserDetails(userID);
             res.json(user);
        }catch (e) {

        }
}
