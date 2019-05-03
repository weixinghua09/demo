<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课兜后台管理系统</title>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="${ctx }/css/zui.min.css">

<!-- ZUI Javascript 依赖 jQuery -->
<script src="${ctx }/js/jquery.zui.js"></script>
<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
<script src="${ctx }/js/zui.min.js"></script>

<link type="text/css" rel="stylesheet" href="${ctx }/css/bgstyle.css" />
<script type="text/javascript" src="${ctx }/js/menu.js"></script>
<link href="${ctx }/zui/lib/datagrid/zui.datagrid.min.css" rel="stylesheet">
<script src="${ctx }/zui/lib/datagrid/zui.datagrid.min.js"></script>


</head>

<body>
<div class="top"></div>
<div id="header">
	<div class="logo">课兜后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="">Tony</a></li>
			<li><a href="">修改密码</a></li>
			<li><a href="">设置</a></li>
			<li><a href="">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
      <li>
          <h4 class="M1"><i class="icon icon-user">&nbsp;&nbsp;</i>用户管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_admin/toAddAdmin'>添加管理员</a>
            <a href='${ctx}/bg_admin/searchAdmin'>查看管理员列表</a>
            <a href='${ctx}/bg_admin/searchUser'>查看用户列表</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><i class="icon icon-align-left">&nbsp;&nbsp;</i>学习章节管理</h4>
          <div class="list-item none">
            <a href="${ctx}/bg_admin/tiaozhuan">添加学习章节</a>
            <a href="${ctx}/bg_admin/searchChapter">查看学习章节列表</a>        
           </div>
        </li>
        <li>
          <h4 class="M2"><i class="icon icon-align-left">&nbsp;&nbsp;</i>标签管理</h4>
          <div class="list-item none">
            <a href="${ctx}/bg_common/bggoAddTag">添加标签</a>
            <a href='${ctx}/bg_common/searchTag'>查看标签列表</a>        
           </div>
        </li>
        <li>
          <h4 class="M3"><i class="icon icon-book">&nbsp;&nbsp;</i>评论管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_admin/comment'>查看评论列表</a>
          </div>
        </li>
        <li>
          <h4 class="M5"><i class="icon icon-newspaper-o">&nbsp;&nbsp;</i>文章管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_common/bggoSearchArticle'>查看文章列表</a>
          </div>
        </li>		
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
						<li></li>
						<li style="margin-left:25px;">您当前的位置：</li>
						<li><a href="#">首页</a></li>
						<li>></li>
                		<li><a href="#">查看管理员列表</a></li>
					</ul>
			</div>
	<div class="main">
      <div>
        <div id="datagridExample" class="datagrid datagrid-borderless">
          <div class="input-control search-box search-box-circle has-icon-left has-icon-right" id="searchboxExample2" style="margin-bottom: 10px">
          	<div class="input-control search-box search-box-circle has-icon-left has-icon-right" style="max-width: 300px"> 
          		<input id="inputSearchExample2" type="search" class="form-control search-input" placeholder="搜索">
            	<label for="inputSearchExample2" class="input-control-icon-left search-icon"><i class="icon icon-search"></i></label>
            	<a href="#" class="input-control-icon-right search-clear-btn"><i class="icon icon-remove"></i></a></div>
			</div>
		</div>
      </div>

            <div class="datagrid-container">
            	<!-- 有文章 -->
	<c:if test="${not empty adminList }">
	<form action="${ctx}/collection/batchdelete?page=${page }" method="post">
		<table cellspacing="4" cellpadding="0" class="table">
				<tr>
					<th class="tr-th3" style="display:table-cell;vertical-align:middle">
					<input type="checkbox" id="allCheckBox" style="margin-right: 10px;margin-left: 18px;checked:false value="全选">
					</th>
					<th class="tr-th1" style="vertical-align:middle;">ID</th>
					<th class="tr-th1" style="vertical-align:middle;">标签</th>
					<th class="tr-th1" style="vertical-align:middle;">删除</th>
				</tr>
				<c:forEach items="${adminList }" var="p">
				<tr class="test" id="">
					<th class="tr-td1" style="display:table-cell; vertical-align:middle"><input type="checkbox" name="tempString"  style="margin-right: 10px;margin-left: 18px;checked:false" value="${p.id }"></th>
					<td class="tr-td"  style="display:table-cell; vertical-align:middle">${p.id }</td>
					<td class="tr-td" style="display:table-cell; vertical-align:middle">${p.name }</td>
					<th class="tr-td1" style="display:table-cell; vertical-align:middle"><a href="${ctx}/bg_admin/deleteTag?id=${p.id}"><div class="delete"><i class="icon icon-trash icon-1x"></i></div></a></th>
				</tr>
				</c:forEach>
		</table>
	</form>
</c:if>	
			<!-- 无标签 -->
	<c:if test="${ empty adminList }">
		<div class="nonecourse">
				<div class="nonecourseImg">
					<img  src="${ctx}/images/none.jpg" width="20%" height="20%">
				</div>
				<div class="nonecourseText">没有发布过文章。。。</div>
		</div>
	
	</c:if>
 </div>
        </div>
			</div>
		
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 </p></div>
<script>navList(12);</script>
</body>
</html>