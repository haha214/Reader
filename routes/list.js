var express = require('express');
var router = express.Router();
var request = require('request');
var config = require('../config/config');
var imgs = require('../imgs/imgConfig.js');

/* GET home page. */
router.get('/', function(req, res, next) {
    request.post({
        url: config.server + 'book/findByDesc.action',
        formData: {
            bookDesc: req.query.desc || '',
            page: req.query.page || 1
        }
    },function optionalCallback(err, httpResponse, body){
        try{
            if (!err && httpResponse.statusCode == 200) {
                var result = JSON.parse(body);
                if (result.jsonRet == 200) {
                        result = result.pageBean;
                        result.list.forEach(function(el,index,array){
                            if (el.bookISBN in imgs) {
                                array[index].bookImage = imgs[el.bookISBN];
                            } else{
                                array[index].bookImage = config.server + el.bookImage
                            }
                        })
                    return res.render('list',{
                        'title' : '详情列表',
                        'result' : result,
                        'desc' : req.query.desc || '',
                        'bookPath' : config.server + 'admin/queryBookFileInfo.action?bookId=',
                        'serverPath' : config.server
                    })
                }
            }
            throw '数据获取异常';
        }catch(e){
            next(e);
        }
        
    });
    // var page = req.query.page || 1;
    // var desc = req.query.desc || '';

    // request(config.server + 'book/findByDesc.action?bookDesc=' + desc +'&page=' + page,function(error, response, body){
    //     try{
    //         // console.log(response);
    //         if (!error && response.statusCode == 200) {
    //             var result = JSON.parse(body);
    //             //console.log(result);
    //             if (result.jsonRet == 200) {
    //                 return res.render('list',{
    //                     'title' : '详情列表',
    //                     'result' : result.pageBean,
    //                     'desc' : desc
    //                 })
    //             }
    //         }
    //         throw '数据获取异常';
    //     } catch(e){
    //         next(e);
    //     }
    // })
});

module.exports = router;