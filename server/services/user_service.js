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


    static async updateFirstLastName(userid,firstName,lastName){
        try {
            const user=await User.findOne({_id:userid});
            user.firstName=firstName;
            user.lastName=lastName;
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
                    firstName:user.firstName,
                    lastName:user.lastName,
                    email:user.email,
                    level:user.level
                }
            }

        }catch (e) {
            throw e
        }
    }

}



function getDefaultName(email){
    return email.split("@")[0];
}


module.exports=UserService;