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
<link href="${ctx }/zuilib/datagrid/zui.datagrid.min.css" rel="stylesheet">
<script src="${ctx }/zuilib/datagrid/zui.datagrid.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  //这是定义的静态数组 传回数据是按照如下格式传回即可
  $('#datagridExample').datagrid({
    dataSource: {
        cols:[
            {name: 'courseId', label: '课程ID', width: 132},
            {name: 'busId', label: '机构ID', width: 134},
            {name: 'courseName', label: '课程名字', width: 109},
            {name: 'description', label: '课程描述', width: 109},
            {name: 'courseStartTime', label: '课程开始时间', width: 287},
            {name: 'courseEndTime', label: '课程结束时间', width: 109},
            {name: 'coursePrice', label: '课程价格', width: 109},
            {name: 'courseSold', label: '课程已售数量', width: 109},
            {name: 'courseImg', label: '课程图片', width: 109},
            {name: 'hot', label: '热门', width: 109},
            {name: 'state', label: '课程状态', width: 109}
        ],
        array:[
        	<c:forEach items="${list}" var="list">
    		{ courseId:"${list.courseId}",busId: "${list.busId}", courseName: "${list.courseName}", description:"${list.description}",courseStartTime:"${list.courseStartTime}",courseEndTime:"${list.courseEndTime}",coursePrice:"${list.coursePrice}",courseSold:"${list.courseSold}",courseImg:"${list.courseImg}",hot:"${list.hot}",state:"${list.state}"},   		
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
        pager: {page: 1, recPerPage: 20}
    },

    //排序开关
    sortable: true,
    // checkbox
    checkable: true,
    checkByClickRow: true,

});
});

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
	 xmlhttp.open("POST","${ctx }/bg_course/bgLockCou",true);
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
          <h4 class="M1"><i class="icon icon-user">&nbsp;&nbsp;</i>用户管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_common/bggoAddAdmin'>添加管理员</a>
            <a href='${ctx}/bg_common/bggoEditUser'>修改用户信息</a>
            <a href='${ctx}/bg_common/bggoSearchUser'>查看用户列表</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><i class="icon icon-shopping-cart">&nbsp;&nbsp;</i>机构管理</h4>
          <div class="list-item none">
            <a href="${ctx}/bg_common/bggoEditStore">修改机构</a>
            <a href="${ctx}/bg_common/bggoSearchStore">查看机构列表</a>         
           </div>
        </li>
        <li>
          <h4 class="M3"><i class="icon icon-time">&nbsp;&nbsp;</i>预约管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_common/bggoSearchReservation'>预约检索</a>
          </div>
        </li>
        <li>
          <h4 class="M5"><i class="icon icon-book">&nbsp;&nbsp;</i>课程管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_common/bggoSearchCourse'>查看课程列表</a>
          </div>
        </li>
    <!-- 
        <li>
          <h4  class="M6"><i class="icon icon-newspaper-o">&nbsp;&nbsp;</i>公告管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_common/bggoAddBulltein'>添加公告</a>
            <a href='bg_searchBulletin.html'>公告操作</a>
            <a href='bg_editBulletin.html'>修改公告</a>
          </div>
        </li>     
         -->  				
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">首页</a></li>
								<li>></li>
                <li><a href="#">查看课程类型</a></li>
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
           
               <div class="div1" style="position:absolute; right:0px;top:0px"><div class="btn-group">
  <button type="button" onclick="al()" class="btn">锁定课程</button>
  <button type="button" class="btn">删除</button>
</div></div>
          </div>

            <div class="datagrid-container"></div>
            <div class="pager"></div>
            <div class="btn-group">
        </div>
        </div>
			</div>
		
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 </p></div>
<script>navList(12);</script>
</body>
</html>