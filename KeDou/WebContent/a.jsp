<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
        <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ctx }/js/jquery.zui.js"></script>
<script type="text/javascript">
function a () {
	
	var test = "HAHAH";
	$.ajax({
		url : "/KeDou/user/description",
		type : "POST",
		data : "HA="+test,
		dataType:'json',
		success : function(data) {
			if (data == "yes") {
				window.location.href ="/KeDou/user/showuserlabel";
			} else if (data == "no") {
			
			}
		},error: function(data){  		
		}
	});
}


</script>
</head>
<body>

<button onclick = "a()">测试</button>
</body>
</html>