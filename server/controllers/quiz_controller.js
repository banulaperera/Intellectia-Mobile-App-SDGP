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

exports.addScheduledQuizDetails=async (req,res)=>{
    try {
        const {userID}=req.user;
        const scheduledQuizDetails=req.body;
        await quizService.addScheduleQuizDetails(userID,scheduledQuizDetails);
        res.status(200).json({ Message: "The Quiz Successfully Scheduled"})
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "})
    }
}

exports.getScheduledQuizDetails=async (req,res)=>{
    try {
        const {userID}=req.user;
        const  scheduleDetails = await quizService.getAllScheduledQuizDetails(userID);
        res.status(200).json({scheduleDetails});
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "})
    }
}
