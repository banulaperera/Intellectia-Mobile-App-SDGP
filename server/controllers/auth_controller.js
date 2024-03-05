const jwt = require("jsonwebtoken");

exports.newToken=async (req,res)=> {
    try {
        const refreshToken=req.body.refreshToken;
        if (refreshToken==null){
            res.sendStatus(401);
        }else {
            jwt.verify(refreshToken,process.env.REFRESH_TOKEN_KEY,(error,user)=>{
                if (error){
                    res.sendStatus(401);
                }else {
                    const accessToken=jwt.sign({userID:user.userID},process.env.ACCESS_TOKEN_KEY,{expiresIn: "5m"});
                    res.send({accessToken});
                }
            })
        }

    } catch (e) {
        res.status(400).json({ Message: "The request is not completed "})
    }
}