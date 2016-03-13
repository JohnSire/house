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
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /><!-- 百度地图 -->
<title>PEAK_房屋详情</title>
<!-- 百度地图 -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=UzU35G0DDR2wTBwiOqdKNySV"></script>
</head>
<body>
	<jsp:include page="../foreground/fragment/head.jsp"></jsp:include>
	
	<div class="content" style="padding: 30px 50px 30px 50px ">
		
		<div style="margin-top: 20px;">
				<span class="mGreen" style="font-size: 22px;font-weight: bold;" id = "title">${house.title }</span>
		</div>
		<div style="margin-top: 25px;">
			<div style="float: left;">
				<img alt="" class="mBGray" width="280px" height="250px" src='<c:url value="${house.image }"/>' />
			</div>
			<div style="float: left;margin-left: 20px;">
				<label >售价:</label>
				<label class="mRed" style="font-size: 18px;">${house.price }</label> 万 / ${house.acreage } ㎡ <br/>
				<label >单价: </label>&nbsp;${house.unitprice } 万/平米  <br/>
				<label >首付: </label>&nbsp;${house.downpay }  万 <br/>
				<label >月供: </label>&nbsp;${house.monthpay } 万 <br/>
				<label >户型: </label>&nbsp;${house.type }室 <br/>
				<label >朝向: </label>&nbsp;${house.orientation }  <br/>
				<label >楼层: </label>&nbsp;${house.floor }层  <br/>
				<label >小区: </label>&nbsp;<span id = "village">${house.village }</span>
				
			</div>
			<div style="float: right;">
				<label style="font-size: 18px;" ><a id="addAttention">添加关注</a></label><br><br>
				<label>经济人：</label>
				<label style="font-size: 18px;" class="mRed"> ${house.nickname } </label><br/>
				<label >电 &nbsp; &nbsp;话：</label>
				<label style="font-size: 18px;"  class="mRed">${house.phone }</label>
			</div>
		</div>
		
		<div style="margin-top: 30px; float: left; width: 1200px;">
			<label >房源介绍: </label>
			<div style="padding: 5px;width: 800px;" >${house.content }</div>
		</div>
		<input type="hidden" value="${sessionScope.user.id }" id = "uid"/>
		<input type="hidden" value="${house.sid }" id ="sid"/>
		<div id="allmap" style="width: 800px;height: 500px;margin: 50px 0px 100px 0px;float: left;"></div>
		
	</div>
	
</body>
<script type="text/javascript" src='<c:url value="/js/jquery.min.js"></c:url>'></script>

<script type="text/javascript">
$("#addAttention").click(function(){
	var uid = $("#uid").val();
	var sid = $("#sid").val();
	
	if(uid == null || uid ==""){
		alert("请先登录！");
		window.location.href = "/house/user/login"
		return ;
	}
	$.ajax({
		type:'post',
		url:'/house/user/addAttention',
		dataType:'json',
		data:{uid: uid,sid:sid},
		success:function(data){
			alert(data.message);
		}
	});
	
});

</script>

<script type="text/javascript">
	//房子信息
	var village = $("#village").text();
	var title = $("#title").text();
	

  // 百度地图API功能
  var map = new BMap.Map("allmap");
  map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
  // 添加带有定位的导航控件
  var navigationControl = new BMap.NavigationControl({
    // 靠左上角位置
    anchor: BMAP_ANCHOR_TOP_LEFT,
    // LARGE类型
    type: BMAP_NAVIGATION_CONTROL_LARGE,
    // 启用显示定位
    enableGeolocation: true
  });
  map.addControl(navigationControl);
  // 添加定位控件
  var geolocationControl = new BMap.GeolocationControl();
  geolocationControl.addEventListener("locationSuccess", function(e){
    // 定位成功事件
    var address = '';
    address += e.addressComponent.province;
    address += e.addressComponent.city;
    address += e.addressComponent.district;
    address += e.addressComponent.street;
    address += e.addressComponent.streetNumber;
    alert("当前定位地址为：" + address);
  });
  geolocationControl.addEventListener("locationError",function(e){
    // 定位失败事件
    alert(e.message);
  });
  map.addControl(geolocationControl);
  
	// 创建地址解析器实例
	var myGeo = new BMap.Geocoder();
	// 将地址解析结果显示在地图上,并调整地图视野
	myGeo.getPoint(village, function(point){
		if (point) {
			map.centerAndZoom(point, 16);
			var marker = new BMap.Marker(point);  // 创建标注
			map.addOverlay(marker);               // 将标注添加到地图中
			marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			
			var opts = {
			  width : 200,     // 信息窗口宽度
			  height: 100,     // 信息窗口高度
			  title : title , // 信息窗口标题
			  enableMessage:true,//设置允许信息窗发送短息
			  message:"亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
			}
			var infoWindow = new BMap.InfoWindow("地址："+village, opts);  // 创建信息窗口对象 
			marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,point); //开启信息窗口
			});
			var local = new BMap.LocalSearch(map, {
				  renderOptions:{map: map, autoViewport:true}
				});
			local.searchNearby("房子", village);
		}else{
			alert("您选择地址没有解析到结果!");
		}
	}, "北京市");
  
</script>


</html>