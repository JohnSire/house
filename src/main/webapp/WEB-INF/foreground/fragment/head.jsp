<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='<c:url value ="/css/bootstrap3.css"/>' rel="stylesheet" type="text/css" />
<link href='<c:url value ="/css/custom/main.css"/>' rel="stylesheet" type="text/css" />

</head>
<body>
	<div >
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href='<c:url value="/house/findList" />'>PEAK房屋</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<c:if test="${sessionScope.user ne null && sessionScope.user.id ne null}">
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				
				<ul class="nav navbar-nav navbar-right">
					<li><a >${sessionScope.user.nickname }</a></li>
					<li><a href='<c:url value="/user/logout" />'>退出</a></li>
					<li><a href='<c:url value="/user/findAttentions?uid=${sessionScope.user.id }" />'>我的关注</a></li>
				</ul>
			</div> 
			</c:if>
			<c:if test="${sessionScope.user eq null || sessionScope.user.id eq null}">
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				
				<ul class="nav navbar-nav navbar-right">
					<li><a href='<c:url value="/user/login"/>'>登录</a></li>
					<li><a href='<c:url value="/user/registForm"/>'>注册</a></li>
				</ul>
			</div> 
			</c:if>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>
</body>
</html>