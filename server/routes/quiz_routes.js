const express=require('express');
const router=express.Router();
const auth=require('../middleware/auth');
const quizController=require('../controllers/quiz_controller');

router.post('/generate',auth,quizController.generateQuiz);
router.post('/schedule/add-details',auth,quizController.addScheduledQuizDetails);
router.get('/schedule/getAll-details',auth,quizController.getAllScheduledQuizDetails);
router.delete('/schedule/delete-details/:scheduledQuizDetailsID',auth,quizController.deleteScheduledQuizDetails);
router.put('/schedule/update-details',auth,quizController.updateScheduledQuizDetails);

module.exports=router;

