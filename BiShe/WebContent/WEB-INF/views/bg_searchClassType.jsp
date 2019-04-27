<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课兜后台管理系统</title>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="${ctx }/dist/css/zui.min.css">

<!-- ZUI Javascript 依赖 jQuery -->
<script src="${ctx }/dist/lib/jquery/jquery.js"></script>
<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
<script src="${ctx }/dist/js/zui.min.js"></script>

<link type="text/css" rel="stylesheet" href="${ctx }/css/style.css" />
<script type="text/javascript" src="${ctx }/js/menu.js"></script>
<link href="${ctx }/dist/lib/datagrid/zui.datagrid.min.css"
	rel="stylesheet">
<script src="${ctx }/dist/lib/datagrid/zui.datagrid.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  //这是定义的静态数组 传回数据是按照如下格式传回即可
  $('#datagridExample').datagrid({
    dataSource: {
        cols:[
			{name: 'id', label: '章节id', width: 70},
            {name: 'subject', label: '学科', width: 132},
            {name: 'chapter', label: '章节', width: 500},

        ],
        array:[
		<c:forEach items="${mlist}" var="mlist">
		{ id:"${mlist.id}",subject:"数学",chapter: "${mlist.type}"},   		
		</c:forEach>
		<c:forEach items="${elist}" var="elist">
		{ id:"${elist.id}",subject:"英语",chapter: "${elist.type}"},   		
		</c:forEach>
		<c:forEach items="${plist}" var="plist">
		{ id:"${plist.id}",subject:"政治",chapter: "${plist.type}"},   		
		</c:forEach>
        ]
    },
    //特殊列的参数
    configs:{
      C0:{
        className: 'text-left',
        style:{

          color:'#00b8b4',
        }
      }
    },
    rowDefaultHeight:50,
    //分页
     states: {
        pager: {page: 1, recPerPage: 7}
    },

    //排序开关
    sortable: true,
    // checkbox
    checkable: true,
    checkByClickRow: true,

});
});
// 获取数据表格实例
var myDataGrid = $('#datagridPageExample').data('zui.datagrid');

// 获取当前已选中的行数据项
var selectedItems = myDataGrid.getCheckItems();
function al(){
	var myDataGrid = $('#datagridExample').data('zui.datagrid');
	var selectedItems = myDataGrid.getCheckItems();
	var str=JSON.stringify(selectedItems);
	if(str==null){
		alert("未选中用户");
	}
	var xmlhttp;
	 if(window.XMLHttpRequest) {
		 xmlhttp = new XMLHttpRequest();
	 }else {
		 xmlhttp = new ActiveXObjec("Microsoft.XMLHTTP");
	 }
	 xmlhttp.onreadystatechange = function() {
		//如果成功接收到并响应
         if(xhr.status == 200 &&xhr.readyState == 4){
            alert(123);
         }
	 }
	 xmlhttp.open("POST","${ctx }/bg/deleteChapter",true);
	 xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	 xmlhttp.send("str="+str);
	 }

</script>


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
					<h4 class="M1">
						<i class="icon icon-user">&nbsp;&nbsp;</i>用户管理
					</h4>
					<div class="list-item none">
						<a href='bg_addAdmin.html'>添加管理员</a> <a href='bg_editUser.html'>修改用户信息</a>
						<a href='bg_searchUser.html'>查看用户列表</a> <a
							href='bg_searchAdmin.html'>查看管理员列表</a>
					</div>
				</li>


				<li>
					<h4 class="M4">
						<i class="icon icon-align-left">&nbsp;&nbsp;</i>学习章节管理
					</h4>
					<div class="list-item none">
						<a href='${ctx }/bg/tiaozhuan'>添加学习章节</a> <a
							href='bg_editClassType.html'>修改学习章节</a> <a
							href='bg_searchClassType.html'>查看学习章节列表</a>

					</div>
				</li>
				<li>
					<h4 class="M5">
						<i class="icon icon-book">&nbsp;&nbsp;</i>评论管理
					</h4>
					<div class="list-item none">
						<a href='bg_searchClass.html'>查看评论列表</a>
					</div>
				</li>
				<li>
					<h4 class="M6">
						<i class="icon icon-newspaper-o">&nbsp;&nbsp;</i>文章管理
					</h4>
					<div class="list-item none">
						<a href='bg_addBulletin.html'>添加文章</a> <a
							href='bg_searchBulletin.html'>操作</a>
					</div>
				</li>
			</ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
				<ul>
					<li></li>
					<li style="margin-left: 25px;">您当前的位置：</li>
					<li><a href="#">首页</a></li>
					<li>></li>
					<li><a href="#">查看学习章节</a></li>
				</ul>
			</div>
			<div class="main">
				<div>
					<div id="datagridExample" class="datagrid datagrid-borderless">
						<div
							class="input-control search-box search-box-circle has-icon-left has-icon-right"
							id="searchboxExample2" style="margin-bottom: 10px">
							<div
								class="input-control search-box search-box-circle has-icon-left has-icon-right"
								style="max-width: 300px">
								<input id="inputSearchExample2" type="search"
									class="form-control search-input" placeholder="搜索"> <label
									for="inputSearchExample2"
									class="input-control-icon-left search-icon"><i
									class="icon icon-search"></i></label> <a href="#"
									class="input-control-icon-right search-clear-btn"><i
									class="icon icon-remove"></i></a>
							</div>

							<div class="div1"
								style="position: absolute; right: 0px; top: 0px">
								<div class="btn-group">
									<button type="button" class="btn" onclick="al()">删除</button>
								</div>
							</div>
						</div>

						<div class="datagrid-container"></div>
						<div class="pager"></div>
						<div class="btn-group"></div>
					</div>
				</div>

			</div>
			<div class="bottom"></div>
			<div id="footer">
				<p>Copyright© 2015 版权所有</p>
			</div>
			<script>navList(12);</script>
</body>
</html>
