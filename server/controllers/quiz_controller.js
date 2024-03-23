const quizService=require('../services/quiz_service');

exports.generateQuiz=async (req,res)=>{
    try {
        const {content}=req.body;
        // const quizString=await quizService.generateQuiz(content);
        // const quiz=JSON.parse(quizString);
        temp = {
            "questions": [
                {
                    "question": "What is encapsulation?",
                    "options": [
                        "A way to restrict access to object variables",
                        "A way to allow direct access to object variables",
                        "A way to hide classes in an object",
                        "A way to access data members easily"
                    ],
                    "answer": "A way to restrict access to object variables"
                },
                {
                    "question": "What is the purpose of encapsulation?",
                    "options": [
                        "To make data members public",
                        "To restrict access to certain components of an object",
                        "To allow direct access to all object variables",
                        "To make all methods public"
                    ],
                    "answer": "To restrict access to certain components of an object"
                },
                {
                    "question": "Which of the following is an example of encapsulation in Java?",
                    "options": [
                        "Using public access modifiers for all variables",
                        "Using private access modifiers for variables and providing public getters and setters",
                        "Making all variables static",
                        "Not using any access modifiers for variables"
                    ],
                    "answer": "Using private access modifiers for variables and providing public getters and setters"
                },
                {
                    "question": "What do private access modifiers do in encapsulation?",
                    "options": [
                        "Allow direct access to variables",
                        "Restrict access to variables to within the class",
                        "Make variables inaccessible for the class",
                        "Provide getters and setters"
                    ],
                    "answer": "Restrict access to variables to within the class"
                },
                {
                    "question": "Which of the following best describes encapsulation?",
                    "options": [
                        "Hiding data members and data functions associated with a class",
                        "Giving direct access to all variables in an object",
                        "Allowing public access to potentially sensitive data",
                        "Making all class variables public"
                    ],
                    "answer": "Hiding data members and data functions associated with a class"
                }
            ]
        }
        res.status(200).json(temp);
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
        const  scheduleDetails = await quizService.getScheduledQuizDetails(userID);
        res.status(200).json({scheduleDetails});
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "})
    }
}
