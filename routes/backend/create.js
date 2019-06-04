var express = require('express');
var router = express.Router();
var connection = require('../../db/db.js');
var slug = require('slug');


var loggedin = function (req, res, next) {
    if (req.isAuthenticated()) {
        next()
    } else {
        res.redirect('/login')
    }
};

var authorsql = "SELECT id FROM `user` WHERE username = ?";
var imgsql = "SELECT `id`, `filename` FROM `image` ORDER BY id DESC ";
var galsql = "SELECT DISTINCT `title` FROM `gallery` ";

/* GET home page. */
router.get('/recepti',loggedin, function (req, res, next) {
    var user = req.user;
    connection.query(authorsql,user.username, function(err, author_id) {
        connection.query(imgsql, function(err, img) {
            connection.query(galsql, function(err, gal) {
                res.render('backend/createrecepti', {
                    user: req.user.username,
                    ct_id: 1,
                    author_id: author_id,
                    img:img,
                    gal:gal,
                    title: 'Recepti'
                });
            });
        });
    });
});

router.get('/clanci',loggedin, function (req, res, next) {
    var user = req.user;
    connection.query(authorsql,user.username, function(err, author_id) {
        connection.query(imgsql, function(err, img) {
            connection.query(galsql, function(err, gal) {
                res.render('backend/createrecepti', {
                    user: req.user.username,
                    ct_id: 2,
                    img:img,
                    gal:gal,
                    author_id: author_id,
                    title: 'Članci'
                });
            });
        });
    });
});

router.post('/submitr', function (req, res, next) {
    var today = new Date();
    var sql = "INSERT INTO `content` SET ?";
    var post  = {title: req.body.title, time:req.body.time, description: req.body.description, content_text:req.body.content_text, image:req.body.image, gallery:req.body.gallery, author_id:req.body.author_id, ct_id:req.body.ct_id,category_id:req.body.category_id, hits:0, slug:slug(req.body.title, {lower: true}), created_on:today };
    connection.query(sql,post, function (err, rezultat) {
        if (!err) {
            var tags = req.body.tags.split(",");

            tags.forEach(function (tag) {

                connection.query('UPDATE `tag` SET `frequency` = `frequency` + 1 WHERE `name` = ?; ',tag, function(err, resulttag) {
                    if(resulttag.affectedRows === 0){
                        connection.query('INSERT INTO `tag` SET frequency = 1, name = ?',tag, function(err, result) {

                        });
                    }
                    connection.query('SELECT id FROM `tag` WHERE name = ?',tag, function(err, ids) {
                        var obj = ids;
                        console.log(obj[0].id);

                        connection.query('INSERT INTO `tag_content` SET ?',[{tag_id: obj[0].id,content_id: rezultat.insertId }], function(err, xxx) {
                        });


                    });
                });



            });



            res.redirect('/admin');
        }
        else {
            console.log(err);
        }
    });

});


module.exports = router;