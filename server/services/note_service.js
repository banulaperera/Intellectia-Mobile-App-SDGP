const User=require('../model/User');

class NoteService{
    static async addNote(userID,note){
        try{
            const user=await User.findOne({_id:userID});
            user.notes.push(note);
            await user.save();
        }catch (error){
            throw error;
        }
    }

    static async getAllNotes(userID){
        try {
            const user=await User.findOne({_id:userID});
            return user.notes;


        }catch (error){
            throw Error
        }
    }

    static async deleteNote(userID,noteID){
        try{
            const user=await User.findOne({_id:userID});
            user.notes.pull({_id:noteID})
            await user.save();
        }catch (error){
            throw error
        }
    }

    static async updateNote(userID,note){
        try{
            await User.findOneAndUpdate(
                {'notes._id':note._id,_id:userID},
                {$set:{'notes.$':note}}
            )
        }catch (error) {
            throw error;
        }
    }
}

module.exports=NoteService;

//let note=user.notes.filter(ob =>{return ob._id=="65d23db690655e590e053c08"});
//console.log(note);