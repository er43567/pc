<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
	<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
	<title> </title>
<!-- <link rel="stylesheet" href="../css/mui.min.css"> -->
	<link rel="stylesheet" type="text/css" href="../css/aui.css" />
	<link rel="stylesheet" href="css/ext.css" />
	<script type="text/javascript" src="js/ext.js" ></script>
	<style type="text/css">
		.text-light {
			color: #ffffff;
		}
		.icon-size{width: 25px;}
	</style>
	
	<style type="text/css">
	  .loadMoreBtn {
	  	width: 100%;
	  	height: 2.5rem;
	  	line-height: 2.5rem;
	  	text-align:center;
	  	border-top: 1px solid #d3d3d3;
	  	border-bottom: 1px solid #d3d3d3;
	  	color: gray;
	  }
	  #timeline{min-height: 89%}
	</style>
</head>

<body>
	<!--<header class="aui-bar aui-bar-nav" id="header" style="padding-top:15px; position:fixed;">
		<div class="aui-pull-left aui-padded-l-0">
			<a class=" aui-btn aui-iconfont aui-icon-left" tapmode onclick="closeWin();"></a>
		</div>
		<div class="aui-title">
			任务列表
		</div>
		<div class="aui-pull-right">
			<a class="aui-btn aui-iconfont aui-icon-plus" href="javascript:startUrl('addTask.html')"></a>
		</div>
	</header>
	<div class="header-bottom"></div>-->
	<section id="pullrefresh" class="aui-content">
		<div id="timeline" class="aui-timeline">
			<!-- <div class="aui-timeline-item-header">2017年1月8日</div>
			<div class="aui-timeline-item">
				<div class="aui-timeline-item-label aui-bg-danger text-light" onclick="onPersonClick('123')">某某某</div>
				<div class="aui-timeline-item-inner" onclick="onMsgClicked(157, 'ExplosiveReport')">
					<div class="aui-card-list">
						<div class="aui-card-list-header aui-border-b">
							<div class="aui-font-size-16">表单查阅通知</div>
							<img src="img/已读.png" class="state-img icon-size">
							<img src="img/未读.png" class="state-img icon-size">
						</div>
						<div class="aui-card-list-content-padded" style="color: gray;">
							民爆行业质检表单
						</div>
					</div>
				</div>
			</div>
			
			<div class="aui-timeline-item-header">2017年1月8日</div>
			<div class="aui-timeline-item">
				<div class="aui-timeline-item-label aui-bg-warning text-light">某某某</div>
				<div class="aui-timeline-item-inner">
					<div class="aui-card-list">
						<div class="aui-card-list-header aui-border-b">
							<div>标题</div>
							<i class="aui-iconfont aui-icon-date aui-text-danger"></i>
							<i class="aui-iconfont aui-icon-correct aui-text-danger"></i>
						</div>
						<div class="aui-card-list-content-padded">
							内容
						</div>
					</div>
				</div>
			</div>
			<div class="aui-timeline-item-header">2017年1月8日</div>
			<div class="aui-timeline-item">
				<div class="aui-timeline-item-label aui-bg-info text-light">某某某</div>
				<div class="aui-timeline-item-inner">
					<div class="aui-card-list">
						<div class="aui-card-list-header aui-border-b">
							<div>标题</div>
							<i class="aui-iconfont aui-icon-date aui-text-danger"></i>
							<i class="aui-iconfont aui-icon-correct aui-text-danger"></i>
						</div>
						<div class="aui-card-list-content-padded">
							内容
						</div>
					</div>
				</div>
			</div> -->
		</div>
		<div id="loadMoreBtn" class="loadMoreBtn" onclick="loadMore()">加载更多</div>
	</section>
</body>
<script type="text/javascript">
function onMsgClicked(_self, reportId, type) {
	startUrl("PageAction!loadReportReceivePage?report.sid="+reportId+"&report.type="+type);
	setTimeout(function(){
		_self.getElementsByClassName("state-img")[0].src = "img/已读.png";
	}, 1000);
}

function onPersonClick(uid) {
	android.show(uid);
	//startUrl("UserAction!loadUserPage?report.sid="+reportId+"&report.type="+type);
}

loadMore();

var nextPage = 1;
var hasNext = true;
function loadMore() {
	if(hasNext == false) {
		return;
	}
	ajaxPost("AjaxAction!loadNoticeList", function(r) {
		var result = eval("("+r+")");
		if("success"==result['result']) {
			hasNext = false;
			var list = result['notices'];
			for(var i=0;i<list.length;i++) {
				var item = list[i];
				timeline.innerHTML += getItem(item.type, item.time.substring(0,10)
						, item.userId, item.userName, item.ref, item.readState);
				hasNext = true;
			}
			if(hasNext) {
				nextPage++;
			} else {
				loadMoreBtn.innerText = "没有更多数据了";
			}
		}
	}, {"page":nextPage});
}

var oldTime = null;
var count = 0;
function getItem(type, time, userId, userName, refId, readState) {
	var timeDiv = "<div class='aui-timeline-item-header'>"+time+"</div>";
	if(time == oldTime) {
		time = "";
		timeDiv = "";
	} else {
		oldTime = time;
	}
	var readStateSrc = readState==1?"img/已读.png":"img/未读.png";
	var itemTitle = "来自"+userName+"的" + time + (type.indexOf("Report")>=0?"日表单":"回复消息");
	var itemContent = "";
	switch(type) {
	case "ExplosiveReport":
		itemContent = "民爆行业质检表单";
		break;
	case "FirefightingReport":
		itemContent = "三级消防质检表单";
		break;
	case "HotalReport":
		itemContent = "旅馆行业质检表单";
		break;
	}
	var colorful = ["aui-bg-danger","aui-bg-warning","aui-bg-info"];
	var colorStyle = colorful[count%colorful.length];
	var impts = ["紧急","重要","普通"];
	var impt = impts[count%colorful.length];
	count++;
	var itemHtml = 
		  timeDiv
		+ "<div class='aui-timeline-item'>"
		+ "	<div class='aui-timeline-item-label "+colorStyle+" text-light' onclick='onPersonClick(\""+userId+"\")'>"+impt+"</div>"
		+ "	<div class='aui-timeline-item-inner' onclick='onMsgClicked(this,"+refId+", \""+type+"\")'>"
		+ "		<div class='aui-card-list'>"
		+ "			<div class='aui-card-list-header aui-border-b'>"
		+ "				<div class='aui-font-size-16'>"+itemContent+"</div>"
		+ "				<img src='"+readStateSrc+"' class='state-img icon-size'>"
		+ "			</div>"
		+ "			<div class='aui-card-list-content-padded' style='color: gray;'>"
		+ "				" + itemTitle
		+ "			</div>"
		+ "		</div>"
		+ "	</div>"
		+ "</div>";
	return itemHtml;
}

</script>
</html>