require('dotenv').config();
const {OpenAI} = require('openai')
const User = require("../model/User");
const openai = new OpenAI({apiKey: process.env.OPENAI_API_KEY});

exports.generateQuiz = async function (content) {
    try{
        const completion = await openai.chat.completions.create({
            messages: [{
                role: "system",
                content: `create 5 questions with 4 options and the correct answer with following content and return as this Json format "questions":[
    {
        "question":String,
        "options":[String],
        "answer":String
    }
]  \n\n${content}`
            }],
            model: "gpt-3.5-turbo",
            response_format: {type: "json_object"},
        })

       return completion.choices[0].message.content;

    }catch (error){
        throw error;
    }

}

exports.addScheduleQuizDetails = async function (userID,scheduledQuizDetails){
    try{
        const user=await User.findOne({_id:userID});
        user.scheduledQuiz=scheduledQuizDetails;
        await user.save();
    }catch (error){
        throw error;
    }
}

exports.getScheduledQuizDetails=async function (userID){
    try {
        const user=await User.findOne({_id:userID});
        return user.scheduledQuiz;
    }catch (error){
        throw Error
    }
}






