<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%String basePath=request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
        <link rel="stylesheet" type="text/css" href="../css/global.css">
        <script src="../js/jquery-1.11.1.min.js"></script>
        
        <script type="text/javascript">
        	function getPage(page){
        		var url=window.location.pathname;
        		if(url.indexOf("queryBookList")>0){
        			window.location.href="queryBookList.action?page="+page;
        			return;
        		}else{
        			//document.forms[0].action = ".action";
        			var current=document.getElementById("currentPage").value;
        			alert
        			if (current==""){
        				current=1
        			}
        			else{
        				document.getElementById("currentPage").value=parseInt(current)+1;
        			}
        			
        			document.forms[0].submit();
        			return;
        		}
        	}
        </script>
        
    </head>
    <body>
        <div class="container">
            <div class="header">
                <div class="content">
                    <img src="../images/logo.png" alt="">
                    <ul class="nav">
                        <li><a href="uppdf.jsp" title="">上传</a></li>
                        <li><a href="queryBookList.action?page=1" title="">查看</a></li>
                        <li>
                            <a href="bm_readhistory.jsp" title="">浏览记录</a>
                        </li>
                        <li>
                            <a href="bm_search.jsp" title="">阅读统计</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main clearfix">
                <div class="list main-container">
                    <h3>书籍管理</h3><s:actionerror/>
                    <form action="findByDesc.action?isJava=0" method="post"  class="query">
                      	  描述： <input type="text" name="bookDesc" value="<s:property value="bookDesc" />">
                       	 	<input type="hidden" name="page" id="currentPage" value="<s:property value="pageBean.currentPage" />">
                       	 	<input type="hidden" name="tJson"  value="0">
                           <button type="submit" class="btnQuery">查询</button>
                    </form>
                    <table style="width:880px" cellspacing="0" cellpadding="0" class="selectable_sortable">
                        <thead>
                            <tr class="sortableRow">
                                <th>选择</th>
                                <td>阅读</td>
                                <td>名称</td>
                                <td>ISBN</td>
                                <td>出版时间</td>
                                <td>类型</td>
                                <td>描述</td>
                                <td>创建人</td>
                                <td>创建时间</td>
                            </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="pageBean.list">
                            <tr class="sortableRow">
                                <th><input type="radio" name="book" value="<s:property value="bookId"/>" id="<s:property value="bookId"/>"></th>
                                <td><a href="queryBookFileInfo.action?bookId=<s:property value="bookId"/>"  title="" target="_blank"><img src="../images/book.png" alt=""></a></td>
                                <td> <s:property value="bookName" /></td>
                                <td><s:property value="bookISBN" /></td>
                                <td><s:property value="publishDate" /></td>
                                <td> <s:property value="bookType" /></td>
                                <td><s:property value="bookDesc" /></td>
                                <td><s:property value="createUserId" /></td>
                                <td> <s:property value="createDate" /></td>
                            </tr>
                          </s:iterator>
                        </tbody>
                    </table>
                    <div class="btn-area clearfix">
                        <button class="btn" id="del">删除</button>
                        <button class="btn" id="alt">修改</button>
                        <span class="file">
                            <button class="btn" id="upload">上传swf文件</button>
                        </span>
                    </div>
                    <div class="page">
                        <button onClick="getPage(1);">首页</button>
                        <button onClick="getPage(<s:property value="%{pageBean.currentPage-1}"/>);">上一页</button>
                        <span><s:property value="pageBean.currentPage" /></span> / <span><s:property value="pageBean.totalPage" /></span>
                        <button onClick="getPage(<s:property value="%{pageBean.currentPage+1}"/>)">下一页</button>
                        <button onClick="getPage(<s:property value="pageBean.totalPage"/>);">末页</button>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="midbar"></div>
                <div class="content">
                    <span>信息技术部——数字图书馆系统</span>
                </div>
            </div>
        </div>
        <script>
            (function(){
                $('.btn').on('click',  function(event) {
                    var choose = $('input[name="book"]:checked');
                    if (choose.length == 0) {
                        alert('请选择一条记录');
                        return;
                    }
                    var bookId = choose.attr('id');
                    var id = $(this).attr('id');
                    switch(id){
                        case 'del' :  //删除
                            window.location.href="<%=basePath%>/admin/deleteBook.action?bookId="+bookId;
                        	//console.log('删除');
                            break;
                        case 'alt' : //修改
                        	window.location.href="<%=basePath%>/admin/loadBook.action?bookId="+bookId;
                        	//console.log('修改');
                            break;
                        case 'upload' : //上传
                        	window.location.href="<%=basePath%>/admin/loadBook4UpSwf.action?bookId="+bookId;
                        	//console.log('上传');
                            break;
                        default:
                            //console.log(id);
                            break;
                    }
                });
            })()
        </script>
    </body>
</html>