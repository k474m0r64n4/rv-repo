var express = require('express');
var router = express.Router();
var connection = require('../../db/db.js');


var loggedin = function (req, res, next) {
    if (req.isAuthenticated()) {
        next()
    } else {
        res.redirect('/login')
    }
}

/* GET home page. */
router.get('/',loggedin, function (req, res, next) {
    var sql = "SELECT profile.user_id, profile.name, profile.surname, profile.public_email, profile.sex, profile.bio, user.username FROM profile LEFT JOIN user ON profile.user_id=user.id ";
    var user = req.user;
    connection.query(sql, function(err, rows) {
        if (!err) {
            res.render('backend/authorlist', {
                title: 'Authors',
                data: rows,
                user: req.user
            });

        }
        else {
            console.log('Error while performing Query.');
        }

    });
});

router.get('/:id',loggedin, function(req, res, next) {
    var sql = "SELECT * from profile WHERE user_id = ?";
    var id = req.param("id");
    var user = req.user;
    connection.query(sql ,id , function(err, rows) {
        if (!err) {
            res.render('backend/author', {
                title: 'Author',
                data: rows,
                id:id,
                user: req.user
            });

        }
        else {
            console.log('Error while performing Query.');
        }
    });
});


/* POST update page. */
router.post('/submit', function (req, res, next) {
    var sql = "UPDATE `profile` SET ? WHERE user_id = ?";
    var id = req.body.user_id;
    var post  = {name: req.body.name, surname: req.body.surname, public_email:req.body.public_email, bio:req.body.bio };
    connection.query(sql,[post,id], function (err, result) {
        if (!err) {
            res.redirect('backend/authors');
        }
        else {
            console.log(err);
        }
    });

});


module.exports = router;