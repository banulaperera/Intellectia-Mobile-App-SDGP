const User=require('../model/User');

class UserService{
      static async userRegistration(email,password){
         try{
             let  firstName=getDefaultName(email);
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
     static async setLevel(userid,level){
          try {
              const user=await User.findOne({_id:userid});
              user.level=level;
              await user.save();
          }catch (e) {
              throw e
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

}



function getDefaultName(email){
    return email.split("@")[0];
}

module.exports=UserService;