var express = require('express');
var router = express.Router();
var connection = require('../../db/db.js');


var loggedin = function (req, res, next) {
    if (req.isAuthenticated()) {
        next()
    } else {
        res.redirect('/login')
    }
};

/* GET home page. */
router.get('/',loggedin, function (req, res, next) {
    res.render('backend/admin', {
        user: req.user.username,
        title: 'Rene Vegan'
    });
});


module.exports = router;