var express = require('express');
var router = express.Router();
var moment = require('moment');
var connection = require('../db/db.js');

var sql = "SELECT tag_content.tag_id, tag_content.content_id, tag.name AS \"tagname\", content.id, content.title,content.id, content.title, content.description, content.image, content.slug, content.time, content.created_on,category.name, category.slug AS \"cslug\", image.filename, user.username, profile.avatar, profile.name AS 'ime', profile.surname FROM `tag_content` LEFT JOIN tag ON tag.id=tag_content.tag_id LEFT JOIN content ON tag_content.content_id=content.id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image LEFT JOIN user ON user.id=content.author_id LEFT JOIN profile ON profile.user_id=user.id WHERE tag.name = ?";
var categorysql = "SELECT * FROM `category`";
var tagsql = "SELECT name FROM `tag` ORDER BY `tag`.`frequency` DESC LIMIT 8";
var popularsql = "SELECT content.id, content.title, content.slug, content.created_on, image.filename FROM `content` LEFT JOIN image ON content.image=image.id WHERE ct_id=1 ORDER BY content.hits DESC LIMIT 3";
var footersql = "SELECT content.id, content.title, content.slug,content.created_on, image.filename FROM content LEFT JOIN image ON image.id=content.image WHERE content.ct_id=1 ORDER BY content.created_on DESC LIMIT 2";


router.get('/:id', function(req, res, next) {
    var id = req.param("id");
    connection.query(sql ,id , function(err, rows) {
        if (!err) {
            connection.query(categorysql, function(err, cat) {
                connection.query(popularsql, function(err, popular) {
                    connection.query(tagsql, function(err, tagrow) {
                        connection.query(footersql, function(err, footer) {
                            res.render('tags', {
                                title: 'Rene Vegan',
                                data: rows,
                                cat: cat,
                                popular:popular,
                                tag:tagrow,
                                id:id,
                                footer:footer,
                                moment: moment
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


module.exports = router;