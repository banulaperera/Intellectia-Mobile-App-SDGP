const User=require('../model/User');
const passwordUtil=require('../util/password_util');

class UserService{
      static async userRegistration(email,password){
         try{
             let firstName=getDefaultName(email);
             password=await passwordUtil.getEncryptPassword(password);
             const user=new User({firstName,email,password});
             return await user.save();
         }catch (error){
             throw error
         }
     }

      static async checkUserEmail(email){
         try{
             return await User.findOne({email});
         }catch (error){
             throw error;
         }
     }


    static async updateUserDetails(userid,updatedUser){
        try {
            const user=await User.findOne({_id:userid});
                user.photo=updatedUser.photo;
                user.firstName=updatedUser.firstName;
                user.lastName=updatedUser.lastName;
                user.email=updatedUser.email;
                user.level=updatedUser.level;
                user.correctedQuestions=updatedUser.correctedQuestions;
                user.inCorrectedQuestions=updatedUser.inCorrectedQuestions;
                user.totalXP=updatedUser.totalXP;
                user.weeklyXP=updatedUser.weeklyXP;
                await user.save();
        }catch (e) {
            throw e
        }
    }

    static async getUserDetails(userid){
        try {
            const user=await User.findOne({_id:userid});
            if (user){
                return {
                    photo:user.photo,
                    firstName:user.firstName,
                    lastName:user.lastName,
                    email:user.email,
                    level:user.level,
                    correctedQuestions:user.correctedQuestions,
                    inCorrectedQuestions:user.inCorrectedQuestions,
                    totalXP:user.totalXP,
                    weeklyXP:user.weeklyXP,
                }
            }

        }catch (e) {
            throw e
        }
    }

   static async getUserByID(userID){
          try {
              const user=await User.findOne({_id:userID});
              if (user){
                  return user;
              }
          }catch (err){
              throw err
          }
    }

    static async changeUserPassword(user,newPassword){
        try {
            user.password=await passwordUtil.getEncryptPassword(newPassword);
            await user.save();
        }catch (err){
            throw err
        }
    }

}



function getDefaultName(email){
    return email.split("@")[0];
}

module.exports=UserService;