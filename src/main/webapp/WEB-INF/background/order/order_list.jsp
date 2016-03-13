<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>订单列表</title>

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/css/bootstrap-combined.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/css/modern.css"/>" rel="stylesheet">
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
					class="tip-bottom"><i class="icon-home"></i>主页</a> <a title="订单列表"
					class="tip-bottom">订单列表</a>
			</div>
		</div>
		<!--End-breadcrumbs-->

		<!-- Page table -->
		<div class="container" style="width: 1000px;">
			<!-- &lt;!&ndash; Marketing Icons Section &ndash;&gt;-->

			<div class="col-lg-12">
				<h2 class="page-header"
					style="text-align: center; font-family: '微软雅黑', Verdana, sans-serif, '宋体', serif;">
					订单列表显示</h2>
			</div>

			<!--搜索栏-->
			<form action="<c:url value="/back/order/findList"/>"
				method="post">
				<div >
					<span >订单&nbsp; 编号：</span>
					<input type="text" name="id" value="${order.id}"/>
					<span >房源&nbsp; 编号：</span>
					<input type="text" name="hid" value="${order.hid}"/>
					<span >房源&nbsp; 小区：</span>
					<input type="text" name="village" value="${order.village}"/>
					<br/>
					<span >用户&nbsp; 编号：</span>
					<input type="text" name="uid" value="${order.uid }"/>
					<span >用户&nbsp; 手机：</span>
					<input type="text" name="phone" value="${order.phone }"/>
					<span >用户&nbsp; 姓名：</span>
					<input type="text" name="nickname" value="${order.nickname }"/>
					<br/>
					<span >经纪人编号：</span>
					<input type="text" name="aid" value="${order.aid }"/>
					<span >经纪人手机：</span>
					<input type="text" name="aphone" value="${order.aphone }"/>
					<span >经纪人姓名：</span>
					<input type="text" name="anickname" value="${order.anickname }"/>
					
				</div>
				<div >
					<button class="btn btn-info" type="submit">查找</button>
					<button class="btn btn-success" type="button" id="deleteButton">删除</button>
				</div>
			</form>
			
			<!--表格显示-->
			<table class="table table-bordered" style="margin-top: 20px">
				<thead>
					<tr>
						<th><input type="checkbox" id="selectAllButton"></th>
						<th>编号</th>
						<th>房源</th>
						<th>小区</th>
						<th>成交价格</th>
						<th>用户手机</th>
						<th>用户姓名</th>
						<th>经纪人手机</th>
						<th>经纪人姓名</th>
						<th>时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dataGridResultInfo.list }" var="item">
						<tr>
							<td style="text-align: center;"><input type="checkbox" value="${item.id}"></td>
							<td>${item.id }</td>
							<td>${item.hid }</td>
							<td>${item.village }</td>
							<td>${item.realprice }</td>
							
							<td>${item.phone }</td>
							<td>${item.nickname }</td>
							<td>${item.aphone }</td>
							<td>${item.anickname }</td>
							<td>
								<fmt:formatDate value="${item.addtime }" pattern="yyyy-MM-dd HH:MM:ss"	type="both" />
							</td>
							<td><a
								href="<c:url value="/back/order/updateForm?id=${item.id }"/>">查看</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!--分页条-->
			<div style="text-align: right">
				<div class="pagination">
					<ul>
						<li><a>共${dataGridResultInfo.total }页</a></li>
						<li><a>第${dataGridResultInfo.pageNum }页</a></li>
						<c:if test="${dataGridResultInfo.pageNum ne 1 }">
							<li><a
								href="<c:url value="/back/order/findList?
								pageNum=${dataGridResultInfo.pageNum-1 }"/>
							">上一页</a></li>
						</c:if>

						<c:if test="${dataGridResultInfo.pageNum ne dataGridResultInfo.total }">
							<li><a
								href="<c:url value="/back/order/findList?
								pageNum=${dataGridResultInfo.pageNum+1 }"/>
							">下一页</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--==================================================================================================================-->
	<jsp:include page="../main_bottom.jsp"></jsp:include>
</body>

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<!-- custom base.js -->
<script type="text/javascript"src="<c:url value="/js/custom/base.js"/>"></script>




</html>
