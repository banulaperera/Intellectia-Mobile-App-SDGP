const NotificationService=require('../services/notification_service');

exports.getAllNotification=async (req,res)=>{
     try {
         const {userID}=req.user;
         const notifications= await NotificationService.getAllNotification(userID);
         res.status(200).json({notifications});
     }catch (error){

         res.status(400).json({ Message: "The request is not completed "})
     }
}

exports.addNotification=async (req,res)=>{
    try {
        const {userID} =req.user;
        const notification=req.body;
        await NotificationService.addNotification(userID,notification);
        res.status(200).json({ Message: "The Notification Successfully Added"});
    }catch (error){
        console.log(error);
        res.status(400).json({ Message: "The request is not completed "});
    }
}

exports.deleteNotification=async (req,res)=>{
    try {
        const {userID}=req.user;
        const {notificationID}=req.params;
        await NotificationService.deleteNotification(userID,notificationID);
        res.status(200).json({ Message: "The Notification Successfully Deleted"})
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "});
    }
}