const express=require('express');
const cors=require('cors')
const bodyParser=require('body-parser');
const authController=require('./controllers/auth_controller')


const db=require('./configs/db_config');
const userRoutes=require('./routes/user_routes');
const noteRoutes=require('./routes/note_routes');
const quizRoutes=require('./routes/quiz_routes');
const authRoutes=require('./routes/auth_routes');
require('dotenv').config();


const app=express();
app.use(cors());
app.use(express.json())
app.use(bodyParser.json());


app.use(`/api/v1/user`,userRoutes);
app.use('/api/v1/note',noteRoutes);
app.use('/api/v1/quiz',quizRoutes);
app.use('/api/v1/auth',authRoutes);



app.listen(3000,()=>{console.log("Application started on port 3000")});
