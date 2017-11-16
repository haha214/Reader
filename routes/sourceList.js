var express = require('express');
var router = express.Router();
var request = require('request');
var config = require('../config/config');

/* GET home page. */
router.get('/', function(req, res, next) {
    var page = req.query.page || 1;
    var bookISBN = req.query.bookISBN;
    request(config.server + 'book/findByISBN4Page.action?bookISBN=' + bookISBN +'&page=' + page,function(error, response, body){
        try{
            if (!error && response.statusCode == 200) {
                var result = JSON.parse(body);
                //console.log(result);
                if (result.jsonRet == 200) {
                    return res.render('sourceList',{
                        'title' : '期刊列表',
                        'result' : result.pageBean,
                        'bookISBN' : bookISBN,
                        'serverPath' : config.server
                    })
                }
            }
            throw '数据获取异常';
        } catch(e){
            next(e);
        }
    })
});

module.exports = router;