var express = require('express');
var router = express.Router();
var moment = require('moment');
var connection = require('../db/db.js');

var datasql = "SELECT profile.name, profile.surname, profile.avatar, user.username FROM `profile` LEFT JOIN user ON user.id=profile.user_id";
var footersql = "SELECT content.id, content.title, content.slug,content.created_on, image.filename FROM content LEFT JOIN image ON image.id=content.image WHERE content.ct_id=1 ORDER BY content.created_on DESC LIMIT 2";

router.get('/', function(req, res, next) {
    connection.query(datasql, function(err, rows) {
        if (!err){
            connection.query(footersql, function(err, footer) {
                res.render('onama', {
                    title: 'Rene Vegan',
                    data: rows,
                    footer:footer,
                    moment:moment });
            });
        }
        else{
            console.log('Error while performing Querydd.');
        }
    });
});

module.exports = router;
