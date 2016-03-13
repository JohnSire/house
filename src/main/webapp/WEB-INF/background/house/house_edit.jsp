<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta charset="UTF-8" />
<title>房屋信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
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
				</a> <a title="房屋信息" class="tip-bottom">房屋信息</a>
			</div>
		</div>
		<!--End-breadcrumbs-->
		<!-- Tabs Container-->
		<section id="tabsContainer" class="clearfix">
			<!--Inner-->
			<div id="innerBg">

				<!--About Tab-->
				<article id="about" class="clearfix">
					<form action="<c:url value="${formAction}"  />"
						enctype="multipart/form-data"
						method="post">
						<input type="hidden" value="${house.id }" name="id" id="id">
						<c:if test="${errors!=null }">
							<c:forEach items="${errors }" var="error">
							<span id="span" style="color: red;">${error.defaultMessage }</span><br/>
						</c:forEach>
						</c:if>
						<!-- Introduction -->
						<section  class="clearfix">
							<h1>房屋信息</h1>
							<div >
							<input type="hidden" name="id" value="${house.id}"/>
							<span >地址：</span>
							<input type="text" name="village" value="${house.village }"/>
							<span >售价：</span>
							<input type="text" name="price" value="${house.price }"/>
							<span >面积：</span>
							<input type="text" name="acreage" value="${house.acreage }"/>
							<input type="hidden" name="unitprice" value="${house.price / house.acreage}"/>
							<br/>
							<span >户型：</span>
							<input type="text" name="type" value="${house.type }" placeholder="3室.."/>
							<span >新旧：</span>
							<select name ="hand">
								<option value="0">请选择</option>
								<c:if test="${house.hand eq 1 }"><option value="1" selected="selected">新房</option></c:if>
								<c:if test="${house.hand ne 1 }"><option value="1" >新房</option></c:if>
								<c:if test="${house.hand eq 2 }"><option value="2" selected="selected">二手</option></c:if>
								<c:if test="${house.hand ne 2 }"><option value="2" >二手</option></c:if>
							</select>
							<span >朝向：</span>
							<input type="text" name="orientation" value="${house.orientation }" placeholder="东 南 西 北"/>
							<br/>
							<span >楼龄：</span>
							<input type="text" name="age" value="${house.age }" placeholder="..年"/>
							<span >楼层：</span>
							<input type="text" name="floor" value="${house.floor }" placeholder="..层"/>
							
							<br/>
							<span >首付：</span>
							<input type="text" name="downpay" value="${house.downpay }" />
							<span >月数：</span>
							<input type="text" name="month" value="${house.month }" />
							<span >月供：</span>
							<input type="text" name="monthpay" value="${house.monthpay }" />
							
							<br/>
							<span >省级：</span>
							<select id="provinceCode" >
								<option value="">请选择</option>
								<c:if test="${house.provinceCode ne null }">
									<option value="${house.provinceCode }" selected="selected">${house.province }</option>
								</c:if>
							</select>
							<span >市级：</span>
							<select id="cityCode" >
								<option value="">请选择</option>
								<c:if test="${house.cityCode ne null }">
									<option value="${house.cityCode }" selected="selected">${house.city }</option>
								</c:if>
							</select>
							<span >区级：</span>
							<select id="districtCode" name="areaid">
								<option value="">请选择</option>
								<c:if test="${house.areaid ne null }">
									<option value="${house.districtCode }" selected="selected">${house.district }</option>
								</c:if>
							</select>
							<br/>
							<span >图片：</span>
							<input type="file" name="pictureFile" /><br/>
							<input type="hidden" name="image" value="${house.image}"/>
							<c:if test="${house.image ne null && house.image ne ''}">
                   				<img alt="" src='<c:url value="${house.image }"/>' style="width: 120px;height: 120px;background-color: gray;">
							</c:if>
							<br/><br/>

							</div>
							
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
<script type="text/javascript" src="<c:url value="/js/jquery.min.js"/>"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value="/js/script_user.js"/>"></script>
<script type="text/javascript">
// 页面dom加载完成后执行
$(function() {
	//异步请求获取省
	$.ajax({
		type:'post',
		url:"/house/back/house/findProvince",
		dataType:'json',
		success:function(data){
			var select = $("#provinceCode option:selected ").val();
			 //解析数组
	        $.each(data.list, function(i, item) {
	        	if(select != item.provincecode){
	            	$("#provinceCode").append("<option value='"+item.provincecode+"'>"+item.provincename+"</option>"); 
	        	}
	        });
		}
	});
});

//省份->城市
$("#provinceCode").change(function(){
    //清空城市下拉框中的内容，除提示信息外
    $("#cityCode option:gt(0)").remove();
    $("#districtCode option:gt(0)").remove();
    
    var provinceCode = $("#provinceCode option:selected").val();
    if(provinceCode == ''){
    	return ;
    }
    
    //异步请求获取市
		$.ajax({
			type:'post',
			url:"/house/back/house/findCity",
			dataType:'json',
			data:{provinceCode: provinceCode},
			success:function(data){
				var select = $("#cityCode option:selected ").val();
				 //解析数组
		        $.each(data.list, function(i, item) {
		        	if(select != item.citycode){
		            	$("#cityCode").append("<option value='"+item.citycode+"'>"+item.cityname+"</option>"); 
		        	}
		        });
			}
		});
   
});
//城市->区域
$("#cityCode").change(function(){
    $("#districtCode option:gt(0)").remove();
    
   var cityCode = $("#cityCode option:selected").val();
    if(cityCode == ''){
    	return ;
    }
    
    //异步请求获取区
		$.ajax({
			type:'post',
			url:"/house/back/house/findDistrict",
			dataType:'json',
			data:{cityCode: cityCode},
			success:function(data){
				var select = $("#districtCode option:selected ").val();
				 //解析数组
		        $.each(data.list, function(i, item) {
		        	if(select != item.citycode){
		            	$("#districtCode").append("<option value='"+item.districtcode+"'>"+item.districtname+"</option>"); 
		        	}
		        });
			}
		});
});


</script>

</html>