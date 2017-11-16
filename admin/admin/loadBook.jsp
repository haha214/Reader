<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
                    <h3>请修改数据</h3> <s:actionerror/>
                    <form class="devaldi" method="post" action="updateBook.action">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        <label for="">名称</label>
                                    </td>
                                    <td>
                                        <div class="text">
                                            <input type="text" name="bookName" value="<s:property value="book.bookName"/>">
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
                                            <input type="text" name="bookISBN" value="<s:property value="book.bookISBN"/>" >
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
                                            <input type="text" name="publishDate" value="<s:property value="book.publishDate"/>" >
                                            <div class="effects"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="">类型</label>
                                    </td>
                                    <td>
                                        <div class="text">
                                            <input type="text" name="bookType" value="<s:property value="book.bookType"/>" >
                                            <div class="effects"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="">封面</label>
                                    </td>
                                    <td>
                                        <div class="text">
                                            <input type="text" name="bookImage" value="<s:property value="book.bookImage"/>" >
                                            <div class="effects"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="">描述</label>
                                    <td>
                                        <div >
                                            <textarea name="bookDesc" style="width:100%;height: 100px;padding: 5px;"><s:property value="book.bookDesc"/></textarea>
                                            <div class="effects"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                	<td>
                                	 	<input type="text" name="bookId" value="<s:property value="book.bookId"/>">
                                	</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="btn-area clearfix">
                            <button type="submit" class="btn">保存</button>
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
    </body>
</html>