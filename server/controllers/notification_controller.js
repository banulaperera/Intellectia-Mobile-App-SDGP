const NotificationService=require('../services/notification_service');
const NoteService=require('../services/note_service');
const {google} =require('googleapis');
const {content} = require("googleapis/build/src/apis/content");



exports.getAllNotification=async (req,res)=>{
     try {
         const {userID}=req.user;
         const notifications= await NotificationService.getAllNotification(userID);
         res.status(200).json({notifications});
     }catch (error){

         res.status(400).json({ Message: "The request is not completed "})
     }
}

exports.addNotification=async (req,res)=>{
    try {
        const {userID} =req.user;
        const notification=req.body;
        await NotificationService.addNotification(userID,notification);
        res.status(200).json({ Message: "The Notification Successfully Added"});
    }catch (error){
        console.log(error);
        res.status(400).json({ Message: "The request is not completed "});
    }
}

exports.deleteNotification=async (req,res)=>{
    try {
        const {userID}=req.user;
        const {notificationID}=req.params;
        await NotificationService.deleteNotification(userID,notificationID);
        res.status(200).json({ Message: "The Notification Successfully Deleted"})
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "});
    }
}

exports.getYoutubeNotification=async (req,res)=>{
    try {
        const {userID}=req.user;
        const moduleNames= await getUserNoteModuleNames(userID);

        if (moduleNames.length!==0){
            let index=Math.floor((Math.random()*(moduleNames.length)));
            const content=await getRandomNoteContent(userID,moduleNames[index]);
            const link= await getYoutubeVideoLink(moduleNames[index]+" "+content);
            res.status(200).json({"link":link,"module":moduleNames[index]});

        }
    }catch (e) {
        console.log(e)
        res.status(400).json({ Message: "The request is not completed "});
    }
}

async  function getUserNoteModuleNames(userID){
 let notes=await NoteService.getAllNotes(userID);
 let moduleNames=notes.map(note=>note.moduleName);
 return Array.from(new Set(moduleNames));
}


async function getRandomNoteContent(userID,moduleName){
    let notes=await NoteService.getAllNotes(userID);
    const noteArray=notes.filter(note=>note.moduleName===moduleName);
    let index=Math.floor((Math.random()*(noteArray.length)));
    return noteArray[index].title+" "+noteArray[index].content;
}

  async function getYoutubeVideoLink(query){

    const youtube= google.youtube({version:'v3',auth:process.env.YOUTUBE_API_KEY});
    const params={part:'snippet',type:'video',maxResults:10,q:`Educational video for ${query} Module`};

    try {
        const res=await youtube.search.list(params);
        const index = Math.floor((Math.random() * 5));
        const videoID=res.data.items[index]?.id.videoId;
        if (videoID){
            return `https://www.youtube.com/watch?v=${videoID}`;
        }else {
            return  null;
        }

    }catch (error){
        throw error;
    }

}