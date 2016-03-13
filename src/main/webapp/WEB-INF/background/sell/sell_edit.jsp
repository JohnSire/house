<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>售房信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<c:url value="/js/jquery.min.js"/>"></script>
<script type="text/javascript" charset="utf-8"
	src="<c:url value="/js/script_sell.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/info_main.css"/>" />

<style type="text/css">

ul li input{
	width: 500px;
}
ul li textarea{
	width: 500px;
}

</style>

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
				</a> <a title="售房信息" class="tip-bottom">售房信息</a>
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
						<input type="hidden" value="${sell.id }" name="id" id="id">
						
						<c:if test="${errors!=null }">
							<c:forEach items="${errors }" var="error">
							<span id="span" style="color: red;">${error.defaultMessage }</span><br/>
						</c:forEach>
						</c:if>
						<!-- Introduction -->
						<section  class="clearfix">
							<h1>售房信息</h1>
							<ul class="info" ">
								
								<li><span>标  &nbsp;题  </span> :
									<input type="text" value="${sell.title }" name="title" 
									id="title"> <span id="span" style="color: red;">*</span>
								</li>
								
								<li ><span>房  &nbsp;源</span> :
									<input type="tel" value="${sell.hid}" name="hid">
									<span id="span" style="color: red;">*</span>
								</li>
								
								<li ><span>经纪人</span> :
									<input type="tel" value="${sell.aid}" name="aid">
									<span id="span" style="color: red;">*</span>
								</li>
								<li><span>内 &nbsp;容</span> :
									<textarea rows="10" cols="1" name="content">${sell.content}</textarea>
									<span id="span" style="color: red;">*</span>
								</li>
								
							</ul>
							
						</section>
						<section id="clearfix">
							<input type="submit" value="保存" id="submit" /> 
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