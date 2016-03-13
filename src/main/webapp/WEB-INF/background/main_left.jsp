<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head></head>

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>

<body>
	<!--sidebar-menu-->
	<div id="sidebar">
		<ul>
			<li class="submenu"><a href="#"><i class="icon icon-home"></i>
					<span>用户管理</span> </a>
				<ul>
					<li><a href="<c:url value="/back/user/findList"/>">用户列表</a></li>
					<li><a href="<c:url value="/back/user/addForm"/>">添加用户</a></li>
				</ul>
			</li>
			
			<li class="submenu"><a href="#"><i class="icon icon-signal"></i>
					<span>经纪人管理</span> </a>
				<ul>
					<li><a href="<c:url value="/back/agent/findList"/>">经纪人列表</a></li>
					<li><a href="<c:url value="/back/agent/addForm"/>">添加经纪人</a></li>
				</ul>
			</li>
			<li class="submenu"><a href="#"><i class="icon icon-th"></i>
					<span>房屋管理</span> </a>
				<ul>
					<li><a href="<c:url value="/back/house/findList"/>">房屋列表</a></li>
					<li><a href="<c:url value="/back/house/addForm"/>">添加房屋</a></li>
				</ul>
			</li>
			<li class="submenu"><a href="#"><i class="icon icon-inbox"></i>
					<span>售房管理</span> </a>
				<ul>
					<li><a href="<c:url value="/back/sell/findList"/>">售房信息列表</a></li>
					<li><a href="<c:url value="/back/sell/addForm"/>">添加售房信息</a></li>
				</ul>
			</li>
			<li class="submenu"><a href="#"><i class="icon icon-fullscreen"></i>
					<span>订单管理</span> </a>
				<ul>
					<li><a href="<c:url value="/back/order/findList"/>">订单列表</a></li>
				</ul>
			</li>
		</ul>
	</div>
</body>
</html>
