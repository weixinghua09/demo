<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>       
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课兜后台管理系统</title>
<link rel="stylesheet" href="${ctx }/css/zui.min.css">
<script src="${ctx }/js/jquery.zui.js"></script>
<script src="${ctx }/js/zui.min.js"></script>

<link type="text/css" rel="stylesheet" href="${ctx }/css/bgstyle.css" />
<script type="text/javascript" src="${ctx }/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx }/js/menu.js"></script>

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
          <li>
          <h4 class="M1"><i class="icon icon-user">&nbsp;&nbsp;</i>用户管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_common/bggoAddAdmin'>添加管理员</a>
            <a href='${ctx}/bg_common/bggoEditUser'>修改用户信息</a>
            <a href='${ctx}/bg_common/bggoSearchUser'>查看用户列表</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><i class="icon icon-align-left">&nbsp;&nbsp;</i>学习章节管理</h4>
          <div class="list-item none">
            <a href="${ctx}/bg_common/bggoEditStore">添加学习章节</a>
            <a href="${ctx}/bg_common/bggoSearchStore">修改学习章节</a>
            <a href='bg_searchClassType.html'>查看学习章节列表</a>        
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
            <a href='${ctx}/bg_common/bggoSearchReservation'>查看评论列表</a>
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
					<li><a href="bg_index.html">首页</a></li>
					<li>></li>
					<li><a href="#">最新公告</a></li>
				</ul>
			</div>
			<div class="main">
				<form action="${ctx }/bg_admin/addTag" id="searchForm" method="get">
					<div class="col-md-10 col-sm-5" style="margin-bottom: 20px;">
						<label for="exampleInputPassword1">要添加的标签名</label>
				    	<input name="tagName" type="text" class="form-control" id="tagName" placeholder="">
				    	<button type="submit" class="btn btn-primary">添加</button>
					</div>
				</form>
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©</p></div>
<script>navList(12);</script>
</body>
</html>