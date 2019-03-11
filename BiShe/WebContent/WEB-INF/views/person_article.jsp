<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
      <c:set var="courseImgPath" value="/file/course" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="${ctx }/js/jquery.zui.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctx}/css/personal.css"/>
		<link rel="stylesheet" href="${ctx}/css/zui.min.css"/>
		<script type="text/javascript" src="${ctx}/js/zui.min.js"></script>
			<script src="${ctx }/js/personal.js"></script>
	</head>
	<body>
	<!-- 有收藏课程 -->
	<c:if test="${not empty articleList }">
	<form action="${ctx}/collection/batchdelete?page=${page }" method="post">
		<table cellspacing="4" cellpadding="0" class="table">
				<tr>
					<th class="tr-th3" style="display:table-cell;vertical-align:middle">
					<input type="checkbox" id="allCheckBox" style="margin-right: 10px;margin-left: 18px;checked:false value="全选">
					</th>
					<th class="tr-th1" style="vertical-align:middle;">题目</th>
					<th class="tr-th1" style="vertical-align:middle;">标签</th>
					<th class="tr-th1" style="vertical-align:middle;">内容</th>
					<th class="tr-th1" style="vertical-align:middle;">时间</th>
					<th class="tr-th1" style="vertical-align:middle;">操作</th>
				</tr>
				<c:forEach items="${articleList }" var="p">
				<tr class="test" id="">
					<th class="tr-td1" style="display:table-cell; vertical-align:middle"><input type="checkbox" name="tempString"  style="margin-right: 10px;margin-left: 18px;checked:false" value="${p.id }"></th>
					<td class="tr-td"  style="display:table-cell; vertical-align:middle">${p.title }</td>
					<td class="tr-td" style="display:table-cell; vertical-align:middle">${p.tag }</td>
					<td class="tr-td" style="display:table-cell; vertical-align:middle">${p.content }</td>
					<td class="tr-td" style="display:table-cell; vertical-align:middle">${p.date }</td>
					<th  class="tr-td1" style="display:table-cell; vertical-align:middle"><a href="${ctx}/forum/delete?id=${p.id}"><div class="delete"><i class="icon icon-trash icon-1x"></i></div></a></th>
				</tr>
				</c:forEach>
		</table>
	</form>
</c:if>	
			<!-- 无收藏课程 -->
	<c:if test="${ empty articleList }">
		<div class="nonecourse">
				<div class="nonecourseImg">
					<img  src="${ctx}/images/none.jpg" width="20%" height="20%">
				</div>
				<div class="nonecourseText">没有发布过文章。。。</div>
		</div>
	
	</c:if>
	</body>
</html>