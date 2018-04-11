<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>用户</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" type="text/css" href="../css/aui.css" />
<link rel="stylesheet" href="../css/mui.min.css">
<script type="text/javascript" src="../script/api.js"></script>
<script type="text/javascript" src="../script/aui-dialog.js"></script>
<script type="text/javascript" src="js/ext.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<style>
html,body {
}

.mui-views,.mui-view,.mui-pages,.mui-page,.mui-page-content {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	/* background-color: #efeff4; */
}

.mui-pages {
	top: 46px;
	height: auto;
}

.mui-scroll-wrapper,.mui-scroll {
	background-color: #efeff4;
}

.mui-page.mui-transitioning {
	-webkit-transition: -webkit-transform 300ms ease;
	transition: transform 300ms ease;
}

.mui-page-left {
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.mui-ios .mui-page-left {
	-webkit-transform: translate3d(-20%, 0, 0);
	transform: translate3d(-20%, 0, 0);
}

.mui-navbar {
	position: fixed;
	right: 0;
	left: 0;
	z-index: 10;
	height: 44px;
	background-color: #f7f7f8;
}

.mui-navbar .mui-bar {
	position: absolute;
	background: transparent;
	text-align: center;
}

.mui-android .mui-navbar-inner.mui-navbar-left {
	opacity: 0;
}

.mui-ios .mui-navbar-left .mui-left,.mui-ios .mui-navbar-left .mui-center,.mui-ios .mui-navbar-left .mui-right
	{
	opacity: 0;
}

.mui-navbar .mui-btn-nav {
	-webkit-transition: none;
	transition: none;
	-webkit-transition-duration: .0s;
	transition-duration: .0s;
}

.mui-navbar .mui-bar .mui-title {
	display: inline-block;
	width: auto;
}

.mui-page-shadow {
	position: absolute;
	right: 100%;
	top: 0;
	width: 16px;
	height: 100%;
	z-index: -1;
	content: '';
}

.mui-page-shadow {
	background: -webkit-linear-gradient(left, rgba(0, 0, 0, 0) 0,
		rgba(0, 0, 0, 0) 10%, rgba(0, 0, 0, .01) 50%, rgba(0, 0, 0, .2) 100%);
	background: linear-gradient(to right, rgba(0, 0, 0, 0) 0,
		rgba(0, 0, 0, 0) 10%, rgba(0, 0, 0, .01) 50%, rgba(0, 0, 0, .2) 100%);
}

.mui-navbar-inner.mui-transitioning,.mui-navbar-inner .mui-transitioning
	{
	-webkit-transition: opacity 300ms ease, -webkit-transform 300ms ease;
	transition: opacity 300ms ease, transform 300ms ease;
}

.mui-page {
	
}

.mui-pages .mui-page {
	display: block;
}

.mui-page .mui-table-view:first-child {
	margin-top: 15px;
}

.mui-page .mui-table-view:last-child {
	margin-bottom: 30px;
}

.mui-table-view {
	margin-top: 20px;
}

.mui-table-view span.mui-pull-right {
	color: #999;
}

.mui-table-view-divider {
	background-color: #efeff4;
	font-size: 14px;
}

.mui-table-view-divider:before,.mui-table-view-divider:after {
	height: 0;
}

.head {
	height: 40px;
}

#head {
	line-height: 40px;
}

.head-img {
	position: absolute;
	bottom: 10px;
	right: 40px;
	width: 40px;
	height: 40px;
}

#head-img1 {
	position: absolute;
	bottom: 10px;
	right: 40px;
	width: 40px;
	height: 40px;
}

.update {
	font-style: normal;
	color: #999999;
	margin-right: -25px;
	font-size: 15px
}

.mui-fullscreen {
	position: fixed;
	z-index: 20;
	background-color: #000;
}

.mui-ios .mui-navbar .mui-bar .mui-title {
	position: static;
}
/*问题反馈在setting页面单独的css*/
#feedback .mui-popover {
	position: fixed;
}

#feedback .mui-table-view:last-child {
	margin-bottom: 0px;
}

#feedback .mui-table-view:first-child {
	margin-top: 0px;
}

.mui-plus.mui-plus-stream .mui-stream-hidden {
	display: none !important;
}
.input-file {width: 100%;height: 100%;left:0px;top:0px;opacity:0;position: absolute;border: 1px solid}
/*问题反馈在setting页面单独的css==end*/
</style>
<link rel="stylesheet" type="text/css" href="../css/feedback.css" />
<script type="text/javascript">
 </script>
