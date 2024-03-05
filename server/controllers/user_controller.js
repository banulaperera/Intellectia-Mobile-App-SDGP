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
              res.status(200).json({Message:"User Registered Successfully"});
          }else{
              res.status(409).json({Message:"Email Address is already taken"})
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
              const accessToken=jwt.sign({userID:user._id},process.env.ACCESS_TOKEN_KEY,{expiresIn: "5m"});
              const refreshToken=jwt.sign({userID:user._id},process.env.REFRESH_TOKEN_KEY,{expiresIn: "30d"});
              res.status(200).json({Message:"logged successfully",accessToken,refreshToken});
          }else{
              res.status(409).json({Message:"Invalid Password"})
          }

        }else {
            res.status(409).json({Message:"Invalid Email"});
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
        res.status(200).json({Message: "User names updated Successfully"})
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
