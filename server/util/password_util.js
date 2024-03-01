const bcrypt = require("bcrypt");


 exports.getEncryptPassword =async function(password){
    try {
        const salt=await(bcrypt.genSalt(7));
        return await bcrypt.hash(password, salt);
    }catch (error){
        console.log(error.message);
    }
}

exports.checkPassword=async function(user,givenPassword){
    try {
        return await bcrypt.compare(givenPassword,user.password);
    }catch (error){
        throw error
    }
}