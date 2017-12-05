<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
        <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
        <link rel="stylesheet" type="text/css" href="../css/global.css">
        <script src="../js/jquery-1.11.1.min.js"></script>
        <script src="../js/template.js"></script>
        <script src="../layui/layui.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <div class="content">
                    <img src="../images/logo.png" alt="">
                    <ul class="nav">
                        <li><a href="uppdf.jsp" title="">上传</a></li>
                        <li><a href="queryBookList.action?page=1" title="">查看</a></li>
                    </ul>
                </div>
            </div>
            <div class="main clearfix">
                <div class="upload main-container">
                    <h3>请上传数据</h3>
                    <form class="devaldi" method="post" action="UploadPDF" enctype="multipart/form-data">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        <label for="">名称</label>
                                    </td>
                                    <td>
                                        <div class="text">
                                            <input type="text" name="bookName" value="">
                                            <div class="effects"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="">isbn</label>
                                    </td>
                                    <td>
                                        <div class="text">
                                            <input type="text" name="bookISBN" value="" id="bookISBN">
                                            <div class="effects"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="">出版日期</label>
                                    </td>
                                    <td>
                                        <div class="text">
                                            <input type="text" name="publishDate" value="" id="publishDate">
                                            <div class="effects"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="">类型</label>
                                    </td>
                                    <td>
										<select id="cate1" class="sel">
										  <!-- <option>请选择类别</option> -->
										  <option value="A001" data-num="1">中文文献</option>
										  <option value="A002" data-num='2'>外文文献</option>
										</select>
										<select style="margin-left: 10px;" id="cate2" class="sel">
                                            <option value="B001" >轧制设备</option>
                                            <option value="B002" >冶炼设备</option>
                                            <option value="B003" >机械行业动态</option>
                                            <option value="B004" >情报专题</option>
                                            <option value="B005" >计算机技术</option>
                                            <option value="B006">锻压、旋压、整形设备</option>
                                            <option value="B023">材料</option>
                                            <option value="B024">工艺</option>
                                            <option value="B025">铸锻件</option>
                                            <option value="B007">标准</option>
                                            <option value="B008">化工</option>
                                            <option value="B009">核电</option>
                                            <option value="B010">炼油、冷热交换</option>
                                            <option value="B011">矿用</option>
                                            <option value="B012">新产品开发</option>
                                            <option value="B013">风电</option>
                                            <option value="B014">海水淡化</option>
                                            <option value="B015">合同</option>
                                            <option value="B016">电气和自动化</option>
                                            <option value="B017">企业文化宣传</option>
                                            <option value="B018">企业管理</option>
                                            <option value="B019">工艺文件</option>
                                            <option value="B020">检查和试验</option>
                                            <option value="B021">涂装、设备维护和改造</option>
                                            <option value="B022">认证文件</option>
										</select>
										<input type="text" name="bookType" value="A001-B001" id="bookType">
									</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="">目录</label>
                                    </td>
                                    <td>
                                        <div >
                                            <textarea name="bookDesc" style="width:100%;height: 100px;padding: 5px;"></textarea>
                                            <div class="effects"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="">上传书籍并转换</label>
                                    </td>
                                    <td>
                                        <div class="text">
                                            <input type="checkbox" name="isUpload" value="1" style="margin-top:8px;" checked="true">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="">请选择一个文件</label>
                                    </td>
                                    <td>
                                        <div class="text">
                                            <input type="file" name="uploadFile"  style="margin-top:5px;"><span style="color:#000;">(文件名不能包含空格)</span>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="btn-area clearfix">
                            <button type="button" class="btn" id="subBtn">上传</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="footer">
                <div class="midbar"></div>
                <div class="content">
                    <span>信息技术部——数字图书馆系统</span>
                </div>
            </div>
        </div>
        
        <script type="text/html" id="template">
    {{each option as item i}}
        <option value="{{item.value}}" data-num="{{item.num}}">{{item.name}}</option>
    {{/each}}
    </script>
    <script>
        (function(){
            layui.use('laydate',function(){
                var laydate = layui.laydate;
                laydate.render({
                    elem: '#publishDate',
                    type: 'month'
                })
            });
            
            var cateFun = (function(){
                var num = 0;
                var cates = [];
                var cate = function(name,value,fnum){
                    var o = new Object();
                    o.name = name;
                    o.value = value;
                    o.fnum = fnum;
                    o.num = ++num;
                    cates.push(o);
                    return o;
                };
                var getChildren = function(num){
                    var children = [];
                    for (var i = 0; i < cates.length; i++) {
                        if (cates[i].fnum == num) {
                            children.push(cates[i]);
                        }
                    }
                    return children;
                };

                return {
                    cate : cate,
                    getChildren : getChildren
                }
            })()

            var zh = cateFun.cate('中文文献','A001',0);
            var fl = cateFun.cate('外文文献','A002',0);
            var md = cateFun.cate('轧制设备','B001',zh.num);
            var fm = cateFun.cate('冶炼设备','B002',zh.num);
            var jx = cateFun.cate('机械行业动态','B003',zh.num);
            var fm = cateFun.cate('情报专题','B004',zh.num);
	        var jxj = cateFun.cate('计算机技术','B005',zh.num);
            var level1 = cateFun.cate('锻压、旋压、整形设备','B006',zh.num);
            var level2 = cateFun.cate('标准','B007',zh.num);
            var level3 = cateFun.cate('化工','B008',zh.num);
            var level4 = cateFun.cate('核电','B009',zh.num);
            var level5 = cateFun.cate('炼油、冷热交换','B010',zh.num);
            var level6 = cateFun.cate('矿用','B011',zh.num);
            var level7 = cateFun.cate('新产品开发','B012',zh.num);
            var level8 = cateFun.cate('风电','B013',zh.num);
            var level9 = cateFun.cate('海水淡化','B014',zh.num);
            var level10 = cateFun.cate('合同','B015',zh.num);
            var level11 = cateFun.cate('电气和自动化','B016',zh.num);
            var level12 = cateFun.cate('企业文化宣传','B017',zh.num);
            var level13 = cateFun.cate('企业管理','B018',zh.num);
            var level14 = cateFun.cate('工艺文件','B019',zh.num);
            var level15 = cateFun.cate('检查和试验','B020',zh.num);
            var level16 = cateFun.cate('涂装、设备维护和改造','B021',zh.num);
            var level17 = cateFun.cate('认证文件','B022',zh.num);
            var level18 = cateFun.cate('材料','B023',zh.num);
            var level19 = cateFun.cate('工艺','B024',zh.num);
            var level20 = cateFun.cate('铸锻件','B025',zh.num);
	   
            var eg = cateFun.cate('英文文献','B001',fl.num);
            var jp = cateFun.cate('日文文献','B002',fl.num);
            var ru = cateFun.cate('俄文文献','B003',fl.num);
	    
            $('#cate1').on('change',  function(event) {
                var num = $(this).find('option:selected').attr('data-num');
                var children = cateFun.getChildren(num);
                var opts = {
                    option: []
                };
                opts.option = children;
                var content = template('template',opts);
                $('#cate2').html(content);
            });
            $('#cate1,#cate2').on('change', function(event) {
                var cate1 = $('#cate1').val();
                var cate2 = $('#cate2').val();
                var cate = cate1 + '-' + cate2;
                $('#bookType').val(cate);
            });
            var bookISBN = $('#bookISBN');
            $('#subBtn').on('click', function(event) {
                //event.preventDefault();
                var cate1 = $('#cate1').val();
                var cate2 = $('#cate2').val();
                var cate = cate1 + '-' + cate2;
                $('#bookType').val(cate);
                if (!(bookISBN.val())) {
                    var rand = new Date().getTime();
                    bookISBN.val(rand);
                }
                $('form').submit();
            });
        })()
    </script>
        
        
    </body>
</html>