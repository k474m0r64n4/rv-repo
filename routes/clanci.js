var express = require('express');
var router = express.Router();
var moment = require('moment');
var connection = require('../db/db.js');

var categorysql = "SELECT * FROM `category`";
var tagsql = "SELECT name FROM `tag` ORDER BY `tag`.`frequency` DESC LIMIT 8";
var countsql1 = "SELECT * FROM `content` WHERE ct_id = 2";
var popularsql = "SELECT content.id, content.title, content.slug, content.created_on, image.filename FROM `content` LEFT JOIN image ON content.image=image.id WHERE ct_id=1 ORDER BY content.hits DESC LIMIT 3";
var footersql = "SELECT content.id, content.title, content.slug,content.created_on, image.filename FROM content LEFT JOIN image ON image.id=content.image WHERE content.ct_id=1 ORDER BY content.created_on DESC LIMIT 2";
var data = "SELECT content.id, content.title, content.description, content.image, content.slug, content.created_on, user.username, category.name, image.filename, profile.avatar, profile.name, profile.surname FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image LEFT JOIN profile ON profile.user_id=user.id WHERE content.ct_id=2 ORDER BY content.created_on DESC";


/* GET home page. */
router.get('/', function(req, res, next) {
    connection.query(countsql1, function(err, count) {
        var limit = 6;
        var offset = 0;
        var pages = parseInt((count.length / limit) + 0.9);
        var current = 1;
        var url = "/clanci/page/";

        connection.query(data + ' LIMIT '+ limit +' OFFSET ' + offset, function(err, rows) {
            if (!err){
                connection.query(categorysql, function(err, cat) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql, function(err, tagrow) {
                            connection.query(footersql, function(err, footer) {
                                res.render('clancilist', {
                                    title: 'Članci',
                                    data: rows,
                                    cat: cat,
                                    popular:popular,
                                    tag:tagrow,
                                    footer:footer,
                                    moment: moment,
                                    pages:pages,
                                    current:current,
                                    url:url });
                            });
                        });
                    });
                });
            }
            else{
                console.log('Error while performing Querydd.');
            }

        });

    });

});



router.get('/page/:p', function(req, res, next) {

    connection.query(countsql1, function(err, count) {
        var p = req.param("p");
        var limit = 6;
        var offset = limit * (p - 1);
        var pages = parseInt((count.length / limit) + 0.9);
        var current = p;
        var url = "/clanci/page/";

        connection.query(data + ' LIMIT '+ limit +' OFFSET ' + offset, function(err, rows) {
            if (!err){
                connection.query(categorysql, function(err, cat) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql, function(err, tagrow) {
                            connection.query(footersql, function(err, footer) {
                                res.render('clancilist', {
                                    title: 'Članci',
                                    data: rows,
                                    cat: cat,
                                    popular:popular,
                                    tag:tagrow,
                                    footer:footer,
                                    moment: moment,
                                    pages:pages,
                                    current:current,
                                    url:url });
                            });
                        });
                    });
                });
            }
            else{
                console.log('Error while performing Querydd.');
            }

        });

    });

});

router.get('/:slug', function(req, res, next) {
    var sql = "SELECT content.id, content.title, content.content_text, content.image, content.slug, content.created_on, user.username, image.filename, profile.avatar, profile.name, profile.surname FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN image ON image.id=content.image LEFT JOIN profile ON profile.user_id=user.id  WHERE content.slug=? ";
    var slug = req.param("slug");
    connection.query(sql ,slug , function(err, rows) {
        if (!err) {

            var obj = rows;
            var id = obj[0].id;
            var commentsql = "SELECT * FROM comment WHERE content_id = ? AND comment.status = \"approve\" ";
            var hitsql = "UPDATE content SET hits = hits + 1 WHERE id = ?";
            var galsql = "SELECT gallery.id, gallery.image FROM `gallery` LEFT JOIN content ON gallery.title=content.gallery WHERE content.id = ?";
            var tagsql2 = "SELECT tag_content.tag_id, tag_content.content_id, tag.name FROM `tag_content` LEFT JOIN tag ON tag_content.tag_id=tag.id WHERE tag_content.content_id = ? ";


            connection.query(commentsql,id, function(err, comm) {
                connection.query(tagsql2,id, function(err, tagovi) {
                    connection.query(hitsql, id, function(err, hits) {
                        connection.query(categorysql, function(err, cat) {
                            connection.query(popularsql, function(err, popular) {
                                connection.query(tagsql, function(err, tagrow) {
                                    connection.query(galsql,id, function(err, gal) {
                                        connection.query(footersql, function(err, footer) {
                                            res.render('clancisingle', {
                                                title: 'Članci',
                                                data: rows,
                                                cat: cat,
                                                popular: popular,
                                                tag:tagrow,
                                                id:id,
                                                slug:slug,
                                                comm:comm,
                                                tagovi:tagovi,
                                                gal:gal,
                                                footer:footer,
                                                moment: moment });
                                         });
                                     });
                                });
                            });
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

/* POST submit komentara */
router.post('/submit', function (req, res, next) {
    var today = new Date();
    var sql = "INSERT INTO `comment` SET ?";
    var post  = {author_name: req.body.author_name, comment_content: req.body.comment_content, content_id:req.body.content_id, email:req.body.email, created_on:today };
    connection.query(sql,post, function (err, result) {
        if (!err) {
            res.redirect('/clanci/' + req.body.slug);
        }
        else {
            console.log(err);
        }
    });

});





module.exports = router;