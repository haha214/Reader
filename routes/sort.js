var express = require('express');
var router = express.Router();
var request = require('request');
var config = require('../config/config');
var imgs = require('../imgs/imgConfig.js');


/* GET home page. */
router.get('/', function(req, res, next) {
    var page = req.query.page || 1;
    var type = req.query.type || 0;
    var url = '';

    if (type != 0) {
        url = config.server + 'book/queryByType4PageJson.action?bookType=' + type +'&page=' + page;
    } else{
        url = config.server  + 'book/queryAllBook4Json.action?page=' + page
    }
    request(url,function(error,response,body){
            try{
                console.log(error + ' ' + response.statusCode);
                if (!error && response.statusCode == 200) {
                    var result = JSON.parse(body);
                    //console.log(result);
                    if (result.jsonRet == 200){
                        result = result.pageBean;
                        result.list.forEach(function(el,index,array){
                            if (el.bookISBN in imgs) {
                                array[index].bookImage = imgs[el.bookISBN];
                            } else{
                                array[index].bookImage = config.server + el.bookImage
                            }
                        })
                        return res.render('sort',{
                            'title': '分类',
                            'result' : result,
                            'type' : type ,
                            'imgPath' : config.server
                        })
                    }
                }
                throw '数据获取异常';
            }catch(e){
                next(e);
            }
        })
});

module.exports = router;
