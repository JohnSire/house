<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />" />
</head>
<body>
<jsp:include page="../foreground/fragment/head.jsp"></jsp:include>
	<div style="text-align: center; margin-top: 130px;"  >
	<h1>登录</h1>
		<form method="post" action='<c:url value="/user/login"/>'>
			<div class="row form-group">
				手机号：<input type="text" name="phone" value="${user.phone }"/>
			</div>
			<div class="row form-group">
				密  &nbsp; 码：<input type="password" name="password" value="${user.password }"/>
			</div>
			<input type="submit" value="登录"><span> &nbsp; &nbsp;</span>
			<input type="reset" value="取消" />
		</form>

	</div>

</body>
</html>