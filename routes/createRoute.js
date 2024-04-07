const express=require('express')
const router=express.Router();
const path=require('path')
const Article=require('../models/articleData')
const multer=require('multer');

const storage=multer.diskStorage({
    destination:(req,file,cb)=>{
        cb(null,'./images')

    },
    filename:(req,file,cb)=>{
        console.log(file);
        cb(null,Date.now()+path.extname(file.originalname))
    }
})

const upload=multer({storage:storage})

router.get("/",(req,res)=>{
    res.render('create_blog.ejs')
    
})
router.post('/',upload.single('image'),async(req,res)=>{
    const articleData=new Article({
        heading:req.body.title,
        content:req.body.articleData,
        hyperlink:req.body.hyperlinks,
        
    })
    try{
        await articleData.save();
        res.redirect('/create-article');
    }
    catch(err){
        res.send("Error uploading to database")
    }
})


module.exports=router;