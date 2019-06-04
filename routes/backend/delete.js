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

var selectsql1 = "SELECT * FROM tag_content WHERE content_id = ?";
var selectsql2 = "SELECT * FROM tag WHERE id = ?";

var deletesql = "DELETE FROM `content` WHERE `id` = ?";
var tagsqls = "DELETE FROM `tag` WHERE id = ?";

var sql3="UPDATE `tag` SET `frequency` = `frequency` - 1 WHERE `id` = ?";


/* delete novosti */
router.get('/:id',loggedin, function(req, res, next) {
    var id = req.param("id");

    connection.query(selectsql1,id , function(err, rows) {
            var obj = rows;
            obj.forEach(function (tag) {
                var tagid = tag.tag_id;
                connection.query(selectsql2,tagid , function(err, rows8) {
                    console.log(tagid);
                    var da = rows8;
                    var sa = da[0].frequency;
                        if(sa === 1){
                            console.log("freq: " + sa + " deleted!" + tagid);
                            connection.query(tagsqls,tagid , function(err, rows) {

                            });
                        }
                        if(sa > 1) {
                            console.log("freq: " + sa + " --!" + tagid);
                            connection.query(sql3,tagid , function(err, rowss) {

                            });
                        }
                });
            });

        connection.query(deletesql,id , function(err, rows2) {
        if (!err) {
            res.redirect('/admin');
        }
        else {
            console.log('Error while performing Queryd.');
        }
        });
    });
});



module.exports = router;
