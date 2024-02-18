const express=require('express');
const router=express.Router();

const NoteController=require('../controllers/note_controller');
const auth=require('../middleware/auth');

router.post('/add',auth,NoteController.addNote);
router.get('/all',auth,NoteController.getAllNote);
router.delete('/delete/:noteID',auth,NoteController.deleteNote);
router.put('/update',auth,NoteController.updateNote);


module.exports=router;