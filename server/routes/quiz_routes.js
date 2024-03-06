const express=require('express');
const router=express.Router();
const auth=require('../middleware/auth');
const noteController=require('../controllers/quiz_controller');

router.post('/generate',auth,noteController.generateQuiz);
module.exports=router;

