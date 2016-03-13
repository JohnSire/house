<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<title>房屋列表</title>

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
					class="tip-bottom"><i class="icon-home"></i>主页</a> <a title="房屋列表"
					class="tip-bottom">房屋列表</a>
			</div>
		</div>
		<!--End-breadcrumbs-->

		<!-- Page table -->
		<div class="container" style="width: 1000px;">
			<!-- &lt;!&ndash; Marketing Icons Section &ndash;&gt;-->

			<div class="col-lg-12">
				<h2 class="page-header"
					style="text-align: center; font-family: '微软雅黑', Verdana, sans-serif, '宋体', serif;">
					房屋列表显示</h2>
			</div>

			<!--搜索栏-->
			<form action="<c:url value="/back/house/findList"/>"
				method="post">
				<div >
					<span >编号：</span>
					<input type="text" name="id" value="${house.id}"/>
					<span >地址：</span>
					<input type="text" name="village" value="${house.village }"/>
					<span >面积：</span>
					<input type="text" name="acreage" value="${house.acreage }"/>
					<br/>
					<span >户型：</span>
					<input type="text" name="type" value="${house.type }" placeholder="3室.."/>
					<span >售价：</span>
					<input type="text" name="xprice" value="${house.xprice }"/><span >  ——— </span>
					<input type="text" name="pricex" value="${house.pricex }"/>
					<br/>
					<span >朝向：</span>
					<input type="text" name="orientation" value="${house.orientation }" placeholder="东 南 西 北"/>
					
					<span >新旧：</span>
					<select name ="hand">
						<option value="0">请选择</option>
						<option value="1">新房</option>
						<option value="2">二手</option>
					</select>

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
						<th>地址</th>
						<th>新旧</th>
						<th>售价(万)</th>
						<th>面积(m2)</th>
						<th>房型</th>
						<th>朝向</th>
						<th>楼层</th>
						<th>省</th>
						<th>市</th>
						<th>区</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dataGridResultInfo.list }" var="item">
						<tr>
							<td style="text-align: center;"><input type="checkbox" value="${item.id}"></td>
							<td>${item.id }</td>
							<td>${item.village }</td>
							<td>
								<c:if test="${item.hand eq 1}"><span class="btn-primary" style="padding: 5px">新房</span></c:if>
								<c:if test="${item.hand eq 2}"><span class="btn-warning" style="padding: 5px">二手</span></c:if>
							</td>
							<td>${item.price }</td>
							<td>${item.acreage }</td>
							<td>${item.type }室</td>
							<td>${item.orientation }</td>
							<td>${item.floor }</td>
							
							<td>${item.province }</td>
							<td>${item.city }</td>
							<td>${item.district }</td>
							<td><a
								href="<c:url value="/back/house/updateForm?id=${item.id }"/>">查看</a></td>
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
								href="<c:url value="/back/house/findList?
								pageNum=${dataGridResultInfo.pageNum-1 }"/>
							">上一页</a></li>
						</c:if>

						<c:if test="${dataGridResultInfo.pageNum ne dataGridResultInfo.total }">
							<li><a
								href="<c:url value="/back/house/findList?
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
