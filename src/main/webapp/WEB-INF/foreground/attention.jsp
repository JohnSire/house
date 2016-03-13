<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PEAK_房屋</title>
</head>
<body>
	<jsp:include page="../foreground/fragment/head.jsp"></jsp:include>
	
	<div class="content">
	
	
		<div style="margin-top: 40px;">
			<h1>我的关注</h1>
			<table>
				<thead>
					<tr class="mBLightGray" style="height:35px ;">
						<th style="width: 240px;">图片</th>
						<th style="width: 620px;">介绍</th>
						<th style="width: 240px;">价格</th>
						<th style="width: 100px;">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dataGridResultInfo.list }" var="item">
					<tr style="padding: 15px 15px 15px 15px;font-size:12px;
											border-bottom: 1px solid #DDDDDD" height="180px">
						<th>
							<img class="mBGray" width="160px" height="130px" src='<c:url value="${item.image }"/>'/>
						</th>
						<th style="text-align: left;">
							<a style="font-size: 20px;font-weight: bold;" href='<c:url value="/house/detail/${item.sid}" />'> ${item.title}</a><br /><br /> 
							<span style="font-weight: bold;">${item.village}&nbsp; ${item.type}室&nbsp; 
							<c:if test="${item.hand eq 1}"><a class="mGreen">新房&nbsp;</a></c:if> 
							<c:if test="${item.hand eq 2}"><a class="mYellow">二手房&nbsp;</a></c:if> 
							${item.orientation}
							</span><br /><br />
							${item.nickname}&nbsp; ${item.phone}
						</th>
						<th>
							<span style="font-size: 20px;font-weight: bold;" class="mRed">${item.price} 万</span><br/><br/>
							${item.unitprice} 万元/m²
						</th>
						<th>
							<span style="font-size: 20px;font-weight: bold;" class="mGreen">
							<a href='<c:url value="/user/cancleAttention?id=${item.atid}"/>'>取消关注</a>
							</span>
						</th>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div style="float: right; margin-top: 40px;margin-bottom: 100px;">
			共 ${dataGridResultInfo.total } 页   &nbsp;  第${dataGridResultInfo.pageNum } 页    &nbsp; 
			<c:if test="${dataGridResultInfo.pageNum ne 1 }">
				<button >
					<a href="<c:url value="/house/findList?pageNum=${dataGridResultInfo.pageNum-1 }"/>">上一页</a>
				</button>
			</c:if>
			<c:if test="${dataGridResultInfo.pageNum ne dataGridResultInfo.total }">
				<button >
					<a href="<c:url value="/house/findList?pageNum=${dataGridResultInfo.pageNum+1 }"/>">下一页</a>
				</button>
			</c:if>
		</div>
	
	</div>

</body>
</html>