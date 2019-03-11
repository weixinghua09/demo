<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>写文章</title>
	<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="${ctx }/css/zui.min.css">
		<link rel="stylesheet" type="text/css" href="${ctx }/css/banner.css">
		<link rel="stylesheet" type="text/css" href="${ctx }/css/progress.css">
		<script type="text/javascript" src="${ctx }/js/jquery.zui.js"></script>
		<script src="${ctx }/js/zui.min.js"></script>
		<script src="${ctx }/zui/lib/kindeditor/kindeditor.min.js"></script>

   		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   		<script type="text/javascript">
   			$(document).ready(function(){
			KindEditor.create('textarea.kindeditorSimple', {
			    basePath: '${ctx}/zui/lib/kindeditor',
			    bodyClass : 'article-content',
			    resizeType : 1,
			    allowPreviewEmoticons : false,
			    allowImageUpload : false,
			    items : [
			        'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			        'insertunorderedlist', '|', 'emoticons', 'image', 'link'
			    ],
			    afterBlur: function(){this.sync();}
			});
		});
   		</script>
</head>
<body style="background-color: #F9F8F7;">
	<div class="container-fluid" style="background-color: #F9F8F7;">
		<div id="header">
			<!--logo-->
			<div id="logo">
				<img src="${ctx }/images/logo.png"/>
			</div>
			<!--搜索框-->
			<div id="find">
				<form action="${ctx }/course/searchFirstCourseList" id="searchForm" method="get">
					<div class="input-group">
						<div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
							<input id="inputSearchExample3" type="search" name="search"  class="form-control search-input" value="备考经验"/>
							<label for="inputSearchExample3" class="input-control-icon-left search-icon">
								<i class="icon icon-search" style="line-height: 2;"></i>
							</label>
						</div>
						<span class="input-group-btn">
							<button class="btn btn-primary" type="submit">搜索</button>
						</span>
					</div>
				</form>					
			</div>
			<!--定位-->
			<div id="locate">
				<i class="icon icon-map-marker icon-2x" ></i>
				<p id="address">[<a href="${ctx }/useraddress/toaddress" style="color:#3280fc; text-decoration: none;">切换地址</a>]</p>
			</div>
			<!--个人头像-->
			<div id="userPad">
				<div id="myPhoto">
					<img src="${userImgPath}/${sessionScope.loginUser.userIcon}" onerror="this.src='${ctx }/images/me.png'"/>
				</div>
				<div class="popover bottom" id="myPopover" style="top:12%;">
					<div class="arrow"></div>
						<h3 class="popover-title"><a href="${ctx }/user/person"><i class="icon icon-home"></i>&nbsp&nbsp个人中心</a></h3>
						<div class="popover-content">
							<ul>
								<li class="menu-li"><a href="${ctx }/user/person"><i class="icon icon-envelope"></i>&nbsp&nbsp我的消息</a></li>
								<li class="menu-li"><a href="${ctx }/user/person?address=1"><i class="icon icon-history"></i>&nbsp&nbsp我的足迹</a></li>
								<li class="menu-li"><a href="${ctx }/user/person?address=2"><i class="icon icon-check-board"></i>&nbsp&nbsp我的预约</a></li>
								<li class="menu-li"><a href="${ctx }/user/person?address=3"><i class="icon icon-star"></i>&nbsp&nbsp我的收藏</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--导航条-->
			<div id="navigation">
                    <ul class="nav nav-secondary">
                        <li><a href="index.html" class="nav-a">首页</a></li>
                        <li><a href="progress.html" class="nav-a">复习进度</a></li>
                        <li><a href="forum-articles.html" class="nav-a">论坛 </a></li>
                        <li><a href="${ctx }/student/editForum?stuId=1" class="nav-a">写文章 </a></li>
                    </ul>
			</div>
		</div>
		<script>
		 $(document).ready(function(){
		        $("#myPhoto").hover(function(){
		           $("#myPopover").toggle();
		        });
		     });
		$(document).ready(function(){
		    $("#myPopover").hover(function(){
		        $("#myPopover").show();
		    });
		    $("#myPopover").mouseleave(function(){
				$("#myPopover").hide();
		    });
		 });
		</script> 
	</div>
	<div class="container" style="background-color: white;margin-top: 30px;">
	<c:if test="${not empty tagList }">
		<form action="${ctx }/forum/publish" id="searchForm" method="get">
			<div class="col-md-10 col-sm-5" style="margin-bottom: 20px;">
				<label for="exampleInputPassword1">文章标题${stu.stuId}</label>
		    	<input name="title" type="text" class="form-control" id="title" placeholder="">
		    	<input name="stuId" type="hidden" id="stuId" value="${stu.stuId}"/>		    	
			</div>
			<div class="col-md-10 col-sm-5" style="margin-bottom: 20px;">
				<label>选择标签</label>
				<select name="tag"> 
				<c:forEach items="${tagList }" var="p">
					<option value="${p.id}">${p.name }</option> 
				</c:forEach>
				</select>
			</div>
			<div class="col-md-10 col-sm-5" style="margin-bottom: 20px;">
				<textarea id="content" name="content" class="form-control kindeditorSimple" style="height:250px;">正文内容</textarea>
			</div>
			<div class="col-md-10 col-sm-5" style="margin-bottom: 20px;">
				<button type="submit" class="btn btn-primary">发布</button>
			</div>
		</form>
	</c:if>	
	<!-- 无标签 -->
	<c:if test="${ empty tagList }">
		<div class="nonecourse">
				<div class="nonecourseImg">
					<img  src="${ctx}/images/none.jpg" width="20%" height="20%">
				</div>
				<div class="nonecourseText">没有发布过文章。。。</div>
		</div>
	
	</c:if>
	</div>
	<div class="container-fluid" style="background-color: #F9F8F7;">
			<div id="footer">
				<nav class="navbar" role="navigation">
					<div class="container-fluid">
						<!-- 导航头部 -->
						<div class="navbar-header">
							<!-- 品牌名称或logo -->
							<a class="navbar-brand" href="your/nice/url">KeDou</a>
						</div>
						<!-- 导航项目 -->
						<div class="collapse navbar-collapse navbar-collapse-example">
							<!-- 一般导航项目 -->
							<ul class="nav navbar-nav">
								<li><a href="#">帮助</a></li>
								<li><a href="#">举报</a></li>
								<li><a href="#">用户反馈</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
	<!-- ZUI Javascript 依赖 jQuery -->
	<script src="${ctx}/js/jquery.js"></script>
	<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
	<script src="${ctx}/js/zui.min.js"></script>
</body>
</html>