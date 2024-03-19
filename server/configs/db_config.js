const mongoose = require("mongoose");
const dbConnection= mongoose.connect("mongodb+srv://AviDB:AviDB123@ap-db.0zdi85t.mongodb.net/?retryWrites=true&w=majority")
        .then(()=>console.log("mongoDB connected"))
        .catch((e)=>console.log(e));

module.exports=dbConnection;