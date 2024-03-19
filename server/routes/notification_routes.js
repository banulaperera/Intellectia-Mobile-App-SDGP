const express=require('express');
const router=express.Router();
const notificationController=require('../controllers/notification_controller');
const auth=require('../middleware/auth');

router.get('/all',auth,notificationController.getAllNotification);
router.get('/youtube-link',auth,notificationController.getYoutubeNotification);
router.post('/add',auth,notificationController.addNotification);
router.delete('/delete/:notificationID',auth,notificationController.deleteNotification);

module.exports=router;