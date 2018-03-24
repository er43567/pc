<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<link rel="stylesheet" type="text/css" href="../css/aui.css" />
		<link rel="stylesheet" type="text/css" href="../css/aui-pull-refresh.css" />
		
		<style type="text/css">
		  .float-img{background-color:white;position: fixed;top: 78%;left: 78%;z-index: 999;border-radius: 25px;box-shadow:5px 2px 6px #000;}
		  .float-img:ACTIVE {box-shadow:2px 1px 3px #000;top: 78.1%;left: 78.1%;}
		  </style>
		  <script type="text/javascript" src="js/ext.js"></script>
	</head>
	<body>
		<!-- <header class="aui-bar aui-bar-nav" id="header" style="padding-top:15px; position:fixed;">
		<div class="aui-pull-left aui-padded-l-0">
			<a class=" aui-btn aui-iconfont aui-icon-left" tapmode onclick="closeWin();">返回</a>
		</div>
		<div style="font-weight:bold;" class="aui-title">
			<font size="+1">推送列表</font>
		</div>
		<div class="aui-pull-right">
		</div>
	</header> -->
		<section id='pullrefresh' class="aui-refresh-content">
			<div class="aui-content">
				<div id="demo">
			        <div class="aui-card-list">
			            <div class="aui-card-list-header">
			                卡片布局头部区域
			            </div>
			            <div class="aui-card-list-content-padded">
			                内容区域，卡片列表布局样式可以实现APP中常见的各类样式
			            </div>
			            <div class="aui-card-list-footer">
			                底部区域
			            </div>
			        </div>
			        <div class="aui-card-list">
			            <div class="aui-card-list-header">
			                卡片布局头部区域
			            </div>
			            <div class="aui-card-list-content-padded">
			                内容区域，卡片列表布局样式可以实现APP中常见的各类样式
			            </div>
			            <div class="aui-card-list-footer">
			                底部区域
			            </div>
			        </div>
			        <div class="aui-card-list">
			            <div class="aui-card-list-header">
			                卡片布局头部区域
			            </div>
			            <div class="aui-card-list-content-padded">
			                内容区域，卡片列表布局样式可以实现APP中常见的各类样式
			            </div>
			            <div class="aui-card-list-footer">
			                底部区域
			            </div>
			        </div>
			        <div class="aui-card-list">
			            <div class="aui-card-list-header">
			                卡片布局头部区域
			            </div>
			            <div class="aui-card-list-content-padded">
			                内容区域，卡片列表布局样式可以实现APP中常见的各类样式
			            </div>
			            <div class="aui-card-list-footer">
			                底部区域
			            </div>
			        </div>
			        <div class="aui-card-list">
			            <div class="aui-card-list-header">
			                卡片布局头部区域
			            </div>
			            <div class="aui-card-list-content-padded">
			                内容区域，卡片列表布局样式可以实现APP中常见的各类样式
			            </div>
			            <div class="aui-card-list-footer">
			                底部区域
			            </div>
			        </div>
			        <div class="aui-card-list">
			            <div class="aui-card-list-header">
			                卡片布局头部区域
			            </div>
			            <div class="aui-card-list-content-padded">
			                内容区域，卡片列表布局样式可以实现APP中常见的各类样式
			            </div>
			            <div class="aui-card-list-footer">
			                底部区域
			            </div>
			        </div>
			        <div class="aui-card-list">
			            <div class="aui-card-list-header">
			                卡片布局头部区域
			            </div>
			            <div class="aui-card-list-content-padded">
			                内容区域，卡片列表布局样式可以实现APP中常见的各类样式
			            </div>
			            <div class="aui-card-list-footer">
			                底部区域
			            </div>
			        </div>
		        </div>
	        </div>
	    </section>
	    <img id="float-btn" class="float-img" src="images/加号.png" width="50" height="50" onclick="startUrl('addTask.jsp',['notitle', 'refresh', 'gesture'])"/>
	</body>
	
	<script src="../script/api.js"></script>
	<script src="../script/aui-pull-refresh.js"></script>
	<script type="text/javascript">
		var pullRefresh = new auiPullToRefresh({
			container: document.querySelector('.aui-refresh-content'),
			triggerDistance: 150
		},function(ret){
			if(ret.status=="success"){
				setTimeout(function(){
					var wrap = document.getElementById("demo");
					var lis = wrap.querySelectorAll('.aui-card-list');
					for (var i = lis.length, length = i + 10; i < length; i++) {
						var html = '<div class="aui-card-list">'+
					            '<div class="aui-card-list-header">'+
					                '卡片布局头部区域'+(i+1)+''+
					            '</div>'+
					            '<div class="aui-card-list-content-padded">'+
					                '内容区域，卡片列表布局样式可以实现APP中常见的各类样式'+
					            '</div>'+
					            '<div class="aui-card-list-footer">'+
					                '底部区域'+
					            '</div>'+
					        '</div>';
						wrap.insertAdjacentHTML('afterbegin', html);
					}
					pullRefresh.cancelLoading(); //刷新成功后调用此方法隐藏
				},1500);
			}
		})
	</script>
	
	<script type="text/javascript">
	function onActivityResult(result) {
		location.reload();
	}
	</script>
</html>
