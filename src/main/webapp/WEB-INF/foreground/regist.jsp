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
<title>注册</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />" />
</head>
<body>
<jsp:include page="../foreground/fragment/head.jsp"></jsp:include>
	<div style="text-align: center; margin-top: 100px;"  >
	<h1>注册</h1>
		<form method="post" action='<c:url value="/user/regist"/>' onsubmit="return check()">
			<div class="row form-group">
				手机号：<input type="text" id ="phone" name="phone" value="${user.phone }"/>
			</div>
			<div class="row form-group">
				密  &nbsp; 码：<input type="password" id ="password" name="password" value="${user.password }"/>
			</div>
			<div class="row form-group">
				昵  &nbsp; 称：<input type="text" id ="nickname" name="nickname" value="${user.nickname }"/>
			</div>
			<input type="submit" value="注册" ><span> &nbsp; &nbsp;</span>
			<input type="reset" value="取消" />
		</form>

	</div>

</body>

<script type="text/javascript" src='<c:url value="/js/jquery.js"/>'></script>
<script type="text/javascript">

function check(){
	var phone = $("#phone").val();
	var password = $("#password").val();
	var nickname = $("#nickname").val();
	if(phone=="" || password=="" || nickname==""){
		return false;
	}
}

</script>
</html>