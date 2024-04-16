const express = require('express')
const router = express.Router();
const path = require('path')
const Article = require('../models/articleData')
const multer = require('multer');
const fs = require('fs');



router.get("/", (req, res) => {
    res.render('create_blog.ejs')

})

const upload = multer();

router.post('/', upload.single('image'), async (req, res) => {

    try {
        if (!req.file)
            return res.send("File not selected");
        const imageBuffer = req.file.buffer;
        const encodedImage = imageBuffer.toString('base64');

        const newArticle = new Article({
            heading: req.body.title,
            content: req.body.articleData,
            hyperlink: req.body.hyperlinks,
            thumbnail: {
                data: req.file.buffer,
                contentType: req.file.mimetype
            }

        });
        await newArticle.save();
        console.log("New article added successfully");
        res.redirect('/create-article');
    } catch (err) {
        res.send("Error saving to database");
    }




})


module.exports = router;