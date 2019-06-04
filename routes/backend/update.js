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

var sql = "SELECT * from content WHERE ct_id = ?";
var authorsql = "SELECT id FROM `user` WHERE username = ?";
var imgsql = "SELECT `id`, `filename` FROM `image` ORDER BY id DESC ";
var galsql = "SELECT DISTINCT `title` FROM `gallery` ";

router.get('/recepti', loggedin, function (req, res, next) {
    connection.query(sql,1, function(err, rows) {
        if (!err) {
            res.render('backend/updatelist', {
                title: 'Recepti',
                data: rows,
                user: req.user.username
            });
        }
        else {
            console.log('Error while performing Query.');
        }

    });
});

router.get('/clanci', loggedin, function (req, res, next) {
    connection.query(sql,2, function(err, rows) {
        if (!err) {
            res.render('backend/updatelist', {
                title: 'Članci',
                data: rows,
                ct_id: 2,
                user: req.user.username
            });
        }
        else {
            console.log('Error while performing Query.');
        }

    });
});

router.get('/:id',loggedin, function(req, res, next) {
    var sql = "SELECT content.id, content.title, content.description, content.content_text,content.image, content.category_id,content.gallery,content.author_id,content.ct_id,content.slug,content.time,category.name,image.filename from content LEFT JOIN image ON image.id=content.image LEFT JOIN category ON category.id=content.category_id WHERE content.id = ?";
    var id = req.param("id");
    var user = req.user;
    connection.query(sql ,id , function(err, rows) {
        if (!err) {
            connection.query(authorsql,user.username, function(err, author_id) {
                connection.query(imgsql, function(err, img) {
                    connection.query(galsql, function(err, gal) {
                        res.render('backend/update', {
                            title: 'Članci',
                            data: rows,
                            id:id,
                            ct_id: 2,
                            img:img,
                            gal:gal,
                            author_id: author_id,
                            user: req.user.username
                        });
                    });
                });
            });
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});


/* POST update page. */
router.post('/submit', function (req, res, next) {
    var sql = "UPDATE `content` SET ? WHERE id = ?";
    var id = req.body.id;
    var post  = {title: req.body.title,time:req.body.time, description: req.body.description, content_text:req.body.content_text, image:req.body.image, gallery:req.body.gallery, author_id:req.body.author_id, ct_id:req.body.ct_id,category_id:req.body.category_id, slug:req.body.slug };
    connection.query(sql,[post,id], function (err, result) {
        if (!err) {
            res.redirect('/update/' + req.body.id );
        }
        else {
            console.log(err);
        }
    });

});



module.exports = router;