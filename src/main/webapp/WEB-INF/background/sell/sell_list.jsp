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


<title>售房列表</title>

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
					class="tip-bottom"><i class="icon-home"></i>主页</a> <a title="售房列表"
					class="tip-bottom">售房列表</a>
			</div>
		</div>
		<!--End-breadcrumbs-->

		<!-- Page table -->
		<div class="container" style="width: 1000px;">
			<!-- &lt;!&ndash; Marketing Icons Section &ndash;&gt;-->

			<div class="col-lg-12">
				<h2 class="page-header"
					style="text-align: center; font-family: '微软雅黑', Verdana, sans-serif, '宋体', serif;">
					售房列表显示</h2>
			</div>

			<!--搜索栏-->
			<form action="<c:url value="/back/sell/findList"/>"
				method="post">
				<div >
					<span >编号：</span>
					<input type="text" name="id" value="${sell.id}"/>
					<span >标 &nbsp;题：</span>
					<input type="text" name="title" value="${sell.title }"/>
					<span >内容：</span>
					<input type="text" name="content" value="${sell.content }"/>
					<br/>
					<span >房源：</span>
					<input type="text" name="hid" value="${sell.hid}"/>
					<span >经纪人：</span>
					<input type="text" name="aid" value="${sell.aid }"/>
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
						<th>标题</th>
						<th>内容</th>
						<th>发布时间</th>
						<th>房源</th>
						<th>经纪人</th>
						<th>经纪人姓名</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dataGridResultInfo.list }" var="item">
						<tr>
							<td style="text-align: center;"><input type="checkbox" value="${item.id}"></td>
							<td>${item.id }</td>
							<td style="width:100px;">${item.title }</td>
							<td style="width: 400px">${item.content }</td>
							<td>
								<fmt:formatDate value="${item.addtime }" pattern="yyyy-MM-dd HH:MM:ss"	type="both" />
							</td>
							<td>${item.hid }</td>
							<td>${item.aid }</td>
							<td>${item.agent }</td>
							<td><a
								href="<c:url value="/back/sell/updateForm?id=${item.id }"/>">查看</a></td>
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
								href="<c:url value="/back/sell/findList?
								pageNum=${dataGridResultInfo.pageNum-1 }"/>
							">上一页</a></li>
						</c:if>

						<c:if test="${dataGridResultInfo.pageNum ne dataGridResultInfo.total }">
							<li><a
								href="<c:url value="/back/sell/findList?
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
