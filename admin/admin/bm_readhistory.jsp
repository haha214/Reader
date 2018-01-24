<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="bm_history.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
    <link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.css">
		<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="../css/global.css">
		<script src="../js/jquery-1.11.1.min.js"></script>
		<script src="../js/template.js"></script>
		<script src="../layui/layui.js"></script>
    <script src="../js/jquery.dataTables.min.js"></script>
	</head>

	<body>
		<%
			HistoryLog log=new HistoryLog();
			List<HistoryLog> list=ReadHistory.searchReadHistory();
		%>
		<div class="container">
			<div class="header">
				<div class="content">
					<img src="../images/logo.png" alt="">
					<ul class="nav">
						<li>
							<a href="uppdf.jsp" title="">上传</a>
						</li>
						<li>
							<a href="queryBookList.action?page=1" title="">查看</a>
						</li>
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
				<div class="readHistory main-container">
          <h3>浏览记录</h3>
					<table cellspacing="0" cellpadding="0" class="selectable_sortable" style="width: 800px;" id="table1">
            <thead>
              <tr class="sortableRow">
                <th>书名</th>
                <td>读者ID</td>
                <td>读者姓名</td>
                <td>阅读时间</td>
              </tr>
            </thead>
            <tbody>
              <% for(HistoryLog l:list){ %>
            <tr class="sortableRow">
              <th>
                <%=l.getBookName() %>
              </th>
              <td>
                <%=l.getUserId() %>
              </td>
              <td>
                <%=l.getUserName() %>
              </td>
              <td>
                <%=l.getCreateDate() %>
              </td>
            </tr>
            <% } %>
            </tbody>
					</table>
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
  <script>
        $(document).ready(function() {
          $('#table1').dataTable({
            "dom": '<"mb10 clearfix"lf>tp',
            "searching": true, //是否允许Datatables开启本地搜索
            "paging": true, //是否开启本地分页
            "lengthChange": true, //是否允许用户改变表格每页显示的记录数
            "info": false, //控制是否显示表格左下角的信息      
            "oLanguage":  {     // 语言设置  
                          
              "sLengthMenu": "每页显示_MENU_条数据",
              "sZeroRecords":   "抱歉， 没有找到数据",
               "sSearch": "搜索:",
              "oPaginate": {                
                "sFirst": "首页",
                "sPrevious": "前一页",
                                "sNext": "后一页",
                                "sLast": "尾页"                
              }          
            },
              
            //跟数组下标一样，第一列从0开始，这里表格初始化时，第1列默认降序
            "order": [0, "desc"] //asc升序   desc降序  "order": [[ 0, "desc" ]]默认第1列为降序排列
          });

        });
      </script>

</html>