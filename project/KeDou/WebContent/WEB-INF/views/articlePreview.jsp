<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="articleImgPath" value="/file/temp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预览图片</title>
<style>
	body{
		text-align:center;
	}
	#preview{
		margin-top:20px;
	}
</style>
</head>
<body>
<div id="preview"><img src="${articleImgPath }/${article.titleimg }"/>
<h2>${article.title }</h2>
<div id="content">${article.content }</div>
<a href="${ctx }/forum/endpreview"><button>退出预览</button></a>
</div>
</body>
</html>