<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
                    <h3>请上传SWF文件</h3>
                    <form class="devaldi" method="post" action="UploadSWF" enctype="multipart/form-data">
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
                                        <label for="">bookId</label>
                                    </td>
                                    <td>
                                        <div class="text">
                                            <input type="text" name="bookId" value="<%=request.getParameter("bookId")%>"/>
                                            <div class="effects"></div>
                                        </div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <label for="">  选择一个文件</label>
                                    </td>
                                    <td>
                                        <div class="text">
                                            <input type="file" name="uploadFile" />
                                            <div class="effects"></div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="btn-area clearfix">
                            <button type="submit" class="btn">上传</button>
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