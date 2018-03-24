<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="en" class="feedback">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>任务发布</title>
		<link rel="stylesheet" type="text/css" href="../css/mui.min.css" />
		<link rel="stylesheet" type="text/css" href="../css/feedback.css" />
		
		<script type="text/javascript" src="js/ext.js"></script>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<button id="submit" class="mui-btn mui-btn-blue mui-btn-link mui-pull-right"
				onclick="publish()">发布</button>
			<h1 class="mui-title">任务发布</h1>
		</header>
		<div class="mui-content">
			<div class="mui-content-padded">
				<%-- <a class="mui-pull-right mui-inline" href="#popover">
					选择可见人员
					<span class="mui-icon mui-icon-arrowdown"></span>
				</a> --%>
				<!--快捷输入具体内容，开发者可自己替换常用语-->
				<!-- <div id="popover" class="mui-popover">
					<div class="mui-popover-arrow"></div>
					<div class="mui-scroll-wrapper">
						<div class="mui-scroll">
							<ul class="mui-table-view">
								仅流应用环境下显示
								<li class="mui-table-view-cell stream">
									<a href="#">桌面快捷方式创建失败</a>
								</li>
								<li class="mui-table-view-cell"><a href="#">界面显示错乱</a></li>
								<li class="mui-table-view-cell"><a href="#">启动缓慢，卡出翔了</a></li>
								<li class="mui-table-view-cell"><a href="#">偶发性崩溃</a></li>
								<li class="mui-table-view-cell"><a href="#">UI无法直视，丑哭了</a></li>
							</ul>
						</div>
					</div>

				</div> -->
			</div>
			<div class="mui-inline">任务标题</div>
			<div class="mui-input-row">
				<input id='contact' type="text" class="mui-input-clear contact" placeholder="填写任务标题" />
			</div>
			<div class="mui-inline">任务内容</div>
			<div class="row mui-input-row">
				<textarea id='question' class="mui-input-clear question" placeholder="填写任务内容"></textarea>
			</div>
			<div class="mui-inline" style="margin-top: 10px">选择可见人员</div>
			<div class="row mui-input-row">
				<div style="padding: 10px;font-size: 45px;color: grey;" onclick="startUrl('PageAction!loadUserChoosePage', ['notitle','nogesture','norefresh'])">+</div>
				<div id='resultDiv' style="position: absolute;left:40px;top:10px;color: gray;"></div>
			</div>
			<div class="mui-inline" style="margin-top: 10px">任务重要度</div>
			<div class="row mui-input-row mui-radio">
			<div class="mui-input-group">
					<div class="mui-input-row mui-radio">
						<label style="color: gray;">普通任务</label>
						<input name="style" type="radio" checked="" value="main-move">
					</div>
					<div class="mui-input-row mui-radio">
						<label style="color: gray;">重要任务</label>
						<input name="style" type="radio" value="menu-move">
					</div>
					<div class="mui-input-row mui-radio" id="move-togger">
						<label style="color: gray;">紧急任务</label>
						<input name="style" type="radio" value="all-move">
					</div>
				</div>
				<!-- <div style="position: absolute; width:300px; top: 360px; left: 80px;">
					<label><input class="aui-radio" type="radio" name="demo"
						checked="" style="margin-left:20px;">普通</label>
						 <font color="orange"><label>
						 <input class="mui-radio" type="radio" name="demo" style="margin-left: 30px;">重要</label>
							</font>
							 <font color="#F14E41">
							 <label>
							 	<input class="aui-radio" type="radio" name="demo" style="margin-left: 30px;"/>紧急
							 </label>
							 </font>
				</div> -->
		</div>
		<script src="../js/mui.min.js"></script>
		<script src=" ../js/feedback.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			mui.init();
			mui('.mui-scroll-wrapper').scroll();
		</script>
		
		<script type="text/javascript">
		var userIds;//选中的用户ID集合
		function onActivityResult(result) {
			resultDiv.innerText = result.split("##")[0];
			userIds = result.split("##")[1];
		}
		function publish() {
			android.closeActivity('refresh');
		}
		</script>
	</body>

</html>