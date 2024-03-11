const User=require('../model/User');

class NotificationService{

    static async getAllNotification(userID){
        try {
            const user= await User.findOne({_id:userID});
            return user.notifications;
        }catch (error) {
            throw error;
        }

    }

    static async addNotification(userID,notification){
        try {
            const user= await User.findOne({_id:userID});
            user.notifications.push(notification);
            await user.save();
        }catch (error) {
            throw error;
        }

    }

    static async deleteNotification(userID,notificationID){
        try {
            const user= await User.findOne({_id:userID});
            user.notifications.pull({_id:notificationID});
            await user.save();
        }catch (error) {
            throw error;
        }

    }
}

module.exports=NotificationService;