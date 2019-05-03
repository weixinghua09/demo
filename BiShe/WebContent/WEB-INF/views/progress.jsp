<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>progress</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${ctx }/css/zui.min.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/progress.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/banner.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
</head>
<body style="">
	<div class="container-fluid" style="background-color: #F9F8F7;">
		<div id="header">
			<!--logo-->
			<div id="logo">
				<img src="${ctx }/images/logo.png" />
			</div>
			<!--搜索框-->
			<div id="find">
				<form action="${ctx }/course/searchFirstCourseList" id="searchForm"
					method="get">
					<div class="input-group">
						<div
							class="input-control search-box search-box-circle has-icon-left has-icon-right search-example"
							id="searchboxExample">
							<input id="inputSearchExample3" type="search" name="search"
								class="form-control search-input" value="备考经验" /> <label
								for="inputSearchExample3"
								class="input-control-icon-left search-icon"> <i
								class="icon icon-search" style="line-height: 2;"></i>
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
				<i class="icon icon-map-marker icon-2x"></i>
				<p id="address">
					[<a href="${ctx }/useraddress/toaddress"
						style="color: #3280fc; text-decoration: none;">切换地址</a>]
				</p>
			</div>
			<!--个人头像-->
			<div id="userPad">
				<div id="myPhoto">
					<img src="${userImgPath}/${sessionScope.loginUser.userIcon}"
						onerror="this.src='${ctx }/images/me.png'" />
				</div>
				<div class="popover bottom" id="myPopover" style="top: 12%;">
					<div class="arrow"></div>
					<h3 class="popover-title">
						<a href="${ctx }/user/person"><i class="icon icon-home"></i>&nbsp&nbsp个人中心</a>
					</h3>
					<div class="popover-content">
						<ul>
							<li class="menu-li"><a href="${ctx }/user/person"><i
									class="icon icon-envelope"></i>&nbsp&nbsp我的消息</a></li>
							<li class="menu-li"><a href="${ctx }/user/person?address=1"><i
									class="icon icon-history"></i>&nbsp&nbsp我的足迹</a></li>
							<li class="menu-li"><a href="${ctx }/user/person?address=2"><i
									class="icon icon-check-board"></i>&nbsp&nbsp我的预约</a></li>
							<li class="menu-li"><a href="${ctx }/user/person?address=3"><i
									class="icon icon-star"></i>&nbsp&nbsp我的收藏</a></li>
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
				<li><a href="forum-edit.html" class="nav-a">写文章 </a></li>
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
	<div style="background-color: #F9F8F7; width: 100%; height: 100%;">
		<div class="container" style="background-color: white;">
			<div id="content">
				<div id="content-left">
					<!--课程列表-->
					<div id="content-left-top">
						<div id="content-nav">
							<ul class="nav nav-tabs">
								<li><a href="#">数学</a></li>
								<li><a href="${ctx }/chapter/english?stuId=1">英语</a></li>
								<li><a href="${ctx }/chapter/politics?stuId=1">政治 </a></li>
								<li><a href="${ctx }/chapter/profession?stuId=1">专业课 </a></li>
							</ul>
						</div>
						<div id="course-list">
							<c:forEach items="${ml }" var="ml">
								<form role="form" action="${ctx }/chapter/mathchapter"
									method="post" class="registration-form">
									<div class="course">
										<div class="course-img">
											<p class="hl-success">${ml.type }</p>
										</div>

										<div class="course-info">

											<div class="input-group" id="start">
												<input type="text" style="display: none" name="stuId"
													id="stuId" value="${ stuId}"> <input type="text"
													style="display: none" name="chapterId" id="chapterId"
													value="${ml.id }"> <span class="input-group-addon">开始时间</span>
												<input type="text" class="form-control" name="startDate"
													id="startDate" placeholder="XXXX年XX月XX日"> <span
													class="input-group-addon fix-border fix-padding">&nbsp;&nbsp;结束时间&nbsp;&nbsp;
												</span> <input type="text" class="form-control" name="finishDate"
													id="finishDate" placeholder="XXXX年XX月XX日">

											</div>

											<div class="input-group" id="start2">
												<span class="input-group-addon fix-border">做题正确率</span> <input
													type="text" class="form-control" name="accuracy"
													id="accuracy" placeholder="100.00 %"> <span
													class="input-group-addon"><i class="icon-ok"></i></span>
											</div>
										</div>
									</div>
									<div class="sourse-order">
										<button class="btn btn-primary">保存进度</button>
									</div>
								</form>
							</c:forEach>
						</div>
					</div>
				</div>

				<!--分页-->
				<div id="content-left-paging">
					<ul class="pager" data-ride="pager" data-page="2"
						data-rec-total="89" data-max-nav-count="4"
						data-elements="prev_icon,nav,next_icon"></ul>
				</div>
			</div>


		</div>
		<div id="content-right-top">
			<div class="adcardss">
				<form role="form" action="${ctx }/exam/progress" method="post"
					class="registration-form">

					<a class="card" href="###"> <input type="text"
						style="display: none" name="stuId" id="stuId" value="${ stuId}">
						<div class="card-heading">
							<strong>模拟测试</strong>
						</div>
					</a>
					<div class="practice">
						<select class="exercise" name="type" id="type">
							<option value="1">真题</option>
							<option value="2">模拟</option>
						</select> <input type="text" class="exercise" name="grade" id="grade"
							placeholder="分数">
					</div>
					<div class="input-group" style="margin-left: 4%;">
						<span class="input-group-addon">日期</span> <input type="text"
							class="controlss" name="date" id="date" placeholder="xxxx年xx月xx日">
					</div>
					<div class="card-actions" id="hearts">
						<button class="btn btn-danger">
							<i class="icon-heart"></i> 提交成绩
						</button>
					</div>

				</form>
			</div>

		</div>
	</div>
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
	<script src="lib/jquery/jquery.js"></script>
	<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
	<script src="js/zui.min.js"></script>
</body>
</html>
