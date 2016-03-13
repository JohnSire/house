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
	
		<div style="height: 100px;margin-top: 40px;padding: 30px 15px 15px 35px;border: 1px solid #DDDDDD;">
			<!--搜索栏-->
			<form action="<c:url value="/house/findList"/>"
				method="post">
				<div >
					<span style="font-weight: bold;"></span>筛选：&nbsp;&nbsp;
					
					<select name ="xprice" >
						<option value="">售 &nbsp;价</option>
						<c:if test="${house.xprice eq 100}"><option value="100" selected="selected">100万</option></c:if>
						<c:if test="${house.xprice ne 100}"><option value="100" >100万</option></c:if>
						<c:if test="${house.xprice eq 150}"><option value="150" selected="selected">150万</option></c:if>
						<c:if test="${house.xprice ne 150}"><option value="150" >150万</option></c:if>
						<c:if test="${house.xprice eq 250}"><option value="250" selected="selected">250万</option></c:if>
						<c:if test="${house.xprice ne 250}"><option value="250" >250万</option></c:if>
						<c:if test="${house.xprice eq 300}"><option value="300" selected="selected">300万</option></c:if>
						<c:if test="${house.xprice ne 300}"><option value="300" >300万</option></c:if>
						<c:if test="${house.xprice eq 500}"><option value="500" selected="selected">500万</option></c:if>
						<c:if test="${house.xprice ne 500}"><option value="500" >500万</option></c:if>
						<c:if test="${house.xprice eq 1000}"><option value="1000" selected="selected">1000万以上</option></c:if>
						<c:if test="${house.xprice ne 1000}"><option value="1000" >1000万以上</option></c:if>
					</select>&nbsp;&nbsp;
					<select name ="acreage" >
						<option value="">面 &nbsp;积</option>
						<c:if test="${house.acreage eq 50}"><option value="50" selected="selected">50平</option></c:if>
						<c:if test="${house.acreage ne 50}"><option value="50">50平</option></c:if>
						<c:if test="${house.acreage eq 70}"><option value="70" selected="selected">70平</option></c:if>
						<c:if test="${house.acreage ne 70}"><option value="70">70平</option></c:if>
						<c:if test="${house.acreage eq 90}"><option value="90" selected="selected">90平</option></c:if>
						<c:if test="${house.acreage ne 90}"><option value="90">90平</option></c:if>
						<c:if test="${house.acreage eq 110}"><option value="110" selected="selected">110平</option></c:if>
						<c:if test="${house.acreage ne 110}"><option value="110">110平</option></c:if>
						<c:if test="${house.acreage eq 130}"><option value="130" selected="selected">130平</option></c:if>
						<c:if test="${house.acreage ne 130}"><option value="130">130平</option></c:if>
						<c:if test="${house.acreage eq 150}"><option value="150" selected="selected">150平以上</option></c:if>
						<c:if test="${house.acreage ne 150}"><option value="150">150平以上</option></c:if>
					</select>&nbsp;&nbsp;
					<select name ="hand" >
						<option value="">新 &nbsp;旧</option>
						<c:if test="${house.hand eq 1}"><option value="1" selected="selected">新房</option></c:if>
						<c:if test="${house.hand ne 1}"><option value="1">新房</option></c:if>
						<c:if test="${house.hand eq 2}"><option value="2" selected="selected">二手</option></c:if>
						<c:if test="${house.hand ne 2}"><option value="2">二手</option></c:if>
					</select>&nbsp;&nbsp;
					<select name ="type" >
						<option value="">房 &nbsp;型</option>
						<c:if test="${house.type eq 1}"><option value="1" selected="selected">1室</option></c:if>
						<c:if test="${house.type ne 1}"><option value="1">1室</option></c:if>
						<c:if test="${house.type eq 2}"><option value="2" selected="selected">2室</option></c:if>
						<c:if test="${house.type ne 2}"><option value="2">2室</option></c:if>
						<c:if test="${house.type eq 3}"><option value="3" selected="selected">3室</option></c:if>
						<c:if test="${house.type ne 3}"><option value="3">3室</option></c:if>
						<c:if test="${house.type eq 4}"><option value="4" selected="selected">4室</option></c:if>
						<c:if test="${house.type ne 4}"><option value="4">4室</option></c:if>
						<c:if test="${house.type eq 5}"><option value="5" selected="selected">5室以上</option></c:if>
						<c:if test="${house.type ne 5}"><option value="5">5室以上</option></c:if>
					</select>&nbsp;&nbsp;
					<select name ="orientation" >
						<option value="">朝 &nbsp;向</option>
						<c:if test="${house.orientation eq '东'}"><option value="东" selected="selected">东</option></c:if>
						<c:if test="${house.orientation ne '东'}"><option value="东">东</option></c:if>
						<c:if test="${house.orientation eq '南'}"><option value="南" selected="selected">南</option></c:if>
						<c:if test="${house.orientation ne '南'}"><option value="南">南</option></c:if>
						<c:if test="${house.orientation eq '西'}"><option value="西" selected="selected">西</option></c:if>
						<c:if test="${house.orientation ne '西'}"><option value="西">西</option></c:if>
						<c:if test="${house.orientation eq '北'}"><option value="北" selected="selected">北</option></c:if>
						<c:if test="${house.orientation ne '北'}"><option value="北">北</option></c:if>
						<c:if test="${house.orientation eq '南北'}"><option value="南北" selected="selected">南北</option></c:if>
						<c:if test="${house.orientation ne '南北'}"><option value="南北">南北</option></c:if>
					</select>&nbsp;&nbsp;
					<select name ="age" >
						<option value="">年 &nbsp;份</option>
						<c:if test="${house.age eq 1}"><option value="1" selected="selected">5年以内</option></c:if>
						<c:if test="${house.age ne 1}"><option value="1">5年以内</option></c:if>
						<c:if test="${house.age eq 2}"><option value="2" selected="selected">5 - 10年</option></c:if>
						<c:if test="${house.age ne 2}"><option value="2">5 - 10年</option></c:if>
						<c:if test="${house.age eq 3}"><option value="3" selected="selected">10 - 15年</option></c:if>
						<c:if test="${house.age ne 3}"><option value="3">10 - 15年</option></c:if>
						<c:if test="${house.age eq 4}"><option value="4" selected="selected">20 年以上</option></c:if>
						<c:if test="${house.age ne 4}"><option value="4">20 年以上</option></c:if>
					</select>&nbsp;&nbsp;
					<select name ="floor" >
						<option value="">楼 &nbsp;层</option>
						<c:if test="${house.floor eq 1}"><option value="1" selected="selected">低楼层(8层以下)</option></c:if>
						<c:if test="${house.floor ne 1}"><option value="1">低楼层(8层以下)</option></c:if>
						<c:if test="${house.floor eq 2}"><option value="2" selected="selected">中楼层(8-15层)</option></c:if>
						<c:if test="${house.floor ne 2}"><option value="2">中楼层(8-15层)</option></c:if>
						<c:if test="${house.floor eq 3}"><option value="3" selected="selected">高楼层(15层以上)</option></c:if>
						<c:if test="${house.floor ne 3}"><option value="3">高楼层(15层以上)</option></c:if>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
					
					<button class="btn btn-info" type="submit">查找</button>
				</div>
			</form>
		</div>
	
	
		<div style="margin-top: 40px;">
			<table>
				<thead>
					<tr class="mBLightGray" style="height:35px ;">
						<th style="width: 240px;">图片</th>
						<th style="width: 720px;">介绍</th>
						<th style="width: 240px;">价格</th>
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