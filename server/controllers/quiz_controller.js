const quizService=require('../services/quiz_service');

exports.generateQuiz=async (req,res)=>{
    try {
        // const {content}=req.body;
        // const quizString=await quizService.generateQuiz(content);
        // const quiz=JSON.parse(quizString);
        const temp = {
            "questions": [
                {
                    "question": "What is encapsulation in object-oriented programming?",
                    "options": [
                        "A way to restrict access to all variables within an object",
                        "A way to allow direct access to all variables within an object",
                        "A way to hide data members and data functions of an object",
                        "A way to expose all data members and data functions of an object"
                    ],
                    "answer": "A way to hide data members and data functions of an object"
                },
                {
                    "question": "What does encapsulation help achieve in software development?",
                    "options": [
                        "Improved security",
                        "Increased complexity",
                        "Easier debugging",
                        "Faster execution"
                    ],
                    "answer": "Improved security"
                },
                {
                    "question": "Which of the following is a benefit of encapsulation?",
                    "options": [
                        "Increased coupling between classes",
                        "Decreased reusability of code",
                        "Enhanced code organization",
                        "Limited data hiding"
                    ],
                    "answer": "Enhanced code organization"
                },
                {
                    "question": "In encapsulation, what is used to restrict access to certain components of an object?",
                    "options": [
                        "Inheritance",
                        "Polymorphism",
                        "Abstraction",
                        "Access modifiers"
                    ],
                    "answer": "Access modifiers"
                },
                {
                    "question": "What is encapsulation commonly associated with in object-oriented programming?",
                    "options": [
                        "Data hiding",
                        "Data duplication",
                        "Data exposure",
                        "Data destruction"
                    ],
                    "answer": "Data hiding"
                }
            ]
        }
        res.status(200).json(temp);
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "})
    }
}