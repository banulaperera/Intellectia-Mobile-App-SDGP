const express=require('express');
const cors=require('cors')
const bodyParser=require('body-parser');

const db=require('./configs/db_config');
const userRoutes=require('./routes/user_routes')
const auth=require('./middleware/auth');

const app=express();
app.use(cors());
 app.use(express.json())
 app.use(bodyParser.json());

app.use("/user",userRoutes);


app.listen(3000,()=>{console.log("Application started on port 3000")});
