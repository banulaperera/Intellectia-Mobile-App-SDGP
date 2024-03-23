const express=require('express');
const cors=require('cors')
const bodyParser=require('body-parser');



const db=require('./configs/db_config');
const userRoutes=require('./routes/user_routes');
const noteRoutes=require('./routes/note_routes');
const quizRoutes=require('./routes/quiz_routes');
const authRoutes=require('./routes/auth_routes');
const notificationRoutes=require('./routes/notification_routes');
require('dotenv').config();



const app=express();
app.use(cors());
app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));
app.use(express.json());

app.use(`${process.env.BASE_API}/user`,userRoutes);
app.use(`${process.env.BASE_API}/note`,noteRoutes);
app.use(`${process.env.BASE_API}/quiz`,quizRoutes);
app.use(`${process.env.BASE_API}/auth`,authRoutes);
app.use(`${process.env.BASE_API}/notification`,notificationRoutes);



app.listen(3000,()=>{console.log("Application started on port 3000")});
