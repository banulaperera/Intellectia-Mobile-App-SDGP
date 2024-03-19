const jwt=require('jsonwebtoken');
require('dotenv').config();


module.exports=function (req,res,next) {
    if (req.headers.authorization&&req.headers.authorization.startsWith('bearer')){
        const token=req.headers.authorization.split(' ')[1];

        if (token==null){
            res.sendStatus(401);
        }else {
            jwt.verify(token,process.env.ACCESS_TOKEN_KEY,(error,user)=>{
                if (error){res.sendStatus(403);}else {req.user=user;next();}

            });
        }
    }else {
        res.sendStatus(401);
    }


}