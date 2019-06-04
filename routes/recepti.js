var express = require('express');
var router = express.Router();
var moment = require('moment');
var connection = require('../db/db.js');

var categorysql = "SELECT * FROM `category`";
var tagsql = "SELECT name FROM `tag` ORDER BY `tag`.`frequency` DESC LIMIT 8";
var countsql1 = "SELECT * FROM `content` WHERE ct_id = 1";
var countsql = "SELECT * FROM `content` WHERE ct_id = 1 AND category_id = ?";
var popularsql = "SELECT content.id, content.title, content.slug, content.created_on, image.filename FROM `content` LEFT JOIN image ON content.image=image.id WHERE ct_id=1 ORDER BY content.hits DESC LIMIT 3";
var footersql = "SELECT content.id, content.title, content.slug,content.created_on, image.filename FROM content LEFT JOIN image ON image.id=content.image WHERE content.ct_id=1 ORDER BY content.created_on DESC LIMIT 2";
var datasql = "SELECT content.id, content.title, content.description, content.image, content.slug, content.time, content.created_on, user.username, category.name, category.slug AS \"cslug\", image.filename, profile.avatar, profile.name AS 'ime', profile.surname FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image LEFT JOIN profile ON profile.user_id=user.id WHERE content.ct_id=1 ORDER BY content.created_on DESC ";
var datasql2= "SELECT content.id, content.title, content.description, content.image, content.slug, content.time,  content.created_on, user.username, category.name, category.slug AS \"cslug\", image.filename, profile.avatar, profile.name AS 'ime', profile.surname FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image LEFT JOIN profile ON profile.user_id=user.id WHERE content.ct_id=1 AND content.category_id=? ORDER BY content.created_on DESC";

