const quizService=require('../services/quiz_service');

exports.generateQuiz=async (req,res)=>{
    try {
        // const {content}=req.body;
        // const quizString=await quizService.generateQuiz(content);
        // const quiz=JSON.parse(quizString);
        const temp = {
            "questions": [
                {
                    "question": "What type of programming language is Python?",
                    "options": [
                        "Compiled",
                        "Interpreted",
                        "Machine",
                        "Low-level"
                    ],
                    "answer": "Interpreted"
                },
                {
                    "question": "What does Python emphasize in its syntax?",
                    "options": [
                        "Efficiency",
                        "Readability",
                        "Conciseness",
                        "Speed"
                    ],
                    "answer": "Readability"
                },
                {
                    "question": "Which feature of Python makes it attractive for Rapid Application Development?",
                    "options": [
                        "Static typing",
                        "Dynamic semantics",
                        "Complex syntax",
                        "Verbose code"
                    ],
                    "answer": "Dynamic semantics"
                },
                {
                    "question": "What does Python support to encourage program modularity and code reuse?",
                    "options": [
                        "Classes only",
                        "Functions only",
                        "Modules and packages",
                        "Global variables"
                    ],
                    "answer": "Modules and packages"
                },
                {
                    "question": "How can the Python interpreter and standard library be obtained?",
                    "options": [
                        "Only in binary form",
                        "Without charge for major platforms",
                        "Chargeable for all platforms",
                        "Without source code"
                    ],
                    "answer": "Without charge for all major platforms"
                }
            ]
        }
        res.status(200).json(temp);
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "})
    }
}