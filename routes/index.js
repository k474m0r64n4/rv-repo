var express = require('express');
var router = express.Router();
var moment = require('moment');
var connection = require('../db/db.js');

var datasql = "SELECT content.id, content.title, content.description, content.slug, content.time, content.created_on, user.username, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image WHERE content.ct_id=2 ORDER BY content.created_on DESC LIMIT 2";
var datasql2= "SELECT content.id, content.title, content.description, content.slug, content.time,  content.created_on, user.username, category.name, category.slug AS \"cslug\", image.filename, profile.avatar, profile.name AS \"ime\", profile.surname FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image LEFT JOIN profile ON profile.user_id=user.id WHERE content.ct_id=1 ORDER BY content.created_on DESC LIMIT 6 "
var footersql = "SELECT content.id, content.title, content.slug,content.created_on, image.filename FROM content LEFT JOIN image ON image.id=content.image WHERE content.ct_id=1 ORDER BY content.created_on DESC LIMIT 2";

router.get('/', function(req, res, next) {
    connection.query(datasql, function(err, rows) {
        if (!err){
            connection.query(datasql2, function(err, rows2) {
                connection.query(footersql, function(err, footer) {
                    res.render('index', {
                        title: 'Rene Vegan',
                        data: rows,
                        data2: rows2,
                        footer:footer,
                        moment: moment });
                });
            });
        }
        else{
            console.log('Error while performing Querydd.');
        }
    });
});


router.get('/login', function (req, res, next) {
  res.render('login');
});


router.get('/signup', function (req, res, next) {
  res.render('signup');
});


router.get('/logout', function (req, res) {
  req.logout();
  res.redirect('/login')
});

module.exports = router;