/* GET home page. */
router.get('/', function(req, res, next) {
    connection.query(countsql1, function(err, count) {
        var limit = 6;
        var offset = 0;
        var pages = parseInt((count.length / limit) + 0.9);
        var current = 1;
        var url = "/recepti/page/";

        connection.query(datasql +' LIMIT ' + limit +' OFFSET '+ offset, function(err, rows) {
            if (!err){
                connection.query(categorysql, function(err, cat) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql, function(err, tagrow) {
                            connection.query(footersql, function(err, footer) {
                                res.render('receptilist', {
                                    title: 'Recepti',
                                    data: rows,
                                    cat: cat,
                                    popular:popular,
                                    tag:tagrow,
                                    footer:footer,
                                    moment: moment,
                                    pages:pages,
                                    url:url,
                                    current:current
                                });
                            });
                        });
                    });
                });}
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
        var url = "/recepti/page/";

        connection.query(datasql + ' LIMIT '+ limit +' OFFSET ' + offset, function(err, rows) {
            if (!err){
                connection.query(categorysql, function(err, cat) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql, function(err, tagrow) {
                            connection.query(footersql, function(err, footer) {

                                res.render('receptilist', {
                                    title: 'Recepti',
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
                });}
            else{
                console.log('Error while performing Querydd.');
            }

        });

    });

});



router.get('/dorucak/:p', function(req, res, next) {

    connection.query(countsql,1, function(err, count) {
        var p = req.param("p");
        var limit = 6;
        var offset = limit * (p - 1);
        var pages = parseInt((count.length / limit) + 0.9);
        var current = p;
        var url = "/recepti/dorucak/";

        connection.query(datasql2 + ' LIMIT '+ limit +' OFFSET ' + offset,1, function(err, rows) {
            if (!err){
                connection.query(categorysql, function(err, cat) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql, function(err, tagrow) {
                            connection.query(footersql, function(err, footer) {

                                res.render('receptilist', {
                                    title: 'Doručak',
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
                });}
            else{
                console.log('Error while performing Querydd.');
            }

        });

    });

});


router.get('/rucak/:p', function(req, res, next) {

    connection.query(countsql,2, function(err, count) {
        var p = req.param("p");
        var limit = 6;
        var offset = limit * (p - 1);
        var pages = parseInt((count.length / limit) + 0.9);
        var current = p;
        var url = "/recepti/rucak/";

        connection.query(datasql2 + ' LIMIT '+ limit +' OFFSET ' + offset,2, function(err, rows) {
            if (!err){
                connection.query(categorysql, function(err, cat) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql, function(err, tagrow) {
                            connection.query(footersql, function(err, footer) {

                                res.render('receptilist', {
                                    title: 'Ručak',
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
                });}
            else{
                console.log('Error while performing Querydd.');
            }

        });

    });

});


router.get('/vecera/:p', function(req, res, next) {

    connection.query(countsql,3, function(err, count) {
        var p = req.param("p");
        var limit = 6;
        var offset = limit * (p - 1);
        var pages = parseInt((count.length / limit) + 0.9);
        var current = p;
        var url = "/recepti/vacera/";

        connection.query(datasql2 + ' LIMIT '+ limit +' OFFSET ' + offset,3, function(err, rows) {
            if (!err){
                connection.query(categorysql, function(err, cat) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql, function(err, tagrow) {
                            connection.query(footersql, function(err, footer) {

                                res.render('receptilist', {
                                    title: 'Večera',
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
                });}
            else{
                console.log('Error while performing Querydd.');
            }

        });

    });

});

router.get('/salate/:p', function(req, res, next) {

    connection.query(countsql,4, function(err, count) {
        var p = req.param("p");
        var limit = 6;
        var offset = limit * (p - 1);
        var pages = parseInt((count.length / limit) + 0.9);
        var current = p;
        var url = "/recepti/salate/";

        connection.query(datasql2 + ' LIMIT '+ limit +' OFFSET ' + offset,4, function(err, rows) {
            if (!err){
                connection.query(categorysql, function(err, cat) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql, function(err, tagrow) {
                            connection.query(footersql, function(err, footer) {

                                res.render('receptilist', {
                                    title: 'Salate',
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
                });}
            else{
                console.log('Error while performing Querydd.');
            }

        });

    });

});

router.get('/dezerti/:p', function(req, res, next) {

    connection.query(countsql,5, function(err, count) {
        var p = req.param("p");
        var limit = 6;
        var offset = limit * (p - 1);
        var pages = parseInt((count.length / limit) + 0.9);
        var current = p;
        var url = "/recepti/dezerti/";

        connection.query(datasql2 + ' LIMIT '+ limit +' OFFSET ' + offset,5, function(err, rows) {
            if (!err){
                connection.query(categorysql, function(err, cat) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql, function(err, tagrow) {
                            connection.query(footersql, function(err, footer) {

                                res.render('receptilist', {
                                    title: 'Dezerti',
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
                });}
            else{
                console.log('Error while performing Querydd.');
            }

        });

    });

});

router.get('/decija/:p', function(req, res, next) {

    connection.query(countsql,6, function(err, count) {
        var p = req.param("p");
        var limit = 6;
        var offset = limit * (p - 1);
        var pages = parseInt((count.length / limit) + 0.9);
        var current = p;
        var url = "/recepti/decija/";

        connection.query(datasql2 + ' LIMIT '+ limit +' OFFSET ' + offset,6, function(err, rows) {
            if (!err){
                connection.query(categorysql, function(err, cat) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql, function(err, tagrow) {
                            connection.query(footersql, function(err, footer) {

                                res.render('receptilist', {
                                    title: 'Dečija hrana',
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
                });}
            else{
                console.log('Error while performing Querydd.');
            }

        });

    });

});


router.get('/:slug', function(req, res, next) {
    var sql = "SELECT content.id, content.title, content.description,content.content_text, content.image,content.slug, content.time,  content.created_on, user.username, category.name, category.slug AS \"cslug\", image.filename, profile.avatar, profile.name AS 'ime', profile.surname FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image LEFT JOIN profile ON profile.user_id=user.id WHERE content.slug = ?";
    var slug = req.param("slug");
    connection.query(sql ,slug , function(err, rows) {
        if (!err) {

            var obj = rows;
            var id = obj[0].id;
            var commentsql = "SELECT * FROM comment WHERE content_id = ? AND comment.status = \"approve\" ";
            var tagsql2 = "SELECT tag_content.tag_id, tag_content.content_id, tag.name FROM `tag_content` LEFT JOIN tag ON tag_content.tag_id=tag.id WHERE tag_content.content_id = ? ";
            var galsql = "SELECT gallery.id, gallery.image FROM `gallery` LEFT JOIN content ON gallery.title=content.gallery WHERE content.id = ?";
            var hitsql = "UPDATE content SET hits = hits + 1 WHERE id = ?";

            connection.query(categorysql, function(err, cat) {
                connection.query(commentsql,id, function(err, comm) {
                    connection.query(popularsql, function(err, popular) {
                        connection.query(tagsql2,id, function(err, rows5) {
                            connection.query(tagsql, function(err, tagrow) {
                                connection.query(galsql,id, function(err, gal) {
                                    connection.query(hitsql, id, function(err, hits) {
                                        connection.query(footersql, function(err, footer) {

                                            res.render('receptisingle', {
                                                title: 'Recepti',
                                                data: rows,
                                                cat: cat,
                                                popular:popular,
                                                comm:comm,
                                                data5:rows5,
                                                tag:tagrow,
                                                id:id,
                                                footer:footer,
                                                slug:slug,
                                                gal:gal,
                                                moment: moment
                                            });
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
            res.redirect('/recepti/' + req.body.slug);
        }
        else {
            console.log(err);
        }
    });

});



module.exports = router;