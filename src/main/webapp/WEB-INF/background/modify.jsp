<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>更改密码</title>
<jsp:include page="main_top.jsp"></jsp:include>
<jsp:include page="main_left.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/css/styles.css"/>" />

<!-- JavaScript includes - jQuery, the complexify plugin and our own script.js -->
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery.md5.js"/>"></script>
<script src="<c:url value="/js/jquery.complexify.js"/>"></script>
<script src="<c:url value="/js/script.js"/>"></script>
</head>

<body>

	<!--=============================================================================================================================================================================-->
	<!--main-container-part-->
	<div id="content">
		<!--breadcrumbs-->
		<div id="content-header">
			<div id="breadcrumb">
				<a href="<c:url value="/admin/index_.action"/>" title="主页" class="tip-bottom"><i class="icon-home"></i>主页</a>
				<a title="修改密码" class="tip-bottom">修改密码</a>
			</div>
		</div>
		<!--End-breadcrumbs-->

		<div id="main">
			<h1>更改密码</h1>

			<form class="" method="post" action="<c:url value="/admin/modify.action"/>">
			<input type="hidden" value="${msg }" id = "msg"> 
				<input type="hidden" value='${sessionScope.admin.id }' id="id" name="id"/>
				<div class="row pass">
					<input type="password" id="password" name="password"
						placeholder="原密码" />
				</div>

				<div class="row pass">
					<input type="password" id="password1" name="password1"
						placeholder="新密码" />
				</div>

				<div class="row pass">
					<input type="password" id="password2" name="password2"
						placeholder="确认密码" disabled="disabled"/>
				</div>

				<!-- The rotating arrow -->
				<div class="arrowCap"></div>
				<div class="arrow"></div>

				<p class="meterText">密码强度</p>

				<input type="submit" value="更改密码" />
			</form>
		</div>
	</div>
	<!--==================================================================================================================-->
	<jsp:include page="main_bottom.jsp"></jsp:include>
</body>
</html>