</head>
<body>
	<!--单页面结束-->
	<div id="account" class="mui-page">
		<!-- <div class="mui-navbar-inner mui-bar mui-bar-nav">
				<button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
					<span class="mui-icon mui-icon-left-nav"></span>设置
				</button>
				<h1 class="mui-center mui-title">账号与安全</h1>
			</div> -->
		<div class="mui-page-content">
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view">
						<li class="mui-table-view-cell" tapmode onclick="openDialog('head')">
							<a id="head" class="mui-navigate-right" href="#picture">
								头像 
								<span class="mui-pull-right head"> 
									<img class="head-img mui-action-preview" id="head-img" src="${session.user.headImg}" />
								</span>
							</a>
							<!-- <input id="file_input" accept="image/gif,image/jpeg,image/png,image/*" type="file"/>
							<div id="file_input_div" onclick="file_input.click()">阿斯蒂芬</div> -->
						</li>
						<input id="file_input" accept="image/gif,image/jpeg,image/png,image/*" 
							type="file" class="input-file"/>
		        		<!-- <div id="file_input_div"></div> -->
					</ul>

					<ul class="mui-table-view">
						<li class="mui-table-view-cell"><a>账号<span
								class="mui-pull-right">${session.user.userId}</span></a></li>
						<li class="mui-table-view-cell"><a>姓名<span
								class="mui-pull-right">${session.user.name}</span></a></li>
						<li class="mui-table-view-cell"><a>职位<span
								class="mui-pull-right">${session.user.position}</span></a></li>
						<li class="mui-table-view-cell"><a>所属<span
								class="mui-pull-right">${session.user.scope}</span></a></li>
					</ul>
					<ul class="mui-table-view">
						<li class="mui-table-view-cell" tapmode
							onclick="openDialog('phone')"><a>手机号<span id="phoneNum"
								class="mui-pull-right">${session.user.phone}</span></a></li>
						<li class="mui-table-view-cell" tapmode
							onclick="openDialog('password')"><a>修改密码<span
								class="mui-pull-right"></span></a></li>
					</ul>
					<ul class="mui-table-view" onclick="openDialog('clear')">
						<li class="mui-table-view-cell" tapmode ><a href="javascript:android.cleanAppCache();">清除应用缓存<span
							class="mui-pull-right"></span></a></li>
					</ul>
					<ul class="mui-table-view" onclick="openDialog('logout')">
						<li class="mui-table-view-cell" style="text-align: center;">
							<a href="javascript:void(0)">注销登录</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 
	<div id="picture" class="mui-popover mui-popover-action mui-popover-bottom"
		 style="position: absolute;bottom: -50px">
		<ul class="mui-table-view">
			<li class="mui-table-view-cell">
				<a id="tmpa" href="#">拍照或录像</a>
			</li>
		</ul>
		<ul class="mui-table-view">
			<li class="mui-table-view-cell">
				<a href="#picture"><b>取消</b></a>
			</li>
		</ul>
	</div> -->
</body>

<script src="../js/mui.min.js "></script>
<script>
	apiready = function() {
		api.parseTapmode();
	}
	var dialog;
	function openDialog(type) {
		switch (type) {
		//头像
		case "head":
			
			break;
		//修改手机
		case "phone":
			dialog = new auiDialog();
			dialog.prompt({
				title : "修改手机号",
				text : '请输入手机号',
				type : 'number',
				buttons : [ '取消', '确定' ]
			}, function(ret) {
				if (ret.buttonIndex == 2) {
					ajaxPost("AjaxAction!updatePhone", function(r) {
						var res = eval("("+r+")");
						var result = res['result'];
						if("fail"==result) {
							alert(result);
						} else {
							phoneNum.innerText = ret.text;
						}
					}, {"user.phone":ret.text});
				}
			});
			break;
		//修改密码
		case "password":
			var oldPsw = "";
			var newPsw = "";
			dialog = new auiDialog();
			dialog.prompt({
				title : "旧密码",
				text : '请输入旧密码',
				type : 'number',
				buttons : [ '取消', '确定' ]
			}, function(ret) {
				if (ret.buttonIndex == 2) {
					oldPsw = ret.text;
					dialog = new auiDialog();
					dialog.prompt({
						title : "新密码",
						text : '请输入新密码',
						type : 'number',
						buttons : [ '取消', '确定' ]
					}, function(ret1) {
						if (ret1.buttonIndex == 2) {
							newPsw = ret1.text;
							ajaxPost("AjaxAction!updatePsw", function(r) {
								var res = eval("("+r+")");
								var result = res['result'];
								if("success"!=result) {
									alert(result);
								} else {
									alert("修改成功！");
									
								}
							}, {"user.psw":oldPsw,"newPsw":newPsw});
						}
					});
				}
			});
			break;
		case "clear":
			android.cleanAppCache();
			break;
		//注销
		case "logout":
			dialog = new auiDialog();
			dialog.alert({
				title : "提示",
				msg : '是否注销账号',
				buttons : [ '取消', '确定' ]
			}, function(ret) {
				if(ret.buttonIndex == 2) {
					android.closeActivity('logoff');
				}
			});
			break;
		default:
			break;

		}
	}
</script>

<script>
	mui.init({
		swipeBack:true //启用右滑关闭功能
	});
	mui('body').on('shown', '.mui-popover', function(e) {
		//console.log('shown', e.detail.id);//detail为当前popover元素
	});
	mui('body').on('hidden', '.mui-popover', function(e) {
		//console.log('hidden', e.detail.id);//detail为当前popover元素
	});
	var info = document.getElementById("info");
	mui('body').on('tap', '.mui-popover-action li>a', function() {
		var a = this,
			parent;
		//根据点击按钮，反推当前是哪个actionsheet
		for (parent = a.parentNode; parent != document.body; parent = parent.parentNode) {
			if (parent.classList.contains('mui-popover-action')) {
				break;
			}
		}
		//关闭actionsheet
		mui('#' + parent.id).popover('toggle');
		info.innerHTML = "你刚点击了\"" + a.innerHTML + "\"按钮";
	});
</script>

<script src="js/dist/lrz.bundle.js"></script>
<script type="text/javascript">
document.getElementById('file_input').addEventListener('change', function () {
	var that = this;
	lrz(that.files[0], {
	    width: 200
	}).then(function (rst) {
		var img = document.getElementById('head-img');
	    $.ajax({
	        type : 'POST',
	        url : 'AjaxAction!updateHeadImg',
	        data : {"user.headImg":rst.base64},  
	        success : function(r) {
	        	var res=eval("("+r+")");
	        	var result = res['result'];
	        	if("fail" == result) {
		    		alert("头像更新失败");
		    	} else {
		    	    img.src = rst.base64;
		    	}
	        }
	    });
	    return rst;
	});
});
</script>
</html>