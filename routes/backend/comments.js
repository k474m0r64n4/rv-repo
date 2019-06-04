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
    var sql = "SELECT * FROM comment";
    connection.query(sql, function(err, rows) {
        if (!err) {
            res.render('backend/commentlist', {
                title: 'Comments',
                data: rows,
                user: req.user.username
            });

        }
        else {
            console.log('Error while performing Query.');
        }

    });
});

/* POST update page. */
router.post('/approve', function (req, res, next) {
    var sql = "UPDATE `comment` SET `status` = ? WHERE `comment`.`id` = ? ";
    var id = req.body.id;
    var status = req.body.status;

    connection.query(sql,[status, id], function (err, result) {
        if (!err) {
            res.redirect('/comments');
        }
        else {
            console.log(err);
        }
    });

});

module.exports = router;