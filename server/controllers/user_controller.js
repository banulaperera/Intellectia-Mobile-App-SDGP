const UserService=require('../services/user_service');
//const jwt=require('jsonwebtoken');

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
              res.json({status:200,success:"logged successfully"})
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

exports.updateUserName=async (req,res)=>{
     try {
         const {firstName,lastName}=req.body
         await UserService.updateFirstLastName("65cd03337c7feb7185372b76",firstName,lastName);
         res.json({status:200,Message:"User names updated Successfully"})
     }catch (e) {
         throw e;
     }
}
