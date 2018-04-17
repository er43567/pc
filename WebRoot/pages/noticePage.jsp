<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
	<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
	<title>我的消息</title>
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
	  #timeline{min-height: 26rem}
	</style>
	
	<script>
	window.onscroll = function () {
	    var a = document.documentElement.scrollTop == 0 ? document.body.clientHeight : document.documentElement.clientHeight;
	    var b = document.documentElement.scrollTop == 0 ? document.body.scrollTop : document.documentElement.scrollTop;
	    var c = document.documentElement.scrollTop == 0 ? document.body.scrollHeight : document.documentElement.scrollHeight;
	    if (b != 0) {
	        if (a + b == c) {
	        	loadMore();
	        }
	    }
	};
	</script>
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
		<div id="ifNoData" style="display: none;">
		  	<iframe id="ifNoDataFrame" src="" style="width: 100%;height: 100%;position: absolute;left: 0px;top: 0px;border: none;">
		  	</iframe>
		</div>
		<div id="loadMoreBtn" class="loadMoreBtn" onclick="loadMore()">加载更多</div>
	</section>
</body>
<script type="text/javascript">
function onMsgClicked(_self, sid, type) {
	var url = "PageAction!loadReportReceivePage?report.sid="+sid+"&report.type="+type;
	if(type=="Reply") {
		url += "#nowReviewReply";
	} else if(type=="Task") {
		url = "historyTasks.jsp#" + sid;
	} else if(type=="Problem") {
		url = "PageAction!loadProblemList?problem.ref="+sid;
	}
	startUrl(url);
	setTimeout(function() {
		_self.getElementsByClassName("state-img")[0].src = "img/已读.png";
	}, 1000);
}

function onPersonClick(uid) {
	android.show(uid);
	//startUrl("UserAction!loadUserPage?report.sid="+reportId+"&report.type="+type);
}
var nextPage = 1;

loadMore();
var hasNext = true;
function loadMore() {
	if(hasNext == false) {
		return;
	}
	loadMoreBtn.innerText = "正在加载...";
	ajaxPost("AjaxAction!loadNoticeList", function(r) {
		var result = eval("("+r+")");
		if("success"==result['result']) {
			hasNext = false;
			var list = result['notices'];
			for(var i=0;i<list.length;i++) {
				var item = list[i];
				timeline.innerHTML += getItem(item.type, item.time/* .substring(0,10) */
						, item.userId, item.userName, item.ref, item.readState, item.content);
				hasNext = true;
			}
			if(hasNext) {
				nextPage++;
				loadMoreBtn.innerText = "加载更多";
			} else {
				loadMoreBtn.innerText = "没有更多数据了";
				if(nextPage == 1) {
					//如果一个数据也没有
					ifNoDataFrame.setAttribute("src", "empty.html");
					ifNoData.style.display = "block";
					loadMoreBtn.style.display = "none";
					timeline.style.display = "none";
				}
			}
		}
	}, {"page":nextPage});
}

var oldTime = null;
var count = 0;
function getItem(type, time, userId, userName, refId, readState, content) {
	var timeDiv = "<div class='aui-timeline-item-header'>"+time+"</div>";
	/* if(time == oldTime) {
		time = "";
		timeDiv = "";
	} else {
		oldTime = time;
	} */
	var readStateSrc = readState==1?"img/已读.png":"img/未读.png";
	var itemTitle = "回复消息";
	var itemContent = "";// = "来自"+userName + (type.indexOf("Report")>=0?"表单":"回复消息：" + content);
	var point = 0;
	switch(type) {
	case "ExplosiveReport":
		itemTitle = "民爆行业三查表单";
		itemContent = "收到来自"+userName +"的表单 " + content;
		point = 1;
		break;
	case "FirefightingReport":
		itemTitle = "三级消防三查表单";
		itemContent = "收到来自"+userName +"的表单 " + content;
		point = 1;
		break;
	case "HotalReport":
		itemTitle = "旅馆行业三查表单";
		itemContent = "收到来自"+userName +"的表单 " + content;
		point = 1;
		break;
	case "Task":
		itemTitle = "收到一个任务";
		itemContent = "收到来自"+userName +"的任务 " + content;
		point = 0;
		break;
	case "Reply":
		itemTitle = "收到一条回复";
		itemContent = "收到来自"+userName +"的回复 " + content;
		point = 2;
		break;
	case "Problem":
		itemTitle = "流程管控表单";
		itemContent = "收到来自" + userName +"的表单 " + content;
		point = 3;
		break;
	}
	var colorful = ["aui-bg-danger","aui-bg-warning","aui-bg-info","aui-bg-purple"];
	var colorStyle = colorful[point];
	var impts = ["任务","表单","回复","表单"];//["紧急","重要","普通"];
	var impt = impts[point];
	count++;
	var itemHtml = 
		  timeDiv
		+ "<div class='aui-timeline-item'>"
		+ "	<div class='aui-timeline-item-label "+colorStyle+" text-light' onclick='onPersonClick(\""+userId+"\")'>"+impt+"</div>"
		+ "	<div class='aui-timeline-item-inner' onclick='onMsgClicked(this,"+refId+", \""+type+"\")'>"
		+ "		<div class='aui-card-list'>"
		+ "			<div class='aui-card-list-header aui-border-b'>"
		+ "				<div class='aui-font-size-16'>"+itemTitle+"</div>"
		+ "				<img src='"+readStateSrc+"' class='state-img icon-size'>"
		+ "			</div>"
		+ "			<div class='aui-card-list-content-padded' style='color: gray;'>"
		+ "				" + itemContent
		+ "			</div>"
		+ "		</div>"
		+ "	</div>"
		+ "</div>";
	return itemHtml;
}

</script>
<script type="text/javascript">
function onReceivedNotice() {
	location.reload();
}
</script>
</html>