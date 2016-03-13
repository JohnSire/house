<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">

<head>
<title>Admin Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/matrix-login.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap-responsive.min.css"/>" />
<link href="<c:url value="/font-awesome/css/font-awesome.css"/>"
	rel="stylesheet" />
</head>
<body>
	<div id="loginbox">
		${msg }
		<form id="loginform" class="form-vertical" action="<c:url value="/back/admin/login"/>"
			method="post" onsubmit="return encrypt()">
			<div class="control-group normal_text">
				<h3>
					<img src="<c:url value="/img/logo.png"/>" alt="Logo" />
				</h3>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_lg"><i class="icon-user"></i> </span> <input
							type="text"  name="phone" id="phone"
							class="required" value="${phone }" placeholder="手机号" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly"><i class="icon-lock"></i> </span> <input
							type="password" placeholder="密码" name="password"
							id="password" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<input type="submit" class="btn btn-success" value="Login">
			</div>
		</form>
	</div>
	<script src="<c:url value="/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/js/matrix.login.js"/>"
		type="text/javascript" charset="utf-8"></script>
	<script src="<c:url value="/js/jquery.validate.js"/>"></script>
	<script src="<c:url value="/js/jquery.md5.js"/>"></script>
	<script type="text/javascript">
    $("#loginform").validate({
        rules: {
        	phone: "required",
            password: {
                required: true,
                minlength: 6
            },
        },
        messages: {
        	phone:  "请输入用户名",
            password: {
                required: "请输入密码",
                minlength: jQuery.format("密码不能小于{0}个字符")
            }
        }
    });
    
    function encrypt(){
    	/// var pwd = $.md5($("#password").val());
    	$("#password").val(pwd);
    	return true;
    };
</script>
</body>

</html>
