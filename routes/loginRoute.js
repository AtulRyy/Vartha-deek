const express = require('express');
const router = express.Router();
const mongoose=require('mongoose')
const User = require('../models/user')

router.get('/', (req, res) => {
    res.render("login.ejs")
})
router.post('/', async (req, res) => {
    try {
        const UserData = await User.findOne({ name: req.body.name })
        if (!UserData) {
            return res.send("User not found");
        }
        if (UserData.password === req.body.password) {
            res.redirect('/home');
        }
        else
            res.send("invalid passsword");
    }
    catch (error){
        res.send("wrong details")
        console.log(error);
    }
})
module.exports = router;