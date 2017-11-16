var express = require('express');
var router = express.Router();
var request = require('request');
var config = require('../config/config');

/* GET home page. */
router.get('/', function(req, res, next) {
    var type = req.query.type || 0;
    res.render('myBooks',{
        title: '我的书架',
        type : type,
        serverPath : config.server
    })
});

module.exports = router;