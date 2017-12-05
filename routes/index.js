var express = require('express');
var router = express.Router();
var request = require('request');
var config = require('../config/config');
var imgs = require('../imgs/imgConfig.js');
var Promise = require('bluebird');
Promise.promisifyAll(request);


/* GET home page. */
router.get('/', function(req, res, next) {
    Promise.all([request.getAsync(config.server + 'book/findTopN.action'),request.getAsync(config.server + 'read/findTopN.action')])
    .spread(function(data1,data2){
        var newBook = JSON.parse(data1.body);
        var clickBook = JSON.parse(data2.body);
        if (newBook.jsonRet == 200 && clickBook.jsonRet == 200) {
                newBook.lstBookView.forEach(function(el,index,array){
                    if (el.bookISBN in imgs) {
                        array[index].bookImage = imgs[el.bookISBN];
                    } else{
                        array[index].bookImage = config.server + el.bookImage
                    }
                })
                clickBook.lstBookView.forEach(function(el,index,array){
                    if (el.bookISBN in imgs) {
                        array[index].bookImage = imgs[el.bookISBN];
                    } else{
                        array[index].bookImage = config.server + el.bookImage
                    }
                })
            return res.render('index',{
                'title' : '首页',
                'newBook' : newBook.lstBookView,
                'clickBook' : clickBook.lstBookView,
                'bookPath' : config.server + 'admin/queryBookFileInfo.action?bookId=',
                'imgPath' : config.server,
                'imgs' : imgs
            });
        }
        throw '数据获取异常'
    })
    .catch(function(error){
        console.log(error);
        next(error);
    })
});

module.exports = router;
