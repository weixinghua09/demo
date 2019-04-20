<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>文章列表</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="${ctx}/css/zui.css">
		<link rel="stylesheet" type="text/css" href="${ctx }/css/content.css">
		<link rel="stylesheet" type="text/css" href="${ctx}/css/banner.css">
		<link rel="stylesheet" type="text/css" href="${ctx}/css/zui.css">
		<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    	<script type="text/javascript" src="${ctx }/js/chart.js"></script>
	</head> 
	<body style="">
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
								<input id="inputSearchExample3" type="search" name="search"  class="form-control search-input" value="${searchSentence}"/>
							
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
						<img src="${userImgPath}/${sessionScope.loginUser.userIcon}" onerror="this.src='${ctx }/img/logo.jpg'"/>
					</div>
					<div class="popover bottom" id="myPopover">
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
						<li><a href="${ctx }/common/toindex" class="nav-a">首页</a></li>
						<li><a href="${ctx }/calendar/list" class="nav-a">考试日历</a></li>
						<li><a href="${ctx }/forum/showforum" class="nav-a">论坛 </a></li>
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
		<div style="background-color: #F9F8F7;width: 100%;height: 100%;">
			<div class="container" style="background-color: white;">
				<div id="content">
					<div id="content-left">
						<!--课程列表-->
						<div id="content-left-top">
							<div id="content-nav">
								<ul class="nav nav-tabs">
								<li><a href="${ctx }/course/searchCourseListAsc?page=${page}&totalCount=${totalCount}&search=${searchSentence}">价格</a></li>
								</ul>
							</div>
							<div id="course-list">
							<c:if test="${empty articleList }">
								<span>抱歉，没有搜索结果。。。</span>
							</c:if>
							<c:if test="${not empty articleList }">
								<c:forEach  items="${articleList }" var="p" varStatus="i">
									<div class="course">
									<a href="${ctx }/course/toCourseDetail?courseId=${p.id}" style="color: #666560;">
										<div class="course-img">
											<img src="${ctx }/images/label-2.jpg" style="border-radius: 8px;" />
										</div>
									</a>
										<div class="course-info">
											<div class="coursename">
												<a href="${ctx }/course/toCourseDetail?courseId=${p.id}" style="color: #666560;">
													${p.title }
												</a>
											</div>
											<div class="course-abstract">
												<span class="abstract">简介：</span>
												<p>${p.content }</p>
											</div>
											<div class="sourse-price">
												${p.likes } 
											</div>
											<div class="sourse-order">
													<a class="btn btn-danger" href="${ctx }/forum/like?id=${p.id}&search=${search }"><i class="icon-heart"></i> 喜欢</a>
													<a class="btn btn-primary" href="${ctx }/forum/collect?id=${p.id}&search=${search }">收藏</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							</div>
						</div>
						<!--分页-->
					<div id="content-left-paging">
						<ul id="myPager" class="pager"  data-ride="pager" data-page="${page}" data-rec-Total="${totalCount }" data-rec-Per-Page="3" data-link-creator="${ctx }/course/searchCourseList?page={page}&totalCount={recTotal}&search=${searchSentence}" ></ul>				
					</div>
					</div>
					<!-- 广告-->
					<div id="content-right">
						<div id="content-right-top">
							<div class="content-adcard">
								<a class="card" href="${ctx }/course/toCourseDetail?courseId={cal.course.courseId }">
									<img src="${ctx }/images/label-1.jpg" >
									<div class="card-heading"><strong>英语单词备考</strong></div>
									<div class="card-content text-muted">考研大纲高频词汇</div>
									<div class="card-actions">
									<button type="button" class="btn btn-danger" value="3"  id="collection${cal.course.courseId}" onclick="ButtonCollectionShow(${cal.course.courseId})"><i class="icon-heart"></i> 喜欢</button>
									<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 520 人喜欢</div>
									</div>
								</a>
							</div>
							<div class="content-adcard">
								<a class="card" href="${ctx }/course/toCourseDetail?courseId={cal.course.courseId }">
									<img src="${ctx }/images/label-1.jpg" >
									<div class="card-heading"><strong>英语单词备考</strong></div>
									<div class="card-content text-muted">考研大纲高频词汇</div>
									<div class="card-actions">
									<button type="button" class="btn btn-danger" value="3"  id="collection${cal.course.courseId}" onclick="ButtonCollectionShow(${cal.course.courseId})"><i class="icon-heart"></i> 喜欢</button>
									<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 520 人喜欢</div>
									</div>
								</a>
							</div>
							<div class="content-adcard">
								<a class="card" href="${ctx }/course/toCourseDetail?courseId={cal.course.courseId }">
									<img src="${ctx }/images/label-1.jpg" >
									<div class="card-heading"><strong>英语单词备考</strong></div>
									<div class="card-content text-muted">考研大纲高频词汇</div>
									<div class="card-actions">
									<button type="button" class="btn btn-danger" value="3"  id="collection${cal.course.courseId}" onclick="ButtonCollectionShow(${cal.course.courseId})"><i class="icon-heart"></i> 喜欢</button>
									<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 520 人喜欢</div>
									</div>
								</a>
							</div>
						</div>
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
							<a class="navbar-brand" href="your/nice/url">Morning</a>
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
		<!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
		<script src="${ctx}/js/jquery.js"></script>
		<!-- ZUI Javascript组件 -->
		<script src="${ctx}/js/zui.min.js"></script>
		<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>	
	</body>
</html>	