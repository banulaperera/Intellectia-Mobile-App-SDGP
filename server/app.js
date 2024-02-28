const express=require('express');
const cors=require('cors')
const bodyParser=require('body-parser');
const authController=require('./controllers/auth_controller')


const db=require('./configs/db_config');
const userRoutes=require('./routes/user_routes')
const noteRoutes=require('./routes/note_routes')
require('dotenv').config();

const app=express();
app.use(cors());
app.use(express.json())
app.use(bodyParser.json());


app.use(`/user`,userRoutes);
app.use('/note',noteRoutes)
app.use('/newToken',authController.newToken);



app.listen(3000,()=>{console.log("Application started on port 3000")});
