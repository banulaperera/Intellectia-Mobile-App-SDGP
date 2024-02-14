const express=require('express');
const router=express.Router();


const UserController=require('../controllers/user_controller')



router.post('/register',UserController.registerUser);
router.post('/login',UserController.login);
router.post('/update-name',UserController.updateUserName);

module.exports=router;