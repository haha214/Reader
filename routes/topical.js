var express = require('express');
var router = express.Router();
var request = require('request');
var config = require('../config/config');

/* GET home page. */
router.get('/', function(req, res, next) {
    request(config.server + 'book/findByISBN4Page.action?bookISBN=0412',function(error, response, body){
        try{
            if (!error && response.statusCode == 200) {
                var result = JSON.parse(body);
                //console.log(result);
                if (result.jsonRet == 200) {
                    return res.render('topical',{
                        'title' : '情报专题',
                        'result' : result.pageBean,
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