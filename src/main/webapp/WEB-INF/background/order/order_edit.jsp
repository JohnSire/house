<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>订单信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<c:url value="/js/jquery.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/info_main.css"/>" />
</head>
<body>

	<jsp:include page="../main_top.jsp"></jsp:include>
	<jsp:include page="../main_left.jsp"></jsp:include>
	<!--=============================================================================================================================================================================-->
	<!--main-container-part-->
	<div id="content">
		<!--breadcrumbs-->
		<div id="content-header">
			<div id="breadcrumb">
				<a href="<c:url value="/back"/>" title="主页"
					class="tip-bottom"> <i class="icon-home"></i>主页
				</a> <a title="订单信息" class="tip-bottom">订单信息</a>
			</div>
		</div>
		<!--End-breadcrumbs-->
		<!-- Tabs Container-->
		<section id="tabsContainer" class="clearfix">
			<!--Inner-->
			<div id="innerBg">

				<!--About Tab-->
				<article id="about" class="clearfix">
					<form action="<c:url value="${formAction}"/>"
						method="post">
						<input type="hidden" value="${order.id }" name="id" id="id" readonly="readonly" />
						<c:if test="${errors!=null }">
							<c:forEach items="${errors }" var="error">
							<span id="span" style="color: red;">${error.defaultMessage }</span><br/>
						</c:forEach>
						</c:if>
						<!-- Introduction -->
						<section  class="clearfix">
							<h1>订单信息</h1>
							<div >
							<span >房屋&nbsp; 编号：</span>
							<input type="text" value="${order.hid }" name="hid" readonly="readonly"/>
							<span >房屋&nbsp; 地址：</span>
							<input type="text" name="village" value="${order.village }" readonly="readonly"/>
							<span >成交&nbsp; 价格：</span>
							<input type="text" name="realprice" value="${order.realprice }" readonly="readonly"/>
							<br/>
							
							<span >用户&nbsp; 编号：</span>
							<input type="text" name="uid" value="${order.uid }" readonly="readonly"/>
							<span >用户&nbsp; 手机：</span>
							<input type="text" name="phone" value="${order.phone }" readonly="readonly"/>
							<span >用户&nbsp; 姓名：</span>
							<input type="text" name="nickname" value="${order.nickname }" readonly="readonly"/>
							<br/>
							
							<span >经纪人编号：</span>
							<input type="text" name="aid" value="${order.aid }" readonly="readonly"/>
							<span >经纪人手机：</span>
							<input type="text" name="aphone" value="${order.aphone }" readonly="readonly"/>
							<span >经纪人姓名：</span>
							<input type="text" name="anickname" value="${order.anickname }" readonly="readonly"/>
							
							<br/><br/>

							</div>
							
						</section>
						<section id="clearfix">
							<input type="submit" value="保存" id="submit" disabled="disabled"/> 
							<input type="reset" onclick="window.history.go(-1)" value="取消">
						</section>
					</form>
				</article>
			</div>
			<!--End Inner-->
		</section>


	</div>
	<!--==================================================================================================================-->
	<jsp:include page="../main_bottom.jsp"></jsp:include>
	<!--End Page Wrapper-->
</body>

</html>