<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>

	<jsp:include page="main_top.jsp"></jsp:include>
	<jsp:include page="main_left.jsp"></jsp:include>
	<!--=============================================================================================================================================================================-->
	<!--main-container-part-->
	<div id="content">
		<!--breadcrumbs-->
		<div id="content-header">
			<div id="breadcrumb">
				<a title="主页" class="tip-bottom"><i class="icon-home"></i>主页</a>
			</div>
		</div>
		<!--End-breadcrumbs-->

		<!-- 主要内容 -->
		<div class="container-fluid">
			<div class="quick-actions_homepage">
				<ul class="quick-actions">
					<li class="bg_lb"><a
						href="<c:url value="/back/user/findList"/>"> <i
							class="icon-dashboard"></i>用户管理
					</a></li>
					<li class="bg_lg span3"><a
						href="<c:url value="/back/agent/findList"/>"> <i
							class="icon-signal"></i>经纪人管理
					</a></li>
					<li class="bg_lo"><a
						href="<c:url value="/back/house/findList"/>"> <i
							class="icon-th"></i>房屋管理
					</a></li>
					<li class="bg_ly"><a
						href="<c:url value="/back/sell/findList"/>"> <i
							class="icon-inbox"></i>售房管理
					</a></li>
					<li class="bg_ls"><a
						href="<c:url value="/back/order/findList"/>"> <i
							class="icon-fullscreen"></i>订单管理
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!--==================================================================================================================-->
	<jsp:include page="main_bottom.jsp"></jsp:include>

</body>
</html>
