var express = require('express');
var router = express.Router();
var request = require('request');
var config = require('../config/config');

/* GET home page. */
router.get('/', function(req, res, next) {
    var getYear = new Date().getFullYear();
    var year = req.query.year || getYear;
    request(config.server + 'book/queryByTypeAndPublishDate.action?bookType=A001-B003&publishDate=' + year,function(error, response, body){
        try{
            if (!error && response.statusCode == 200) {
                var result = JSON.parse(body);
                //console.log(result);
                if (result.jsonRet == 200) {
                    return res.render('dynamics',{
                        'title' : '机械行业动态',
                        'result' : result.pageBean,
                        'year' :  year,
                        'getYear' : getYear,
                        'deadline' : 2013,
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