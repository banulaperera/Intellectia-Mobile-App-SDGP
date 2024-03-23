const express=require('express');
const router=express.Router();
const auth=require('../middleware/auth');
const quizController=require('../controllers/quiz_controller');

router.post('/generate',auth,quizController.generateQuiz);
router.post('/schedule/add-details',auth,quizController.addScheduledQuizDetails);
router.get('/schedule/get-details',auth,quizController.getScheduledQuizDetails);

module.exports=router;

