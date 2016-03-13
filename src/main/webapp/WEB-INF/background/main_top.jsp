<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
</head>
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap.min.css" />" />
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap-responsive.min.css" />" />
<link rel="stylesheet"
	href="<c:url value="/css/matrix-style.css" />" />
<link rel="stylesheet"
	href="<c:url value="/css/matrix-media.css" />" />
<link href="<c:url value="/font-awesome/css/font-awesome.css" />"
	rel="stylesheet" />
<body>
	<!--Header-part-->
	<div id="header">
		<h1></h1>
		<!--添加一张logo-->
	</div>
	<!--close-Header-part-->
	<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav">
			<li class="dropdown" id="profile-messages"><a title="" href="#"
				data-toggle="dropdown" data-target="#profile-messages"
				class="dropdown-toggle"> <i class="icon icon-user"></i> <span
					class="text">${sessionScope.admin.nickname }</span><b class="caret"></b> </a>
				<ul class="dropdown-menu">
					<li><a href="<c:url value=""/>"><i class="icon-user"></i>个人信息</a></li>
					<li class="divider"></li>
					<li><a href="<c:url value="}"/>"><i class="icon-check"></i>修改密码</a></li>
					<li class="divider"></li>
					<li><a href="<c:url value="/back/admin/logout"/>"
						onclick="return confirm('确认退出吗？');"><i class="icon-key"></i>退出</a>
					</li>
				</ul>
			</li>
			<li class=""><a title="" href="<c:url value="/back/admin/logout"/>"
				onclick="return confirm('确认退出吗？');"><i
					class="icon icon-share-alt"></i> <span class="text">退出</span> </a></li>
		</ul>
	</div>
	<!-- 实现左边动画 -->
	<script src="<c:url value="/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/js/matrix.js"/>"></script>
	<!-- 实现上边动画 -->
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/js/matrix.dashboard.js"/>"></script>
	
</body>
</html>
