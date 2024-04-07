const express = require('express');
const app = express();
const User = require('./models/user')
const Article=require('./models/articleData')
const mongoose=require('mongoose')
const dotenv = require('dotenv')
dotenv.config();


const loginRoute = require('./routes/loginRoute')
const homeRoute=require('./routes/homeRoute')
const createRoute=require('./routes/createRoute')



app.set("view engine", "ejs")
app.use('/static', express.static("public"))
app.use(express.urlencoded({extended:false}))

mongoose.connect(process.env.MONGO_CONNECTION)
.then(()=>{
console.log("mongodb succefully connected");
})
.catch((err)=>{{
    console.log("mongodb error",err);
}})

// const newUser = new User({ name: 'imnikhilmathew', password: 'nik009' })
// newUser.save()
// .then(savedUser=>{
//     console.log("new user added",savedUser);
// })



app.get('/',(req,res)=>{
    res.redirect('/login')
})
app.use('/home',homeRoute)

app.use('/login', loginRoute)

app.use('/create-article',createRoute)

app.get('/api/data',async(req,res)=>{
    try{
        const response=await Article.find();
        res.json(response);
    }catch(err){
        console.error(err);
    }
})




app.listen(3000, console.log("server is now running at port 3000"))