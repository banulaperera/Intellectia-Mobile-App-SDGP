const quizService=require('../services/quiz_service');

exports.generateQuiz=async (req,res)=>{
    try {
        const {content}=req.body;
        const quizString=await quizService.generateQuiz(content);
        const quiz=JSON.parse(quizString);
        res.status(200).json(quiz);
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "})
    }
}