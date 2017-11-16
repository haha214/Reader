<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%String basePath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" >
<title>显示全部图书</title>
</head>
<body>
    
    <table border="1">
    <tr>
    	<th>阅读</th>
    	<th>id</th>
    	<th>名称</th>
    	<th>ISBN</th>
    	<th>出版时间</th>
    	<th>类型</th>
    	<th>描述</th>
    	<th>创建人</th>
    	<th>创建时间</th>
    	<th>收藏</th>
    	<th>删除</th>
    	<th>修改</th>
    	<th>上传swf文件</th>
    </tr>
    <s:iterator value="pageBean.list">
         <tr>
             <td>
                 <a href="queryBookFileInfo.action?bookId=<s:property value="bookId"/>" target="_blank">阅读</a>
             </td>
             <td class="tocenter">
                 <s:property value="bookId" />
             </td>
             <td>
                 <s:property value="bookName" />
             </td>
             <td class="tocenter">
                 <s:property value="bookISBN" />
             </td>
             <td class="tocenter">
                 <s:property value="publishDate" />
             </td>
             <td class="tocenter">
                 <s:property value="bookType" />
             </td>
             <td class="tocenter">
                 <s:property value="bookDesc" />
             </td>
             <td class="tocenter">
                 <s:property value="createUserId" />
             </td>
             <td class="tocenter">
                 <s:property value="createDate" />
             </td>
              <td class="tocenter">
                 <a href="<%=basePath%>/my/addMyFavorite.action?bookId=<s:property value="bookId"/>" target="_blank">收藏</a>
                 ---------------
                 <a href="<%=basePath%>/my/addMyFavorite4Json.action?bookId=<s:property value="bookId"/>" target="_blank">收藏4Json</a>
             </td>
             <td class="tocenter">
                 <a href="<%=basePath%>/book/deleteBook.action?bookId=<s:property value="bookId"/>" target="_blank">删除</a>
             </td>
             
             <td class="tocenter">
                 <a href="<%=basePath%>/book/loadBook.action?bookId=<s:property value="bookId"/>" target="_blank">修改</a>
             </td>
             <td class="tocenter">
                 <a href="<%=basePath%>/book/upswf.jsp?bookId=<s:property value="bookId"/>" target="_blank">上传swf文件</a>
             </td> 
               
        </tr>
    </s:iterator>
	</table>
	
	
	
	<table>
	<tr>
	<td width="13%" class="tocenter">
 	共<s:property value="pageBean.totalPage" />页
	</td>
	<td width="17%" class="tocenter">
 	共<s:property value="pageBean.allRow" />条记录
	</td>
	<td width="15%" class="tocenter">当前第<s:property value="pageBean.currentPage" />页
	</td>
	<td colspan="4" width="55%" class="tocenter">
		<s:if test="%{pageBean.currentPage == 1}">第一页&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;</s:if>
		<s:else>
			<a href="queryBookList.action?page=1">第一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
		<a href="queryBookList.action?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
	</s:else>
		<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
			<a href="queryBookList.action?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="queryBookList.action?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
	</s:if>
	<s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 最后一页</s:else>
	</td>
	</tr>
	</table>
</body>
</html>