const express=require('express');
const router=express.Router();


const UserController=require('../controllers/user_controller')
const auth = require("../middleware/auth");



router.post('/register',UserController.registerUser);
router.post('/login',UserController.login);

router.post('/update-name',auth,UserController.updateUserName);
router.get('/details',auth,UserController.getUserDetails);


module.exports=router;