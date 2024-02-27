const NoteService=require('../services/note_service');
const e = require("express");

exports.addNote=async (req,res)=>{
    try {
        const {userID}=req.user
        const note=req.body
        await NoteService.addNote(userID,note);
        res.json({status: 200, Message: "The Note Successfully Added"})
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "})
    }
}

exports.getAllNote=async (req,res)=>{
    try {
        const {userID}=req.user
        const notes=await NoteService.getAllNotes(userID);
        res.json({status: 200,notes});
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "})
    }
}

exports.deleteNote=async (req,res)=>{
    try {
         const {noteID}=req.params;
         const {userID}=req.user;
         await NoteService.deleteNote(userID,noteID)
         res.json({status: 200, Message: "The Note Successfully Deleted"})
    }catch (error){
        res.status(400).json({ Message: "The request is not completed "})
    }
}

exports.updateNote=async (req,res)=>{
    try {
        const note=req.body;
        const {userID}=req.user;
        await NoteService.updateNote(userID,note);
        res.json({status: 200, Message: "The Note Successfully updated"})
    }catch (error){
        console.log(error)
        res.status(400).json({ Message: "The request is not completed "})
    }
}