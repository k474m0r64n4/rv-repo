var express = require('express');
var router = express.Router();
var fileUpload = require('express-fileupload');
var connection = require('../../db/db.js');

var loggedin = function (req, res, next) {
    if (req.isAuthenticated()) {
        next()
    } else {
        res.redirect('/login')
    }
};

var sql = "SELECT * from image";


router.get('/', loggedin, function (req, res, next) {
    connection.query(sql, function(err, rows) {
        if (!err) {
            res.render('backend/upload', { title: 'View', data: rows, user: req.user.username, tip:'' });
        }
        else {
            console.log('Error while performing Query.');
        }

    });
});

router.get('/gallery', loggedin, function (req, res, next) {
    connection.query(sql, function(err, rows) {
        if (!err) {
            res.render('backend/upload', { title: 'View', data: rows, user: req.user.username, tip:'multiple' });
        }
        else {
            console.log('Error while performing Query.');
        }

    });
});

router.use(fileUpload());

router.post('/upload', function(req, res) {
    if (!req.files)
        return res.status(400).send('No files were uploaded.');

    // The name of the input field (i.e. "sampleFile") is used to retrieve the uploaded file
    var img = req.files.img;
    var title = req.body.title;
    console.log(img.length);
    if(img.length === undefined){
        img.mv("../it320/public/assets/images/upload/" + img.name, function (err) {
            if (err)
                return res.status(500).send(err);

            var sql = "INSERT INTO `image` SET ?";
            var today = new Date();
            var post  = {filename: img.name, created_at: today };

            connection.query(sql,post, function (err, result) {
                if (!err) {
                    console.log(result);
                    res.redirect('/admin');
                }
                else {
                    console.log(err);
                }
            });

        });
    }
    else {

        img.forEach(function(slika) {
            // Use the mv() method to place the file somewhere on your server
            slika.mv("../it320/public/assets/images/upload/" + slika.name, function (err) {
                if (err)
                    return res.status(500).send(err);


                var sql = "INSERT INTO `image` SET ?";
                var today = new Date();
                var post  = {filename: slika.name, created_at: today };
                connection.query(sql,post, function (err, result) {
                    if (!err) {

                        var post2  = {title: title, image: slika.name};
                        connection.query("INSERT INTO `gallery` SET ?",post2, function (err, result) {
                            console.log("proslo");
                        });
                    }
                    else {
                        console.log(err);
                    }
                });
            });
        });
        res.redirect('/admin');
    }
});

module.exports = router;